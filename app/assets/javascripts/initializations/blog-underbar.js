var BlogBar = {
  init: function() {
    if (!$('[data-page="blog-bar"]').length > 0) {
      return;
    }

    var lastScrollTop = 0;
    var $underBar = $('[data-behavior="animated-bar"]');
    $(window).scroll(function(event) {
      var st = $(this).scrollTop();

      if (st > lastScrollTop) {
        $underBar.removeClass('is-inView');
        $underBar.addClass('is-hidden');
      } else {
        $underBar.removeClass('is-hidden');
        $underBar.addClass('is-inView');
      }
      lastScrollTop = st;
    });
  }
};

$(document).ready( BlogBar.init );
$(document).on( 'page:load', BlogBar.init );
