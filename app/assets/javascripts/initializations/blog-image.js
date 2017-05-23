$(function() {
    var w = $(window).width();
    var x = 768;
    if (w <= x) {
			$(".cover-image").addClass("hidden");
      $(".cover-image-mobile").removeClass("hidden")
    } else {
      $(".cover-image-mobile").addClass("hidden");
    }

    var timer = false;
    $(window).resize(function() {
        if (timer !== false) {
            clearTimeout(timer);
        }
        timer = setTimeout(function() {
            var w = $(window).width();
            var x = 768;
            if (w <= x) {
              $(".cover-image").addClass("hidden");
              $(".cover-image-mobile").removeClass("hidden")
            } else {
              $(".cover-image-mobile").addClass("hidden");
              $(".cover-image").remoceClass("hidden");
            }
        }, 200);
    });

});
