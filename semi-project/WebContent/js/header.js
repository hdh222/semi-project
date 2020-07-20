$(window).scroll(function(e) {
	if($(window).scrollTop()>70) {
		$("#nav").addClass("container fixed-top");
	} else {
		$("#nav").removeClass("container fixed-top");
	}
});