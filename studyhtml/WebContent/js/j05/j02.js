'use strict';

let info = {
    
    subject: 'javascript',
    credit: 5,
    printOut: function(){
        return this.subject + ', ' + this.credit;
    }
};

console.log(`info.subject: ${info.subject}`);
console.log(`info.credit: ${info.credit}`);
console.log(`info.printOut: ${info.printOut()}`);

// 속성 추가
info.days = 7;
console.log(`info.days: ${info.days}`);

// 속성 삭제
delete info.credit;
console.log(`info.credit: ${info.credit}`);

// 메서드 속성 변경
info.printOut = function(){
    return this.subject + ', ' + this.days;
}

console.log(`info.printOut(): ${info.printOut()}`);

function Info(subject, credit){
    this.subject = subject;
    this.credit = credit;
    
    this.printOut = function(){
        return this.subject + ', ' + this.credit;
    }
}

let subject01 = new Info('javascript',5);
let subject02 = new Info('css',5);

console.log(`subject01.subject: ${subject01.subject}`);
console.log(`subject01.credit: ${subject01.credit}`);
console.log(`subject01.printOut(): ${subject01.printOut()}`);

console.log(`subject02.subject: ${subject02.subject}`);
console.log(`subject02.credit: ${subject02.credit}`);
console.log(`subject02.printOut(): ${subject02.printOut()}`);