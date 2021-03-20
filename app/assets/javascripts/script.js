/*global$*/
$(document).on('turbolinks:load', function() {
    $('#testimages').skippr({
        //
        transition : 'fade',
        //
        speed : 1000,
        //
        easing : 'easeOutQuart',
        //
        navType : 'block',
        //
        childrenElementType : 'div',
        //
        arrows : false,
        //
        autoPlay : true,
        //
        autoPlayDuration : 5000,
        //
        keyboardOnAlways : false,
        //
        hidePrevious : false
    });
});