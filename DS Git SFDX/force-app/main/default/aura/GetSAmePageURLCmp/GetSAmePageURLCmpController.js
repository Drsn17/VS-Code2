({
    doInit : function(c, e, h){
        var x = location.href;
        console.log('x-----'+x);
        var a = x.split("?");
        console.log('a----'+a[1]);
    },
})