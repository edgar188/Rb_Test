# RB_Test

Things you may want to cover:

## Ruby version
* 2.7.2
## Rails version
* 6.1.5
## System dependencies
* Node(>=12)
* Webpack
* Postgresql
* Redis
* Sidekiq
* Kimurai
## Configuration
* sudo apt-get install chromium-chromedriver
* git clone https://github.com/edgar188/Rb_Test.git
* cd RB_Test
* bundle i
* rails webpacker:install
* rails webpacker:compile
* add .env variable to project root path
  ##### DB CONFIGS 
  * DB_USER=username
  * DB_PASS=password
  * DB_NAME=db_name
  * POOL_THREADS=5
  * HOST=localhost
  ##### SIDEKIQ CONFIGS 
  * SIDEKIQ_USERNAME=username
  * SIDEKIQ_PASSWORD=password
## Database creation
* rails db:create
## Database initialization
* rails db:migrate
## Services (job queues, cache servers, search engines, etc.)
* rails s
* bundle exec sidekiq -C config/sidekiq.yml