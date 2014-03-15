$(document).ready ->
	$('.carousel').carousel()

	$('.carousel').carousel
    interval: 2000
    pause: "hover"
    wrap: true

   $("a[href*=#]:not([href=#])").click ->

    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      target = $(@hash)
      target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
      if target.length
      	if @hash.slice(1) == "home"

      		$("html,body").animate
	          scrollTop: 0
	        , 1000
	        false
      	else

	        $("html,body").animate
	          scrollTop: target.offset().top - 45
	        , 1000
	        false
