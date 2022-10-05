listing_id = document.getElementById('listing_id')

axiosGET(`${listing_id.value}/reviews/collected_texts`)
.then((res) => res['data'])  
.then((res) => {
    return draw(res, 50)
  })
  .catch((error) => console.log(error.message));


function draw(words, maxItems) {
  data = words.join('')

  // create a chart
  let chart = anychart.tagCloud();
  let ignoreItems = ['and', 'he', 'or', 'of', 'in', 'thy', 'to', 'a', 'an', 'the', 'i', 'is', 'was', 'were']
  
  // set the parsing mode and configure parsing settings
  chart.data(data, {
    mode: 'by-word',
    maxItems: maxItems,
    ignoreItems: ignoreItems,
  });

  // set the container id
  document.getElementById('cloud').remove();

  let cloud = document.createElement('div');
  cloud.id = 'cloud';
  document.getElementById('container').appendChild(cloud);

  chart.container('cloud');

  // initiate drawing the chart
  chart.draw();
}