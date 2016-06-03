$(document).ready(function () {

    $('.btn-vertical-slider').on('click', function () {

        if ($(this).attr('data-slide') == 'next') {
            $('#myCarousel').carousel('next');
        }
        if ($(this).attr('data-slide') == 'prev') {
            $('#myCarousel').carousel('prev')
        }

    });
});
jQuery(function($) {'use strict',
	//#main-slider
	$(function(){
		$('#main-slider.carousel').carousel({
			interval: 8000
		});
	});
	// accordian
	$('.accordion-toggle').on('click', function(){
		$(this).closest('.panel-group').children().each(function(){
		$(this).find('>.panel-heading').removeClass('active');
		 });

	 	$(this).closest('.panel-heading').toggleClass('active');
	});
	//Initiat WOW JS
	new WOW().init();
	// portfolio filter
	$(window).load(function(){'use strict';
		var $portfolio_selectors = $('.portfolio-filter >li>a');
		var $portfolio = $('.portfolio-items');
		$portfolio.isotope({
			itemSelector : '.portfolio-item',
			layoutMode : 'fitRows'
		});
		
		$portfolio_selectors.on('click', function(){
			$portfolio_selectors.removeClass('active');
			$(this).addClass('active');
			var selector = $(this).attr('data-filter');
			$portfolio.isotope({ filter: selector });
			return false;
		});
	});

	// Contact form
	var form = $('#main-contact-form');
	form.submit(function(event){
		event.preventDefault();
		var form_status = $('<div class="form_status"></div>');
		$.ajax({
			url: $(this).attr('action'),

			beforeSend: function(){
				form.prepend( form_status.html('<p><i class="fa fa-spinner fa-spin"></i> Email is sending...</p>').fadeIn() );
			}
		}).done(function(data){
			form_status.html('<p class="text-success">' + data.message + '</p>').delay(3000).fadeOut();
		});
	});
	//goto top
	$('.gototop').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop: $("body").offset().top
		}, 500);
	});	

	//Pretty Photo
	$("a[rel^='prettyPhoto']").prettyPhoto({
		social_tools: false
	});	
});

