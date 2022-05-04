'use strict';

//let dateObj = new Date();
let dateObj = new Date(2022,6,12,14,10,45);

let dateInfo = {
    year: dateObj.getFullYear(),            // 년도 4자리
    month: dateObj.getMonth()+1,            // 월(0~11)이기 때문에 +1 필요
    day: dateObj.getDate(),                 // 일(1~31)
    week: dateObj.getDay(),                 // 0은 일요일 ~ 6은 토요일
    hour: dateObj.getHours(),               // 시
    minutes: dateObj.getMinutes(),          // 분
    second: dateObj.getSeconds(),           // 초
    miliseconds: dateObj.getMilliseconds()  // 1000분의 1초
}

for(let i in dateInfo){
    console.log(`${i}: ${dateInfo[i]}`);
}