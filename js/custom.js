//scroll to top
$(document).ready(function() {

	$('#pdfDownloadLink').click(function(){
		var that=this;
		_gaq.push(['_trackEvent','Download','PDF',this.href]);
		setTimeout(function(){
			location.href=that.href;
		},200);
		return false;
	});
	
	// hide #back-top first
	$(".scroll-to-top").hide();

	// fade in #back-top
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('.scroll-to-top').fadeIn();
			} else {
				$('.scroll-to-top').fadeOut();
			}
		});

		// scroll body to 0px on click
		$('.scroll-to-top a').click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, 800);
			return false;
		});
	});
	
	if ($('#articleCitations')[0]) {
		var widgetHTML = $('#articleCitations').html();
		//alert(widgetHTML);
		widgetHTML = widgetHTML.replace(/<p>/g, '<li>');
		widgetHTML = widgetHTML.replace(/<\/p>/g, '</li>');
		widgetHTML = widgetHTML.replace(/<div>/g, '<ol>');
		widgetHTML = widgetHTML.replace(/<\/div>/g, '</ol>')
		$('#articleCitations').html(widgetHTML);	
	}
	

});

//tooltip
$(document).ready(function() {
 $(function() {
		$("a[rel='tooltip']").popover({
			trigger : "hover"
		});
	});
});


  $(function(){
    $('.dropdown').hover(function() {
        $(this).addClass('open');
    }, function() {
        $(this).removeClass('open');
    });
});

//disable state msg on archives page
$(document).ready(function() {
	$(".disable-state > a").attr('title', 'Sorry, we are in the process of migrating the IJME \n Archives data to our new site. This issue should \n be available soon. Please visit www.ijme.in again!');
});

$(document).ready(function(){
	$("#submitStart a").click(function(){
		return show_submission_closed_modal();
	});
});
function show_submission_closed_modal() {
    $('#submission-closed-modal').modal();
	return false;
}