$(window).scroll(function(e) {
	if($(window).scrollTop()>70) {
		$("#nav").addClass("container fixed-top border-bottom");
	} else {
		$("#nav").removeClass("container fixed-top border-bottom");
	}
});

$("#nav>a").on("click",function() {
	$("#nav>a").addClass("text-primary");
});

$(document).ready(function() {
	if(window.innerWidth<1200) {	
		$("#login_status").children("span").hide();
		$("#login status").children("a")
		.attr("data-toggle","tooltip")
		.attr("title",status);
	}else {
		$("#login_status").children("span").show();
	}
});

$(window).resize(function() {
	if(window.innerWidth<1200) {
		$("#login_status").children("span").hide();
	}else {
		$("#login_status").children("span").show();
	}
});

