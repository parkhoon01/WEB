'use strict';

let city = ['미국','영국','일본','필리핀','아이슬란드'];

for(let i in city){
    console.log(`i: ${i}, city[${i}]:${city[i]}`);
}

// for ... of문
for(let i of city){
    console.log(`i: ${i}`);
}