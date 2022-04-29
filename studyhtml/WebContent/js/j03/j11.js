'use strict';

// continue : 특정 조건에 해당되면 건너 뛰기.
// 1 ~ 20사이 홀수만 출력

for(let i = 1; i<=20; i++){
    if((i%2)==0){
        continue;
    }
    else{
        console.log(`i: ${i}`);
    }
    
}