$(document).ready(function() {
	// Switch Click
    $('.Switch').click(function() {
        // Check If Enabled (Has 'On' Class)
        if ($(this).hasClass('On')){
            // Try To Find Checkbox Within Parent Div, And Check It
            $(this).parent().find('input:checkbox').attr('checked', true);
            // Change Button Style - Remove On Class, Add Off Class
            $(this).removeClass('On').addClass('Off');
            $('.infoTab').removeClass('tabList')

        } else { // If Button Is Disabled (Has 'Off' Class)
            // Try To Find Checkbox Within Parent Div, And Uncheck It
            $(this).parent().find('input:checkbox').attr('checked', false);
           
            // Change Button Style - Remove Off Class, Add On Class
            $(this).removeClass('Off').addClass('On');

            $('.infoTab').addClass('tabList')
        }

    });

    // Loops Through Each Toggle Switch On Page
    $('.Switch').each(function() {

        // Search of a checkbox within the parent
        if ($(this).parent().find('input:checkbox').length){
            // This just hides all Toggle Switch Checkboxs
            // Uncomment line below to hide all checkbox's after Toggle Switch is Found
            //$(this).parent().find('input:checkbox').hide();

            // For Demo, Allow showing of checkbox's with the 'show' class
            // If checkbox doesnt have the show class then hide it
            if (!$(this).parent().find('input:checkbox').hasClass("show")){ $(this).parent().find('input:checkbox').hide(); }
            // Comment / Delete out the above line when using this on a real site
            // Look at the checkbox's checkked state
            if ($(this).parent().find('input:checkbox').is(':checked')){

                // Checkbox is not checked, Remove the 'On' Class and Add the 'Off' Class
                $(this).removeClass('On').addClass('Off');

            } else {

                // Checkbox Is Checked Remove 'Off' Class, and Add the 'On' Class
                $(this).removeClass('Off').addClass('On');

            }

        }

    });
    /*Scroll Bar*/
       $("#keyofficers").mCustomScrollbar({
        autoHideScrollbar:true,
        theme:"inset-2"

       });
       $("#industry").mCustomScrollbar({
            autoHideScrollbar:true,
            theme:"inset-2"

       });
    jQuery('#dp1').datepicker();
    jQuery('#dp2').datepicker();
    $('#chart-selector').change(function(){
            $('.tech-chart').hide();
            $('#' + $(this).val()).show();
    });
});
/*! HP08 */
jQuery(document).ready(function(a) {
    a("div.hp08v0").each(function() {
        var d = "";
        var f = (a(this).is("[data-showlist]")) ? a(this).attr("data-showlist") : "Show List View";
        var b = (a(this).is("[data-showimgs]")) ? a(this).attr("data-showimgs") : "Show Panel View";
        a(this).addClass("hp08notloaded").addClass("hp08imgitems").attr("data-lbl", "panelview");
        a(this).find(".hp08v1").each(function(k) {
            var j = a(this)[0].id;
            var i = a(this).find(".hp08label").text();
            var h = (a(this).is("[data-lbl]")) ? a(this).attr("data-lbl") : j;
            d += '<li><a href="#' + j + '" data-lbl="' + h + '">' + i + "<i></i></a></li>";
            a(this).find(".hp08promo").each(function(l) {
                a(this).attr("data-lbl", "location" + (l + 1));
            });
        });
        d = '<div class="hp08tablist" id="hp08tablist"> <ul data-lbl="tab">' + d + '</ul><div class="hp08tglview"><a href="#showlist" class="hp08showlist" title="' + f + '" data-lbl="show-list-view"> </a><a href="#showimages" class="hp08showimgs" title="' + b + '" data-lbl="show-panel-view"> </a><div class="hp08tgl-togg"></div><div class="hp08tgl-icn list-icn"></div><div class="hp08tgl-icn imgs-icn"></div></div></div>';
        a(this).prepend(d);
        var e = 1;
        if (a(this).hasClass("randomtab")) {
            var g = (a(this).find(".hp08tablist li").length * 2) + 2;
            g = Math.floor(Math.random() * (g - 1 + 1)) + 1;
            if (g > 4) {
                e = Math.round((g - 2) / 2);
            }
        }
        a(this).find(".hp08tablist li:nth-child(" + e + ")").addClass("hp08default");
        a(this).prepend('<div id="hp08selector"><a href="#choosefilter" data-lbl="notrack"></a></div>');
        a(this).find(".hp08teaser").wrapInner("<span><em></em></span>").append('<b class="hp08arrw"></b>').hide();
        a(this).find(".hp08cta").wrapInner("<span></span>").hide();
        var c = '   <div class="hp08v1 hp08bgtiles"> <div class="hp08promo hp08promo-1 hp08c1 hp08bgtile"></div> <div class="hp08promo hp08promo-2 hp08c1 hp08bgtile"></div> <div class="hp08promo hp08promo-3 hp08c2 hp08bgtile"></div> <div class="hp08promo hp08promo-4 hp08c3 hp08bgtile"></div> <div class="hp08promo hp08promo-5 hp08c3 hp08bgtile"></div> </div>';
        a(this).find(".hp08w2").append(c);
        hp08resize();
    });
    a(".hp08v0").waypoint(function(b) {
        if (!a(this).find(".hp08img")[0]) {
            hp08showpromo(a(".hp08v0 .hp08default a").attr("href").split("#")[1]);
        }
    }, {
        offset: "100%"
    });
   
});
jQuery(window).resize(function(a) {
    hp08resize();
});

