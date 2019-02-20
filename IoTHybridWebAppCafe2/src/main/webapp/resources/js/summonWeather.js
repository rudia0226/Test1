function connectWeatherSummonEvent() {
	var url = 'http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=baff8f3c6cbc28a4024e336599de28c4&units=metric';
	url += "&callback=?";
	$(document).click(function(e) {
		$.getJSON(url, function(json) {
			var weather = json.weather[0].description;
			var img = json.weather[0].icon;
			var temp = json.main.temp;
			var img = 'https://openweathermap.org/img/w/' + img + '.png';
			$("#wtImg").attr("src", img);
			$("#wt").text(weather);
			$("#temp").text(temp + "กษ");
		});

		$("#weather").css("left", e.pageX + "px");
		$("#weather").css("top", e.pageY + "px");
		$("#weather").css("opacity", "1");

		setTimeout(function() {
			$("#weather").css("opacity", "0");
		}, 3000);
	})
}
