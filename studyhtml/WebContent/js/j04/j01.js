'use strict';

function life(){
    console.log('즉시 실행함수!');
}

let instant = ( function(){
    console.log('즉시 실행함수2');
})();

(function(){
    life();
})();