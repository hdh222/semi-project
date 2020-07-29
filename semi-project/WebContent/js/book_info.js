$(window).resize(function(){
		var windWidth=$(window).innerWidth();
		if(windWidth<550){
			$("#backBtn").hide();
		}else if(windWidth>550)
			$("#backBtn").show();
})