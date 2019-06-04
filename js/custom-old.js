//scroll to top
$(document).ready(function() {
	
	var page_id = window.location.pathname.slice(-3);
	if (page_id == 142 || page_id == 141){
		$('#issueCoverImage').hide();
	}
	
	var get_current_page = window.location.pathname.split("/").slice(-1)[0];
	/* Online first */
	if (get_current_page == 'current'){
		$('.article-section-title-author').eq(0).append('<p class="online-first-date">August 30, 2016</p>');
		$('.article-section-title-author').eq(1).append('<p class="online-first-date">August 24, 2016</p>');
		$('.article-section-title-author').eq(2).append('<p class="online-first-date">August 8, 2016</p>');
		$('.article-section-title-author').eq(3).append('<p class="online-first-date">July 19, 2016</p>');
		$('.article-section-title-author').eq(4).append('<p class="online-first-date">July 12, 2016</p>');
		$('.article-section-title-author').eq(5).append('<p class="online-first-date">June 21, 2016</p>');
		$('.article-section-title-author').eq(6).append('<p class="online-first-date">May 19, 2016</p>');
		$('.article-section-title-author').eq(7).append('<p class="online-first-date">August 16, 2016</p>');
		$('.article-section-title-author').eq(8).append('<p class="online-first-date">July 26, 2016</p>');
		$('.article-section-title-author').eq(9).append('<p class="online-first-date">June 28, 2016</p>');
	}
	
	/* Journal */
	if (get_current_page == '139'){
		$('.article-section-title-author').eq(0).append('<p class="online-first-date">July 22, 2016</p>');
		$('.article-section-title-author').eq(1).append('<p class="online-first-date">July 24, 2016</p>');
	}

	/* FMES */
	if (get_current_page == '141'){
		$('.article-section-title-author>.row:nth-child(1)').css({'font-weight': 'bold'});	
	}

	/* Opportunities*/
	if (get_current_page == '142'){
		$('.article-section-title-author>.row:nth-child(1)').css({'font-weight': 'bold'});
	}
	

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