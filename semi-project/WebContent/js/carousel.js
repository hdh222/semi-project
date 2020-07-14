function Rslide() {
    $('.slide').animate({ left: -300 }, function () {   // 애니메이션 효과 slie전체 창에 위치를 좌측으로 1000px 당김 
        $('.slide li:first').appendTo('.slide');  // 맨 첫번째를 맨뒤로 추가시킴
        $('.slide').css({ left: 0 })  //
    })
}
function Lslide() {
    $('.slide').animate({ left: 300 }, function () {   // 애니메이션 효과 slie전체 창에 위치를 좌측으로 1000px 당김 
        $('.slide li:last').prependTo('.slide');  // 맨마지막을 맨 앞으로 추가
        $('.slide').css({ left: 0 })  //
    })
}

$('.prev').on('click', function () {
    Lslide();
});

$('.next').on('click', function () {
    Rslide();
});
//setInterval(Lslide, 3000);

$(window).resize(function() {
    if(window.innerWidth>990) {
        $('#wrap').css({ width: '1000px' });
    }else if (window.innerWidth > 740) {
        $('#wrap').css({ width: '670px' });
    } else {
        $('#wrap').css({ width: '340px' });
    }
});



