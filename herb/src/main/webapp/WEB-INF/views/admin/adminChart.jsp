<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['month', '월별 매출액'],
            ['2021.3', ${totalSales}],
            ['2021.2', 0],
            ['2021.1', 0],
            ['2020.12', 0]
        ]);

        var options = {
          curveType: 'function',
          legend: { position: 'bottom' },
          series:{0:{color:'#e7ab3c'}}
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
<body>
<div id="curve_chart" style="height: 300px"></div>
</body>
</html>