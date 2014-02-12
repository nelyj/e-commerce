$(document).ready ->
	$(window).scroll ->
		if $(window).scrollTop() >= 180
			$('#logo_site').addClass('logo-two').removeClass('logo-one')
			$('.menu-top').css("padding-top":"5px")

		else
			$('#logo_site').addClass('logo-one').removeClass('logo-two')
			$('.menu-top').css("padding-top":"125px")