function hp08resize() {
    jQuery("div.hp08promo").each(function() {
        if ($(this).hasClass("hp08promo-3")) {
            $(this).css("height", $(this).closest(".hp08v1").outerHeight());
        }
        var a = jQuery(this).find(".hp08teaser").height();
        var b = jQuery(this).height();
        var c = jQuery(this).find(".cmps-bttns span").width();
        jQuery(this).find(".hp08cta").css("height", (b) + "px").css("margin-top", (-1 * a) + "px").css("padding-top", (1 * a) + "px");
        jQuery(this).find(".hp08w3").css("top", (b - a) + "px").css("padding-right", (c + 40) + "px");
        jQuery(this).find(".hp08w4").css("padding-right", (c + 40) + "px");
    });
}
$(document).on("click", ".hp08tablist ul a", function() {
    if ($(this)[0].href.split("#")[1] != $(".hp08v0").attr("data-cfilter")) {
        hp08showpromo($(this)[0].href.split("#")[1]);
    }
    $(".hp08viewmenu").removeClass("hp08viewmenu");
    return false;
});
$(document).on("click", ".hp08tglview a", function() {
    $(this).closest(".hp08").toggleClass("hp08lvw").toggleClass("hp08imgitems");
    if ($(this).closest(".hp08").attr("data-lbl") == "panelview") {
        $(this).closest(".hp08").attr("data-lbl", "listview");
    } else {
        $(this).closest(".hp08").attr("data-lbl", "panelview");
    }
    hp08resize();
    $(this).parent().find(".hp08tgl-icn").css("opacity", 0.2).animate({
        opacity: 1
    }, 800, "easeInOutSine");
    return false;
});
$(document).on("click", "#hp08selector a", function() {
    $(this).closest(".hp08").toggleClass("hp08viewmenu");
    return false;
});
$(document).on("click", ".hp08promo a[target]", function() {
    $(this).blur();
});
$(document).on("mouseenter", ".hp08notloaded", function() {
    $(this).find(".hp08promo a[data-bgimg]").each(function(c) {
        var b = hp08imgpos($(this).attr("data-bgimg"));
        var a = ($(this).is("[data-bgimg2x]") && $("html").hasClass("retina")) ? $(this).attr("data-bgimg2x") : $(this).attr("data-bgimg");
        $(this).prepend('<div class="hp08img ' + b + '" style="background-image:url(\'' + a + "')\"></div>");
        $(this).removeAttr("data-bgimg").removeAttr("data-bgimg2x");
    });
    $(this).removeClass("hp08notloaded");
});
function hp08showpromo(a) {
    var c = $("#" + a);
    c.parent().find(".hp08cta").hide();
    var b = $("#" + $(".hp08v0").attr("data-cfilter"));
    if (b[0]) {
        $(".hp08prevf").removeClass("hp08prevf");
        b.removeClass("hp08currentfilter").addClass("hp08prevf");
        b.find(".hp08cta").hide();
    }
    c.addClass("hp08currentfilter");
    c.find(".hp08promo a").css("top", "-150%");
    $(".hp08selected").removeClass("hp08selected").removeClass("hp08default");
    $('.hp08tablist a[href$="#' + a + '"]').parent().addClass("hp08selected");
    $("#hp08selector a").html($('.hp08tablist a[href="#' + a + '"]').parent().text());
    $(".hp08v0").attr("data-cfilter", a);
    c.find(".hp08promo a").each(function(g) {
        if (!$(this).find(".hp08img")[0] && $(this).is("[data-bgimg]")) {
            var d = ($(this).is("[data-bgimg2x]") && $("html").hasClass("retina")) ? $(this).attr("data-bgimg2x") : $(this).attr("data-bgimg");
            $(this).removeAttr("data-bgimg").removeAttr("data-bgimg2x");
            imgpreload([d], function(h, i) {
                i.css("top", "-150%");
                var j = hp08imgpos(d);
                i.prepend('<div class="hp08img ' + j + '" style="background-image:url(\'' + d + "')\"></div>");
                hp08loadp(i);
            }, $(this));
        } else {
            var f = $(this);
            if (f.closest(".hp08imgitems")[0]) {
                var e = setTimeout(function() {
                    hp08loadp(f);
                }, (g * (100 - (g * 4))));
            } else {
                hp08loadp(f);
            }
        }
    });
}

function hp08loadp(b) {
    b.find(".hp08teaser").show();
    hp08resize();
    var a = "hp08promo-" + b.parent()[0].className.split("8promo-")[1].split(" ")[0];
    if (b.closest(".hp08imgitems")[0]) {
        b.animate({
            top: "0%"
        }, 700, "easeInOutSine", function() {
            $(this).find(".hp08cta").css("display", "table");
            $("div.hp08prevf ." + a + " a").css("top", "-150%");
        });
    } else {
        b.css("top", 0).show();
        b.find(".hp08cta").css("display", "table");
    }
}

