'use strict';

class User{
    //생성자
    constructor(name,passwd,age){
        this.name = name;
        this.passwd = passwd;
        this.age = age;
    }
    get getAge(){
        return this.age;
    }
    
    set setAge(value){
        if(value < 0){
            value = 0;
        }
        
        this.age = value;
    }
}

const user01 = new User('PCWK','1234',-1);

console.log(`name: ${user01.name}`);
console.log(`pass: ${user01.pass}`);
console.log(`age: ${user01.age}`);

// setter
user01.setAge = -1;

// getter
console.log(`age: ${user01.getAge}`);