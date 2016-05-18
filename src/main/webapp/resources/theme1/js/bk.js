/**
 * Bk project manager
 */

function BuildPosterSlide(iheight) {
    
    var oImgs = $('#divCam img');
	if (oImgs.length<2) return false;
    var sBuild = '';
    oImgs.each(function () {
        var oImg = $(this);
		var theCaption = '';
		if(oImg.attr('alt') && oImg.attr('alt')!==''){
			theCaption = '<div class="camera_caption fadeFromBottom">' + oImg.attr('alt') + '</div>';
		}
		else if(oImg.attr('title') && oImg.attr('title')!==''){
			theCaption = '<div class="camera_caption fadeFromBottom">' + oImg.attr('title') + '</div>';
		}
		
        if (oImg.parent('a').length) {
            sBuild += '<div data-src="' + oImg.attr('src') + '" data-link="' + oImg.parent('a').attr('href') + '">' + theCaption + '</div>'
        }
        else {
            sBuild += '<div data-src="' + oImg.attr('src') + '">' + theCaption + '</div>'
        }
    })
	if(oImgs.length<2) sBuild = '';
    if (sBuild != '') {
        $('#divCam').html(sBuild);
        jQuery('#divCam').camera({
            height: iheight + 'px',  pagination: false, thumbnails: false, playPause: false, pauseOnClick: false, hover:false, time: 3500, transPeriod: 1000, loaderOpacity: 0.5,
            fx: 'random'
        });
    }

}

function BuildNavigator(){
					
	function ClearNavActive(){$('#Site-navigator .Item.Active').removeClass('Active')}
	function SetNavActive(e){var currentItem = $(e); currentItem.addClass('Active'); currentItem.find('.Popup').slideDown('fast')}
	function RestoreNavActive(){ClearNavActive(); $('#Site-navigator .Item[state="active"]').addClass('Active')}
				
	//Popup offtion
	var leftOffset = 0, rightOffset = 0, topOffset = 31;
					
	//Save active state
	var activeItem = $('#Site-navigator .Item.Active');
	if(activeItem.length) activeItem.attr('state','active')

	var nav = $('#Site-navigator');
	var items = $('#Site-navigator .Item');

	//Calculate nav position		
	var popups = $('#Site-navigator .Popup');
	popups.each(function(index, element) {
		var popup = $(element);
		var popupOffset = popup.offset();
						
		//Set horizontal position
		var x = (nav.offset().left + nav.width()) - (popup.offset().left + popup.width())
		if(x<0){
			popup.css({'left':x + 'px','top':topOffset + 'px'})
		}
		else{
			popup.css({'left':leftOffset + 'px','top':topOffset + 'px'})
		}			
	});
					
	popups.hover(function(e){e.stopPropagation()},function(e){})
	popups.hide().css('visibility','visible');
	
	items.hover(
		function(e){
			e.stopPropagation();
			ClearNavActive();
			SetNavActive(this);
		},
		function(e){
			ClearNavActive();
			$('#Site-navigator .Popup').hide();
			RestoreNavActive();
		}
	)
}
