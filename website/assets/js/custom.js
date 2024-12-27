$(document).ready(function(){
	"use strict";
    
        /*==================================
* Author        : "ThemeSine"
* Template Name : Khanas HTML Template
* Version       : 1.0
==================================== */

/*=========== TABLE OF CONTENTS ===========
1. Scroll To Top 
2. Smooth Scroll spy
3. Progress-bar
4. owl carousel
5. welcome animation support
======================================*/

    // 1. Scroll To Top 
		$(window).on('scroll', function () {
			if ($(this).scrollTop() > 600) {
				$('.return-to-top').fadeIn();
			} else {
				$('.return-to-top').fadeOut();
			}
		});
		$('.return-to-top').on('click', function(){
			$('html, body').animate({
				scrollTop: 0
			}, 1000);
			return false;
		});
	
	
	// 2. Smooth Scroll spy

	$('.header-area').sticky({
		topSpacing: 0
	});

	//=============

	$('li.smooth-menu a').bind("click", function(event) {
		event.preventDefault();
		var anchor = $(this);
		var offset = 85;

		$('html, body').stop().animate({
			scrollTop: $(anchor.attr('href')).offset().top - offset
		}, 1200, 'easeInOutExpo');
	});

	// Scrollspy with offset
	$('body').scrollspy({
		target: '.navbar-collapse',
		offset: 250 // Ajusta o valor conforme a necessidade
	});


	// // 3. Progress-bar
	
	// 	var dataToggleTooTip = $('[data-toggle="tooltip"]');
	// 	var progressBar = $(".progress-bar");
	// 	if (progressBar.length) {
	// 		progressBar.appear(function () {
	// 			dataToggleTooTip.tooltip({
	// 				trigger: 'manual'
	// 			}).tooltip('show');
	// 			progressBar.each(function () {
	// 				var each_bar_width = $(this).attr('aria-valuenow');
	// 				$(this).width(each_bar_width + '%');
	// 			});
	// 		});
	// 	}

    // 4. welcome animation support

        $(window).on('DOMContentLoaded', function(){
        	$(".header-text h2,.header-text p").removeClass("animated fadeInUp").css({'opacity':'0'});
            $(".header-text a").removeClass("animated fadeInDown").css({'opacity':'0'});
        });

        $(window).on('DOMContentLoaded', function(){
        	$(".header-text h2,.header-text p").addClass("animated fadeInUp").css({'opacity':'0'});
            $(".header-text a").addClass("animated fadeInDown").css({'opacity':'0'});
        });

});	
