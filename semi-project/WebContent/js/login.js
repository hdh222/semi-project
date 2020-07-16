$(document).ready(function() {
	if (window.innerWidth < 990) {
		$('#carousel').hide();
	} else {
		$('#carousel').show();
	}
});

$(window).resize(function() {
	if (window.innerWidth < 990) {
		$('#carousel').hide();
	} else {
		$('#carousel').show();
	}
});