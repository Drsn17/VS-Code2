({
doInit : function(c, e, h){
    /*var carouselDefault = new PureJSCarousel({
        carousel: '#demo',
        slide: '.slide'
    });*/


    var carouselDefault = new PureJSCarousel({

        // CSS selector for carousel wrapper
        carousel: '#carousel-default',

        // CSS selector for carousel items
        slide: '.slide',

        // CSS selectors for next / prev navigation
        btnNext: document.createElement('button'),
        btnPrev: document.createElement('button'),

        // slides the items one by one
        oneByOne: false,

        // animation speed
        speed: 1000,

        // activate slide
        activeIndex: 0,

        // animation delay
        delay: 0,

        // easing effect
        effect: 'linear',

        // autopaly options
        autoplay: false,
        autoplayDelay: 1000,
        autoplayStartDelay: 1000,
        autoplayDirection: 'next',

        // infinite looping
        infinite: false,
    });




}
  
})