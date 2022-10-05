require 'kimurai'

class Scraping::Airbnb < Kimurai::Base
  @name = 'airbnb'
  @engine = :selenium_chrome
  @@result = {}

  def self.call(urls)
    @start_urls = urls
    crawl!
    @@result
  end

  def parse(response, url:, data: {})

    sleep 1

    response = browser.current_response

    name = response.xpath("//h1").map(&:text).first

    @@result[:name] = name


    browser.find(:xpath, "//main[@id='site-content']//section//span[@class='_s65ijh7']/button").click

    sleep 2

    response = browser.current_response

    reviews_path = "//div[@role='dialog']//div[@data-testid='pdp-reviews-modal-scrollable-panel']/div[@data-review-id]"
    count = response.xpath(reviews_path).count
    
    loop do
      browser.execute_script('document.querySelector("div[class=\'_17itzz4\']").scrollBy(0,10000)')

      sleep 2

      response = browser.current_response

      new_count = response.xpath(reviews_path).count
      if count == new_count
        Rails.logger.info ">>>>>>>> Pagination is done" and break
      else
        count = new_count
        Rails.logger.info ">>>>>>>> Continue scrolling, current count is #{count}..."
      end
    end

    reviews = []

    response.xpath(reviews_path).each do |review|
      external_id = review["data-review-id"].to_i
      reviewer_name = review.css('h3').text
      text = review.css('span span').text
      date = Date.parse(review.css('ol li').text)

      review = Review.find_or_initialize_by(external_id: external_id)
      review.assign_attributes(
        reviewer_name: reviewer_name, 
        text: text,
        date: date
      )

      reviews << review
    end

    @@result[:reviews_count] = reviews.length
    @@result[:reviews] = reviews
  end
end