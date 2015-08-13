<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
	<head>
	<title>烟草物流后台系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript"
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"  charset="UTF-8">
</script>

		<script type="text/javascript" charset="UTF-8">

$(function() {
	$('#container').highcharts( {
		colors: [ '#058DC7', '#50B432', '#ED561B', '#DDDF00'],
		chart : {
			type : 'spline'
		},
		title : {
			text : '<s:property value='searchType'/>-曲线图'
		},
		xAxis : {
			categories :
				[<s:iterator value="reportList">'<s:property value="rpDate"/>',</s:iterator>],
			title : {
				text : null
			}
		},
		yAxis : {
			min : 0,
			title : {
				text : null
			},
			labels : {
				overflow : 'justify'
			}
		},
		tooltip : {
			crosshairs: true,
                shared: true

		},
		plotOptions : {
			column : {
				dataLabels: {
                    enabled: true
                    }
            }
            
		},
		
		credits : {
			enabled : false
		},
		series : [ {
			name : '重量',
			data : [<s:iterator value="reportList"><s:property value="totalWeight"/>,</s:iterator>]
		}, {
			name : '体积',
			data : [<s:iterator value="reportList"><s:property value="totalVolume"/>,</s:iterator>]
		}, {
			name : '收入',
			data : [<s:iterator value="reportList"><s:property value="totalIncome"/>,</s:iterator>]
		} ]

	});
});

</script>
	</head>
	<body>
		<script src="../js/highcharts.js"  charset="UTF-8">
</script>
		<script src="../js/exporting.js"  charset="UTF-8">
</script>

		<div id="container"
			style="min-width: 400px; height: 400px; margin: 0 auto"></div>
	</body>
</html>
