$(document).ready(function() {
	/*tooltip*/
	$('#1').popover({
		trigger : "hover"
	});
	/*smooth scroll*/
	var $root = $('html, body');
	$('a').click(function() {
		var href = $.attr(this, 'href');
		$root.animate({
			scrollTop : $(href).offset().top
		}, 500, function() {
			window.location.hash = href;
		});
		return false;
	});
});

