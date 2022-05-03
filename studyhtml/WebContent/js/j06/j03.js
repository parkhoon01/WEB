'use strict';

let info = {
    subject: 'JavaScript',
    credit: 3,
    days: 20,
    tuition: 100
}


for(let i in info){
    console.log(`i=${i}, \t info[${i}]=${info[i]}`);    
}