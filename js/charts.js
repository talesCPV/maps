google.charts.load('current', {'packages':['corechart']});
//google.charts.setOnLoadCallback(drawChart);




function drawChart(dat) {

  var data = google.visualization.arrayToDataTable(dat);


  var options = {
    title: '',
    legend: 'none',
    hAxis: {title: 'Km',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0}
  };

  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
  chart.draw(data, options);
}

function plotAlt(){

  var alt = [];
  alt.push(["0","m","m"]);
  
  for(i=seg_tot[0];i<seg_tot[1];i++){
    var A = [Data[i][5],Data[i][6]];
    var B = [Data[i+1][5],Data[i+1][6]];

    var as = 0;

    if(i>=seg_parc[0] && i<=seg_parc[1]){
      as += parseInt(Data[i][2]);
    }
    alt.push([Data[i][0],parseInt(Data[i][2]),as]);
  }
  google.setOnLoadCallback(function() { drawChart(alt); });

} 