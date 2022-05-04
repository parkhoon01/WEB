'use strict';
// 1~45 사이에 중복 되지 않게 6개의 숫자를 출력하시오.
// 내가 한 방법
let lotto = [];
for(let i=0; i<6; i++){
    lotto[i] = Math.floor(Math.random() * 44)+1;
    for(let j=0; j<i; j++){
        if(lotto[i] == lotto[j]){
            i--;
        }
    }
}
console.log(`${lotto.toString()}`);

// sort()
lotto.sort(function(a,b){
   return a-b; 
});

console.log(`after sort: ${lotto.toString()}`);

// 다른 방법
let lottoArr = [];

for(let i = 1; i <= 45; i++){
    lottoArr.push(i);
}

for(let i = 0; i <= 1000; i++){
    let rand = Math.floor((Math.random() * 45));
    let temp = 0;
    temp = lottoArr[0];
    lottoArr[0] = lottoArr[rand];
    lottoArr[rand] = temp;
}
console.log(lottoArr);

for(let i = 0; i < 6; i++){
    console.log(`${i+1}번째 번호 : ${lottoArr.pop()}`);
}