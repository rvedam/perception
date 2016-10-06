// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var Layout = function() {

    var layoutImgPath = 'images/';

    var layoutCssPath = 'stylesheets/';

    var resBreakpointMd = InfoSec.getResponsiveBreakpoint('md');



    // handle on page scroll
    var handleHeaderOnScroll = function() {
        if ($(window).scrollTop() > 60) {
            $("body").addClass("page-on-scroll");
        } else {
            $("body").removeClass("page-on-scroll");
        }
    }

    // handle go to top button
    var handleGo2Top = function () {
        var Go2TopOperation = function(){
            var CurrentWindowPosition = $(window).scrollTop();// current vertical position
            if (CurrentWindowPosition > 100) {
                $(".go2top").show();
            } else {
                $(".go2top").hide();
            }
        };

        Go2TopOperation();// call headerFix() when the page was loaded
        if (navigator.userAgent.match(/iPhone|iPad|iPod/i)) {
            $(window).bind("touchend touchcancel touchleave", function(e){
                Go2TopOperation();
            });
        } else {
            $(window).scroll(function() {
                Go2TopOperation();
            });
        }

        $(".go2top").click(function(e) {
            e.preventDefault();
            $("html, body").animate({ scrollTop: 0 }, 600);
        });
    };

    var handleHeaderMenu = function() {
        $('.page-header .navbar-nav > .dropdown-fw, .page-header .navbar-nav > .more-dropdown, .page-header .navbar-nav > .dropdown > .dropdown-menu  > .dropdown').click(function(e) {

            if (InfoSec.getViewPort().width > resBreakpointMd) {
                if ($(this).hasClass('more-dropdown') || $(this).hasClass('more-dropdown-sub')) {
                    return;
                } else {
                    e.stopPropagation();
                }
            } else {
                e.stopPropagation();
            }

            var links = $(this).parent().find('> .dropdown');

            if (InfoSec.getViewPort().width < resBreakpointMd) {
                if ($(this).hasClass('open')) {
                    links.removeClass('open');
                } else {
                    links.removeClass('open');
                    $(this).addClass('open');
                    InfoSec.scrollTo($(this));
                }
            } else {
                if ($(this).hasClass('more-dropdown'))  {
                    return;
                }
                links.removeClass('open');
                $(this).addClass('open');
                InfoSec.scrollTo($(this));
            }
        });

        $('.page-header .navbar-nav .more-dropdown-sub .dropdown-menu, .page-header .navbar-nav .dropdown-sub .dropdown-menu').click(function(){

        });
    };

    // Handles main menu on window resize
    var handleMainMenuOnResize = function() {
        // handle hover dropdown menu for desktop devices only
        var width = InfoSec.getViewPort().width;
        var menu = $(".page-header .navbar-nav");
        if (width >= resBreakpointMd && menu.data('breakpoint') !== 'desktop') {
            menu.data('breakpoint', 'desktop');
            $('[data-hover="extended-dropdown"]', menu).not('.hover-initialized').each(function() {
                $(this).dropdownHover();
                $(this).addClass('hover-initialized');
            });
        } else if (width < resBreakpointMd && menu.data('breakpoint') !== 'mobile') {
            menu.data('breakpoint', 'mobile');
            // disable hover bootstrap dropdowns plugin
            $('[data-hover="extended-dropdown"].hover-initialized', menu).each(function() {
                $(this).unbind('hover');
                $(this).parent().unbind('hover').find('.dropdown-submenu').each(function() {
                    $(this).unbind('hover');
                });
                $(this).removeClass('hover-initialized');
            });
        }
    };

    return {

        // Main init methods to initialize the layout
        // IMPORTANT!!!: Do not modify the core handlers call order.

        init: function () {
            handleGo2Top();
            handleHeaderOnScroll();
            handleHeaderMenu();
            handleMainMenuOnResize();
            InfoSec.addResizeHandler(handleMainMenuOnResize); // handle main menu on window resize

            // handle minimized header on page scroll
            $(window).scroll(function() {
                handleHeaderOnScroll();
            });
        },

        getLayoutImgPath: function() {
            return InfoSec.getAssetsPath() + layoutImgPath;
        },

        getLayoutCssPath: function() {
            return InfoSec.getAssetsPath() + layoutCssPath;
        }
    };



}();