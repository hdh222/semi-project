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
	var value=$("#index").val();
	
	//alert(value);
	if(value != "") { 
		var index=$("#nav").children("a")[value];
		$(index).addClass("menu_select");
	}
	
	if(window.innerWidth<1200) {	
		$("#login_status").children("span").hide();
		$("#signIn").hide();
		$("#login status").children("a")
		.attr("data-toggle","tooltip")
		.attr("title",status);
	}else {
		$("#login_status").children("span").show();
		$("#signIn").show();
	}
});

$(window).resize(function() {
	if(window.innerWidth<1200) {
		$("#login_status").children("span").hide();
		$("#signIn").hide();
	}else {
		$("#login_status").children("span").show();
		$("#signIn").show();
	}
});