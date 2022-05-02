'use strict';
/**
재귀함수

함수 안에서 자신의 함수를 호출
(종료 조건을 명시해야함.)
 */
 
 function factorial(n){
    // 종료 조건
    if(n === 0){
        console.log('호출 끝!');
    }
    else{
        console.log(`n=${n}`);
        factorial(n-1)*n;
    }
}

factorial(4);