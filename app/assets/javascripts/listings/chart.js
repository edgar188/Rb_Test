listing_id = document.getElementById('listing_id')

axiosGET(`${listing_id.value}/collected_reviews`)
  .then((res) => res['data'])
  .then((res) => {
    return render_reviews_chart(res)
  })
  .catch((error) => console.log(error.message));

  
let render_reviews_chart = reviews => {
  const labels = reviews['labels']
  const values = reviews['values']
  const ctx = document.getElementById("myChart").getContext('2d');

  let myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [
        {
          label: 'Reviews',
          backgroundColor: "#00004d",
          data: values,
        }]
    },
    options: {
      tooltips: {
        displayColors: true,
        callbacks: {
          mode: 'x',
        },
      },
      scales: {
        xAxes: [{
          stacked: true,
          gridLines: {
            display: false,
          }
        }],
        yAxes: [{
          stacked: true,
          ticks: {
            beginAtZero: true,
          },
          type: 'linear',
        }]
      },
      responsive: true,
      maintainAspectRatio: false,
      legend: { position: 'bottom' },
    }
  });
}
