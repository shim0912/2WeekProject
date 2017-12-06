
$(function() {
	$("#search").click(
			function() {
				var code = $(".address").val();
				$.ajax({
					type : "GET",
					url : "xe.do?command=weather&code=" + code,
					dataType : "text",
					success : function(data) {
						
						var temp = $.trim(data);
						var obj = JSON.parse(temp);

						$("#temp").val(obj.temp);
						$("#reh").val(obj.reh);
						$("#pop").val(obj.pop);
						$("#wfKor").val(obj.wfKor);
						
						var weather_condition = obj.wfKor;
						if (weather_condition == "맑음"){
							$("#weather_img").attr("src","/2WeekProject/image/sun.png");
						}else if (weather_condition == "비"){
							$("#weather_img").attr("src","/2WeekProject/image/rain.png");
						}else if (weather_condition == "눈"){
							$("#weather_img").attr("src","/2WeekProject/image/snow.png");
						}else if (weather_condition == "흐림"){
							$("#weather_img").attr("src","/2WeekProject/image/cloud.png");
						}else if (weather_condition == "구름 조금"){
							$("#weather_img").attr("src","/2WeekProject/image/cloud_sun.png");
						}else{
							$("#weather_img").attr("src","/2WeekProject/image/etc.png");
						}
					},
					error : function() {
						alert("정보를 불러오는데 실패하였습니다.");
					}
				});
			});
});
