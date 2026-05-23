$(document).ready(function () {
    "use strict";

    $(window).on("scroll", function () {
        if ($(this).scrollTop() > 600) {
            $(".return-to-top").fadeIn();
        } else {
            $(".return-to-top").fadeOut();
        }
    });

    $(".return-to-top").on("click", function () {
        $("html, body").animate({
            scrollTop: 0
        }, 800);

        return false;
    });

    $(".header-area").sticky({
        topSpacing: 0
    });

    $("li.smooth-menu a").on("click", function (event) {
        event.preventDefault();

        const target = $(this).attr("href");

        if ($(target).length) {
            $("html, body").stop().animate({
                scrollTop: $(target).offset().top
            }, 800);
        }
    });

    $("body").scrollspy({
        target: ".navbar-collapse",
        offset: 0
    });
});