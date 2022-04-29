'use strict';

// 합이 30이상이면 break

let sum = 0;
let i = 1;
while(i > 0){
    console.log(`i: ${i}`);
    sum += i;
    i++
    if(sum>=30){
        break;
    }
    console.log(`sum: ${sum}`);
}