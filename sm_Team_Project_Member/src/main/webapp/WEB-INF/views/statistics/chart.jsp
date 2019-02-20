<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

	<style type="text/css">
	#chart_wrapper{
		width: 500px;
		height: 500px;
	}
	</style>
	
	<script type="text/javascript">
	
	function caGroup(chart_data, ca_g){
		var l = new Array();
		var d = new Array();
		
		var c = new Array();
		var cb = new Array();
		
		for(var i =0; i< chart_data.length; i++){
			if(chart_data[i].group == ca_g){
				l.push(chart_data[i].memo);
				d.push(chart_data[i].amount);
				
				var r = Math.floor(Math.random()*256);
				var g = Math.floor(Math.random()*256);
				var b = Math.floor(Math.random()*256);
				
				c.push("rgba("+r+","+ g+","+b+",0.4)");
				cb.push("rgba("+r+","+ g+","+b+",1)");
			}
		}
		
		return [l, d, c, cb];
	}
	/*
	function drawCanvas(label,amount,chart_color){
		
 		$("#canvas_chart").remove();
 		
		$("#chart_wrapper").append('<canvas id="canvas_chart" width="200" height="200" ></canvas>'); 
		var ctx = $("#canvas_chart");
		
		myChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		        labels: label,
		        datasets: [{
		            data: amount,
		            backgroundColor: chart_color,
		            borderColor: chart_color ,
		            borderWidth: 1
		        }]
		    }
		});
	}
	*/
	
	function updateChart(myChart, label, amount,chart_color){
		myChart.data.labels = label;	
		myChart.data.datasets[0].data = amount;
		myChart.data.datasets[0].backgroundColor = chart_color;
		myChart.data.datasets[0].borderColor = chart_color;

		myChart.update();
	}
	
	
	$(function(){
		// 개별 컬러값 저장
		var chart_color = new Array();
	//	var chart_border_color = new Array();
	
		// chart 데이터 리스트
		var chart_data = new Array();
		var label = new Array();
		var amount = new Array();
		
		//var print_data = {};
		
		// 수입/지출 총액
		var totalAmount = 0;

		// add chart_data
		<c:forEach items="${chartData }" var="cd">
			var data = {
				memo: "${cd.data_Memo}",
				amount: "${cd.data_Amount}",
				
				group: "${cd.ca_Group}",
				date: "${cd.data_Date}",
				cate_key: "${cd.ca_Key}",
				cate_type: "${cd.ca_Type}",
				cate_val: "${cd.ca_Value}"
			}
			
			chart_data.push(data);
			totalAmount += Number(data.amount);
			
			// 카테고리별 묶음
			if($.inArray("${cd.ca_Value}",label) != -1){
				var idx = label.indexOf("${cd.ca_Value}");
				//var idx = $.inArray("${cd.ca_Type}",label);
			//	alert(idx);
				var v2 = Number($(amount).get(idx))+ Number(data.amount);
				amount[idx] = v2;
				console.log(data.cate_val+"+"+data.memo);
				console.log($(amount).get(idx));
				console.log(amount[idx]);
				console.log("=============");
			} else{
 				label.push("${cd.ca_Value}");
				amount.push("${cd.data_Amount}"); 
			}
			
			var r = Math.floor(Math.random()*256);
			var g = Math.floor(Math.random()*256);
			var b = Math.floor(Math.random()*256);
			
			chart_color.push("rgba("+r+","+ g+","+b+",0.2)");  
		//	chart_border_color.push("rgba("+r+","+ g+","+b+",1)");
		</c:forEach>
		
		console.log(amount);
		// Draw Chart
		//drawCanvas(label, amount, chart_color);
		var ctx = $("#canvas_chart");
		
		myChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		        labels: label,
		        datasets: [{
		            data: amount,
		            backgroundColor: chart_color,
		            borderColor: chart_color ,
		            borderWidth: 1
		        }]
		    }
		});
		$("#chart_statistics").text("총액: " +totalAmount+"원");
	
		
		// 수입/지출 선택
		$(".ca_group").change(function(){
			chart_data = [];
			label = [];
			amount = [];
			chart_color =[];
		//	chart_border_color = [];
			
			$.ajax({
				url: "chart2.go",
				method: "get",
				data: {"ca_group": $("input:radio[name=ca_group]:checked").val() },
				dataType: "json",
				
				success: function(data){
					var totalAmount = 0;
					
					$.each(data, function(index, value){
						var dd = {
							memo: value.data_Memo,
							amount: value.data_Amount,
							
							group: value.ca_Group,
							date: value.data_Date,
							cate_key: value.ca_Key,
							cate_type: value.ca_Type,
							cate_val: value.ca_Value
						}
						chart_data.push(dd);
						totalAmount += dd.amount;
						
						if($.inArray(value.ca_Value ,label) != -1){
							var idx = $.inArray(value.ca_Value,label);
							//alert(idx);
							amount[idx] = (amount[idx]*1)+  value.data_Amount;
						} else{
			 				label.push(value.ca_Value);
							amount.push(value.data_Amount); 
						}
						/* label.push(value.data_Memo);
						amount.push(value.data_Amount); */
						
						var r = Math.floor(Math.random()*256);
						var g = Math.floor(Math.random()*256);
						var b = Math.floor(Math.random()*256);
						
						chart_color.push("rgba("+r+","+ g+","+b+",0.2)"); 
				//		chart_border_color.push("rgba("+r+","+ g+","+b+",1)");
					});
					
					updateChart(myChart, label, amount, chart_color);
					$("#chart_statistics").text("총액: " +totalAmount+"원");
					$("#chart_dataContents").text("");
				} 
				
			});
		});    
		
		$("#canvas_chart").click(function(evt){
		    var activePoints = myChart.getElementsAtEvent(evt);
		    
		    if (activePoints[0]) {
		        var chartData = activePoints[0]['_chart'].config.data;
		        var idx = activePoints[0]['_index'];

		        var label = chartData.labels[idx];
		        var value = chartData.datasets[0].data[idx];

		        var url = "http://example.com/?label=" + label + "&value=" + value;
		        console.log(url);
//				alert(url);
		        
		        var data_contents = "";
		        $.each(chart_data, function(i, v){
		        	if(v.cate_val == label){
		        		data_contents += v.cate_val +" "+ v.memo +" "+v.amount +"원 "+ v.date+"<br>";
		        	}
		        });

		        $("#chart_dataContents").html(data_contents);
		      }
		});
		
	});
	
	</script>
	
</head>
<body> 
<div  class="chartDIV">
<div>
	<input type="radio" name="ca_group" class="ca_group" value="1"> <span class="ca_span">INCOME</span> 
	<input type="radio" name="ca_group" class="ca_group" value="2" checked="checked"> <span class="ca_span">OUTCOME</span> 
</div> 

<div id="chart_wrapper">
<canvas id="canvas_chart" width="500" height="500"></canvas>
</div>

<div id="chart_statistics" class="chart_statistics">
총액:  원 
</div>

<div id="chart_dataContents"  class="chart_dataContents"></div>
</div> 
</body>
</html>
