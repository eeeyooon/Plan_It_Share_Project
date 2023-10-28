<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<style>
	section {
      display: flex;
   }

   #admin-submenu {
      width: 200px;
      height: 300px;
      margin-right: 50px;
      margin-top: 100px;
   }
   
   #admin-submenu li {
      list-style: none;
      margin-bottom: 15px;
      font-size: 23px;
      font-weight: bold;
   }
   
   #admin-submenu li:nth-child(3) a { color : #6DA2DF; }
   
   .highcharts-figure,
   .highcharts-data-table table {
       min-width: 360px;
       max-width: 800px;
       margin: 1em auto;
   }

   .highcharts-data-table table {
       font-family: Verdana, sans-serif;
       border-collapse: collapse;
       border: 1px solid #ebebeb;
       margin: 10px auto;
       text-align: center;
       width: 100%;
       max-width: 500px;
   }

   .highcharts-data-table caption {
       padding: 1em 0;
       font-size: 1.2em;
       color: #555;
   }

   .highcharts-data-table th {
       font-weight: 600;
       padding: 0.5em;
   }

   .highcharts-data-table td,
   .highcharts-data-table th,
   .highcharts-data-table caption {
       padding: 0.5em;
   }

   .highcharts-data-table thead tr,
   .highcharts-data-table tr:nth-child(even) {
       background: #f8f8f8;
   }

   .highcharts-data-table tr:hover {
       background: #f1f7ff;
   }
   
   .table {
   	  text-align: center;
   }
   
</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		<%@ include file="/WEB-INF/views/inc/adminsubmenu.jsp" %>
	    <div id="container"></div>
	    <div>
	    <table class="table table-bordered user">
			<tr>
				<th>날짜</th>
				<th>남녀비율</th>
			</tr>
			<c:forEach items="${wlist}" var="week">
			<tr>
				<td>${week.regdate}</td>
				<td>${week.MPercent}/${week.FPercent}</td>
			</tr>
			</c:forEach>
		</table>
		</div>
		</section>	
	</main>

    <script>

        Highcharts.chart('container', {

            title: {
                text: '남녀 회원가입 정보'
            },
            
            subtitle: {
                text: '(단위:일)'
            },
            
            yAxis: {
                title: {
                    text: '가입자 수'
                }
            },

            xAxis: {
            	title: {
                    text: '최근 일주일'
                }
            },

            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },

            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 1
                }
            },

            series: [{
                name: '남자',
                data: ${mdata}
            }, 
            {
                name: '여자',
                data: ${fdata}
            }],

            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }

        });

    </script>


</body>
</html>