function hp08imgpos(a) {
    if (/hp08c[13]p1/.test(a)) {
        return " hp08bg-tl";
    } else {
        if (/hp08c[13]p2/.test(a)) {
            return " hp08bg-tc";
        } else {
            if (/hp08c[13]p3/.test(a)) {
                return " hp08bg-tr";
            } else {
                if (/hp08c2p1/.test(a)) {
                    return " hp08bg-tc";
                } else {
                    if (/hp08c2p2/.test(a)) {
                        return " hp08bg-mc";
                    } else {
                        if (/hp08c2p3/.test(a)) {
                            return " hp08bg-bc";
                        } else {
                            return "";
                        }
                    }
                }
            }
        }
    }
}
jQuery(document).ready(function(a){a("div.hp07v0").each(function(f){var d=a(this);var c=(d.hasClass("hp07random"))?Math.floor(Math.random()*(d.find("div.hp07").length-1+1))+1:1;d[0].current=c;/*d.append('<div class="hp07z1"></div>').append('<div class="hp07z2"></div>');*/if(d.find("div.hp07").length>1){d.find(".hp07w2").prepend('<a href="#previous" class="hp07dnav hp07prev" data-goto="-1"><i> </i></a>');var e='<div class="hp07nav"><ul style="margin-top:-'+(((d.find("div.hp07").length*1.05)/2)+0.15)+"em;margin-left:-"+(((d.find("div.hp07").length*1.05)/2)+0.15)+'em">';d.find("div.hp07").each(function(h){a(this).attr("id","feature-"+(h+1));var g=(h==(d[0].current-1))?' class="hp07selected"':"";e+='<li><a href="#feature-'+(h+1)+'"'+g+' id="fnav-'+(h+1)+'" data-goto="'+(h+1)+'"> </a></li>';});e+="</ul></div>";d.find(".hp07w2").append(e+'\n<a href="#next" class="hp07dnav hp07next" data-goto="+1"><i> </i></a>');}else{d.find("div.hp07").first().attr("id","feature-"+(d[0].current));d.addClass("hp07single");}d.find("div.hp07").each(function(i){if(i==(d[0].current-1)){a(this).addClass("cfeature");var h=(a(this).is("[data-bgimg]"))?b(a(this).attr("data-bgimg")):"ffffff";var g=((a(this).is("[data-bgimg2x]")&&a("html").hasClass("retina")&&a(window).width()>600))?a(this).attr("data-bgimg2x"):a(this).attr("data-bgimg");d.append('<div class="hp07w4"><div class="hp07imgslide cslide" id="hp07img-'+(i+1)+'"><div style="background-color:#'+h+'"><img class="hp07img" src="'+g+'"></div></div></div>');var g=a(this).attr("data-bgimg");imgpreload([g],function(j,k){var l=k.find("div.hp07w4");k.find("div.hp07").each(function(p){if(p!=(d[0].current-1)){var o=(a(this).is("[data-bgimg]"))?b(a(this).attr("data-bgimg")):"ffffff";var m=((a(this).is("[data-bgimg2x]")&&a("html").hasClass("retina")&&a(window).width()>600))?a(this).attr("data-bgimg2x"):a(this).attr("data-bgimg");if(p<(d[0].current-1)){l.find("#hp07img-"+d[0].current).before('<div class="hp07imgslide" id="hp07img-'+(p+1)+'"><div style="background-color:#'+o+'"><img class="hp07img" src="'+m+'"></div></div>');}else{l.append('<div class="hp07imgslide" id="hp07img-'+(p+1)+'"><div style="background-color:#'+o+'"><img class="hp07img" src="'+m+'"></div></div>');}}});},a(this).closest("div.hp07v0"));}a(this).attr("data-lbl","hpf"+(i+1));if(!a(this).find(".hp07w3").first().is("[data-lbl]")){a(this).find(".hp07w3").attr("data-lbl",a(this).find(".hp07ttl").text());}});a("#feature-"+(d[0].current)).css("top",0).css("left",0);a("#hp07img-"+(d[0].current)).css("top",0).css("left",0);function b(g){if(/-bg(......)-/.test(g)){var h=g.replace(/.*-bg(......).*/ig,"$1");return h;}else{return"ffffff";}}});a("body").on("mouseenter","#hp07v0",function(){a(this).addClass("hp07pause");}).on("mouseleave","#hp07v0",function(){a(this).removeClass("hp07pause");});});$(window).load(function(){var a=($("#hp07v0").is("[data-hp07rotate]"))?$("#hp07v0").attr("data-hp07rotate"):6;$("#hp07v0").attr("data-hp07rotate",a);if(a!=0&&!$("#hp07v0").hasClass("hp07single")){setTimeout(function(){hp07goto("+1","auto");},a*1000);}});$(document).on("click",".hp08promo a[target]",function(){$(this).blur();});$(document).on("click","a.hp07dnav,.hp07nav a",function(){if(!$(".hp07busy")[0]&&!$(this).hasClass("hp07selected")){if(/[-+]/.test($(this).attr("data-goto"))){var a=($(this).attr("data-goto").indexOf("+")>-1)?"next":"prev";hp07goto($(this).attr("data-goto"),a);}else{hp07goto(($(this).attr("data-goto")*1),"nav");}}return false;});function hp07goto(k,l){var i=$("div.hp07v0").first();if(l=="auto"&&i.hasClass("hp07gonemanual")){return;}else{if(l=="auto"&&i.hasClass("hp07pause")){setTimeout(function(){hp07goto("+1","auto");},i.attr("data-hp07rotate")*1000);return;}}i.addClass("hp07busy");if(l!="auto"){i.addClass("hp07gonemanual");}var o=i[0].current;var d=i.find("div.hp07").length;var j=((o-1)==0)?d:(o-1);var c=((o+1)>d)?1:(o+1);var e=null;if(/[+]/.test(k)){k=c;e="n";}else{if(/[-]/.test(k)){k=j;e="p";}}$(".hp07dnav").animate({opacity:"0"},300,"easeInOutSine");$(".hp07selected").removeClass("hp07selected");$("#fnav-"+k).addClass("hp07selected");var m="-100%";var f="-80%";var g="100%";var h="-20%";var b="20%";if((k>o&&o!=d&&e!="p")||e=="n"){m="100%";f="80%";g="-100%";h="20%";b="-20%";}var a=$("#feature-"+k).find(".hp07w3").attr("data-lbl");a=a.toLowerCase().replace(/ /g,"-").replace(/\xa0/g,"-").replace(/-+/g,"-").replace(/[.,:;'"]/g,"");if(!i[0].autocount){i[0].autocount=2;}else{if(!i.hasClass("hp07gonemanual")){i[0].autocount=i[0].autocount+1;}else{i[0].autocount=0;}}if(typeof navTrack=="function"&&typeof s_setAccount=="function"&&i[0].autocount<=i.find(".hp07v1").length&&l!="auto"){navTrack(s_setAccount()[1],s_setAccount()[2],"hp07","show-hpf"+k+":"+a+":"+l);}var n=(i.width()<620)?600:1000;if(!document.addEventListener){$("#feature-"+k).addClass("cfeature");$("#feature-"+k).css("top",m);$("#hp07img-"+k).css("top","0").css("left","0").css("z-index","1");$("#hp07img-"+k+" div").css("top",h);$("#hp07img-"+k).addClass("cslide");$("#hp07img-"+o).css("z-index","2");$("#feature-"+o).animate({top:g},n,"easeInOutSine");$("#hp07img-"+o+" div").animate({top:f},n,"easeInOutSine");$("#hp07img-"+o).animate({top:g},n,"easeInOutSine",function(){$(this).css("top",g);$("#feature-"+o).removeClass("cfeature");$("#hp07img-"+o).removeClass("cslide");if(l=="auto"){setTimeout(function(){hp07goto("+1","auto");},i.attr("data-hp07rotate")*1000);}});$("#hp07img-"+k+" div").animate({top:"0"},n,"easeInOutSine");$("#hp07img-"+k).animate({top:"0"},n,"easeInOutSine");$("#feature-"+k).animate({top:"0%"},n,"easeInOutSine",function(){$(".hp07dnav").animate({opacity:"1"},150,"easeInOutSine");$(".hp07busy").removeClass("hp07busy");});}else{$("#feature-"+k).addClass("cfeature");$("#feature-"+k).css("top",m).css("left",m);$("#hp07img-"+k).css("top","0%").css("left","0%").css("z-index","0");$("#hp07img-"+k).addClass("cslide");$("#hp07img-"+k+" div").css("top",h).css("left",h);$("#hp07img-"+o).css("z-index","2");$("#feature-"+o).animate({top:g,left:g},n,"easeInOutSine");$("#hp07img-"+o+" div").animate({top:f,left:f},n,"easeInOutSine");$("#hp07img-"+o).animate({top:g,left:g},n,"easeInOutSine",function(){$(this).css("top",g).css("left",g);$("#feature-"+o).removeClass("cfeature");$("#hp07img-"+o).removeClass("cslide");if(l=="auto"){setTimeout(function(){hp07goto("+1","auto");},i.attr("data-hp07rotate")*1000);}});$("#hp07img-"+k+" div").animate({top:"0",left:"0"},n,"easeInOutSine");$("#hp07img-"+k).animate({top:"0",left:"0"},n,"easeInOutSine");$("#feature-"+k).animate({top:"0%",left:"0%"},n,"easeInOutSine",function(){$(".hp07dnav").animate({opacity:"1"},150,"easeInOutSine");$(".hp07busy").removeClass("hp07busy");});}i[0].current=k;if(l!="auto"){i.addClass("hp07gonemanual");}}
function imgpreload(g, f, d) {
    var b = 0;
    var a = [];
    g = Object.prototype.toString.apply(g) === "[object Array]" ? g : [g];
    var e = function() {
        b += 1;
        if (b === g.length && f) {
            f(a, d);
        }
    };
    for (var c = 0; c < g.length; c++) {
        a[c] = new Image();
        a[c].onabort = e;
        a[c].onerror = e;
        a[c].onload = e;
        a[c].src = g[c];
    }
}
// - Ignore End