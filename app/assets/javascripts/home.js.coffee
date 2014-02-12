$(document).ready ->
	$(window).scroll ->
		if $(window).scrollTop() >= 180
			console.log ">=180"
			$('#logo_site').addClass('logo-two')
			$('#logo_site').removeClass('logo-one')
			$('.menu-top').css("padding-top":"5px")

		else
			console.log "<=180"
			$('#logo_site').addClass('logo-one')
			$('#logo_site').removeClass('logo-two')
			$('.menu-top').css("padding-top":"125px")