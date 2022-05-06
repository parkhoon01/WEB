# JavaScript
https://developer.mozilla.org/ko/docs/Web/JavaScript

# 익명함수

익명함수는 변수에 함수를 저장하여 변수를 마치 함수처럼 사용할 수 있다.

<pre>
<code>
let 변수 = function(){
              실행문;  
}
   
</code>
</pre>

* 익명함수는 호이스팅이 안됨.
<hr/>


# return, 매개변수

return은 처리 결과를 반환
매개변수: 파라메터

return을 만나면 해당함수를 호출한 곳으로 결과 데이터를 반환



<pre>
<code>
function process(){
         // return을 생략하면 return undefined가 return됨.
         return undefined;
}
</code>
</pre>

<hr/>


# 매개변수

함수를 호출 할때 전달하는 변수를 '매개변수'라고 합니다.

1. 첫번째 형식
<pre><code>
fucntion 함수명(매개변수1, 매개변수2...){
  실행문;
}

함수명(매개변수1, 매개변수2...);
</code></pre>

ex)
```javascript
'use strict';

/*
fucntion 함수명(매개변수1, 매개변수2...){
  실행문;
}

함수명(매개변수1, 매개변수2...);

파람: 학생이름, html, css, javascript
각 60점 이상이면 pass
60점 이하면 재시험
 */

function isPath(name, htmlScore, cssScore, jsScore){
    let comment = name + ' 학생은';
    
    if(htmlScore>60 && cssScore>60 && jsScore>60){
        comment += '전과목 pass';
    }
    else{
        if(htmlScore<60){
            comment += 'html 재시험';
        }
        
        if(cssScore<60){
            comment += 'css 재시험';
        }
        
        if(jsScore<60){
            comment += 'javascript 재시험';
        }
    }
    
    return comment;
}

console.log(isPath('이상무',80,90,95));
console.log(isPath('이상무2',59,40,95));
```
결과
```
이상무 학생은전과목 pass
이상무2 학생은html 재시험css 재시험
```

2. 두번째 형식
<pre><code>
let 변수명 = fucntion 함수명(매개변수1, 매개변수2...){
            실행문;
            }
            
변수명(매개변수1, 매개변수2...);
</code></pre>

ex)
```

```
<hr/>


# 매개변수의 개수가 정해지지 않은 함수
argument객체를 이용한 자리

```
function showSubject(){
  let agrs= arguments[0] + "," + arguments[1];
}

showSubject('html', 'css');
```

ex)
```javascript
'use strict';

function showSubject(){
    for(let i=0; i<arguments.length; i++){
        console.log(`arguments[${i}]: ${arguments[i]}`);
    }
}

showSubject('html','css','javascript','jquery','jsp','spring');
```

결과
```
arguments[0]: html
arguments[1]: css
arguments[2]: javascript
arguments[3]: jquery
arguments[4]: jsp
arguments[5]: spring
```

<hr/>

# Arrow Function

ECMAscript 2015(ES6)
=>를 이용해서 함수를 간결하게 표현.

- 익명 함수 형식으로 표현.
- 단일 명령어의 경우 함수 중괄호({})와 return문 생략 가능


1. 중괄호, return 생략
```
            일반 함수                                      화살표 함수
let doMultiple = function(s1,s2){
                      return s1 + s2;    =>       let doMultiple = (s1,s2) => s1 + s2;
                 };                               doMultiple(90,88);
```

2.
```
            일반 함수                                      화살표 함수
function doMultiple(s1,s2){                        let doMultiple = (s1,s2) => {
  let avg = (s1+s2)/2;                   =>                       let avg = (s1+s2);
  return avg;                                                     return avg;
}                                                                 }
doMultiple(90,88);                                  doMultiple(90,88);
``` 

ex)
```javascript
'use strict';

/*
    ECMAscript 2015(ES6)
    =>를 이용해서 함수를 간결하게 표현.

- 익명 함수 형식으로 표현.
- 단일 명령어의 경우 함수 중괄호({})와 return문 생략 가능
 */
 
const doAdd = (s1,s2) => s1 + s2;

console.log(`(s1,s2) => s1 + s2 : ${doAdd(11,13)}`);

const doAdd2 = (s1,s2) =>{
                 let avg = (s1+s2)/2;
                 return avg;
             };
             
 console.log(`doAdd2: ${doAdd2(11,13)}`);
```

결과
```
(s1,s2) => s1 + s2 : 24
doAdd2: 12
```

# default param
```javascript
'use strict';

function showMessage(message, from='unknown.'){
    // from에 값이 없으면
    if(from === undefined){
        from = 'unknown';
    }
    
    console.log(`message: ${message}, from:${from}`);
}

showMessage('hi');
```

결과
```
message: hi, from:unknown.
```

# call by reference
```javascript
'use strict';

function changeName(obj){
    obj.name = '이상무';
}

const pcwk = {name:'javascript'};

console.log(`before pcwk: ${pcwk.name}`);

changeName(pcwk);

console.log(`after pcwk: ${pcwk.name}`);
```

결과
```
before pcwk: javascript
after pcwk: 이상무
```
<hr/>

# 전역변수와 지역변수
전역변수: 함수블럭{} 밖에 선언된 변수(함수 안과 밖에서 자유롭게 사용 가능)
지역변수: 함수블럭{} 안에 선언된 변수(함수 안에서만 사용가능)


```
            전역변수                              지역변수
        let 변수;                         function 함수(){
        function 함수(){                     let 변수;
        }                                }
```

ex)
```javascript
'use strict';
/*
전역변수: 함수블럭{} 밖에 선언된 변수(함수 안과 밖에서 자유롭게 사용 가능)
 */

let kor = 90;

function getScore(){
    kor = 100;
    console.log(`kor: ${kor}`);
}

getScore();

console.log(`kor: ${kor}`);

console.clear();    // console 로그 지우기

/*
지역변수: 함수블럭{} 안에 선언된 변수(함수 안에서만 사용가능)
 */
let eng = 90;

function getEngScore(){
    let eng = 100;
    console.log(`eng: ${eng}`);
}

getEngScore();
console.log(`eng: ${eng}`);
```


결과
```
Console was cleared
eng: 100
eng: 90
```

<hr/>

# 함수 레벨 스코프와 블록레벨 스코프
var는 함수{}에서만 지역 변수 존재
(블록{}, 제어문 블록{}에서는 지역 변수가 존재 하지 않는다.)

let, const는 블록{}, 제어문{}에서도 지역변수를 선언 할 수 있다.

```javascript
'use strict';

/*
var는 함수{}에서만 지역 변수 존재
(블록{}, 제어문 블록{}에서는 지역 변수가 존재 하지 않는다.)
 */

var num = 11;
{
    var num = 20;
    console.log(`num: ${num}`);
}
console.log(`num: ${num}`);

/* 
let, const는 블록{}, 제어문{}에서도 지역변수를 선언 할 수 있다.
*/

let num01 = 11;
{
    let num01 = 20;
    console.log(`num01: ${num01}`);
}
console.log(`num01: ${num01}`);

const num02 = 11;
{
    const num02 = 23;
    console.log(`num02: ${num02}`);
}
console.log(`num02: ${num02}`);
```

결과
```
num: 20
num: 20
num01: 20
num01: 11
num02: 23
num02: 11
```

<hr/>

# 재귀함수

함수 안에서 자신의 함수를 호출
(종료 조건을 명시해야함.)

```javascript
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
        factorial(n-1);
    }
}

factorial(4);
```

결과
```
n=4
n=3
n=2
n=1
호출 끝!
```

<hr/>

# 클로져(Closure)
일반적으로 함수 내 지역변수는 함수 밖에서 참조할 수 밖에 없다.
클로져는 함수 내 지역변수를 함수 밖에서 참조 할 수 있다.

```javascript
'use strict';
/**
클로져(Closure)
일반적으로 함수 내 지역변수는 함수 밖에서 참조할 수 밖에 없다.
클로져는 함수 내 지역변수를 함수 밖에서 참조 할 수 있다.
 */

function add(){
    let n = 0;
    return function(){
        return ++n;
    }
}

let increase = add();
console.log(increase());
console.log(increase());


function multiply(n){
    return function(){
        return n*=n;
    }
}

let num01 = multiply(10);
console.log(`num01: ${num01()}`);
console.log(`num01: ${num01()}`);
```

결과
```
1
2
num01: 100
num01: 10000
```

<hr/>

# 내장함수

자바스크립트에 내장되어 있는 함수들

## 인코딩, 디코딩

|함수명|설명|
|---|:---:|
|`encodeURIComponenet()`|영문, 숫자, (,), -, ., ~, * !를 제외한 문자를 인코딩.|
|`decodeURIComponenet()`|encodeURIComponenet()의 디코딩 함수.

ex)
```javascript
'use strict';

let str01 = 'pcwk_자바스크립트';

console.log(`str01: ${str01}`);

let encodeStr = encodeURIComponent(str01);
console.log(`encodeStr: ${encodeStr}`);

let decodeStr = decodeURIComponent(encodeStr);
console.log(`decodeStr: ${decodeStr}`);

```

결과
```
str01: pcwk_자바스크립트
encodeStr: pcwk_%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8
decodeStr: pcwk_자바스크립트
```

<hr/>

## 숫자, 유/무한 값 판별

|함수명|설명|
|---|:---:|
|`isNaN()`|숫자가 아니면 true, 그렇지 않으면 false|
|`isFinite()`|유한값이면 true, 그렇지 않으면 false|

ex)
```javascript
'use strict';

let num01 = '100F';

if(isNaN(num01) == true){
    console.log(`숫자가 아니면: ${isNaN(num01)}`);
}
else{
    console.log(`숫자이면: ${isNaN(num01)}`);
}

let num02 = 1/0;
if(isFinite(num02) == true){
    console.log(`유한이면: ${isFinite(num02)}`);
}
else{
    console.log(`무한이면: ${isFinite(num02)}`);
}
```

결과
```
숫자가 아니면: true
무한이면: false
```

<hr/>

## 숫자 문자 변환함수

|함수명|설명|
|---|:---:|
|`Number()`|숫자로 변환해 주는 함수|
|`parseInt()`|문자를 숫자로 변환해 주는 함수|
|`parseFloat()`|문자를 실수로 변환해 주는 함수|
|`String()`|문자로 변환해 주는 함수|

ex)
```javascript
'use strict';

let str01 = '11';

console.log(`str01: ${str01}, type: ${typeof str01}`);

// Number(): 문자형 숫자를 숫자로 변환
console.log(`str01: ${Number(str01)}, type: ${typeof Number(str01)}`);


// parseInt(): 문자를 숫자로 변환(22px -> 22)
let str02 = '100px';
console.log(`str02: ${str02}, type: ${typeof str02}`);
console.log(`str02: ${parseInt(str02)}, type: ${typeof parseInt(str02)}`);

// parseFloat(): 문자를 실수로 변환(33.33% -> 33.33)
let str03 = '33.33%';
console.log(`str03: ${str03}, type: ${typeof str03}`);
console.log(`str03: ${parseFloat(str03)}, type: ${typeof parseFloat(str03)}`);
```


결과
```
str01: 11, type: string
str01: 11, type: number
str02: 100px, type: string
str02: 100, type: number
str03: 33.33%, type: string
str03: 33.33, type: number
```

<hr/>

## 자바스크립트 코드 변경 함수

문자를 자바스크립트 코드로 변경
> 절대 사용하지 말것! 해킹 위험이 있음


|함수명|설명|
|---|:---:|
|`eval()`|문자를 자바스크립트 코드로 변경|

ex)
```javascript
//'use strict';

// 문자를 자바스크립트 코드로 변경

// let 변수는 안됨, var 변수만 가능

var str01 = 'var num01 = 11';
var str02 = 'var num02 = 13';

eval(str01);
eval(str02);
// num01 + num02 = 24

console.log(`num01 + num02= ${num01+num02}`);
```

결과
```
num01 + num02= 24
```

<hr/>

## 객체

변수는 데이터 값을 하나 밖에 저장 하지 못하지만, 객체는 데이터값을 필요한 만큼 만들어 사용할 수 있다.

객체의 데이터는 ``이름: 값``있으면 이것을 속성(properties)이라고 한다.

```
ex)
let 변수이름 = {name:'이상무', age:20, nationality:'대한민국'};
```

|객체의 분류|종류|설명|
|---|:---:|:---:|
|사용자 정의 객체|객체리터럴|사용자 정의 함수|
||객체 생성자 함수||
||클래스(ECMAScript 2015(ES6)||
|내장 객체|Number|자바스크립트에서 제공해 주는 객체|
||String||
||Array||
||Math||
||Date||
||RegRexp||

## 객체 리터럴과 객체 생성자 함수로 만들 수 있다.

```
형식
let 변수 = {
  프로퍼티 값1 : 값,
  프로퍼티 값2 : 값
  
  메서드: function(){
         }
}
```
```javascript
ex)
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
```

결과
```
info.subject: javascript
info.credit: 5
info.printOut: javascript, 5
```

## 객체 리터럴의 속성 추가, 삭제, 변경

```javascript
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
```

결과
```
info.subject: javascript
info.credit: 5
info.printOut: javascript, 5
info.days: 7
info.credit: undefined
info.printOut(): javascript, 7
```

## 객체 생성자 함수(Object Constructor Function)

```
형식
function 함수(매개변수1, 매개변수2){
  함수이름 시작 첫글 대문자
  this.프로퍼티1 = 매개변수1;
  this.프로퍼티2 = 매개변수2;
  
  this.프로퍼티3 = function(){
    
  }
}

let 변수 = new 함수(매개변수1, 매개변수2);
```

위의 코드와 이어짐.
```javascript
// 생성자 함수
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
```

결과
```
subject01.subject: javascript
subject01.credit: 5
subject01.printOut(): javascript, 5
subject02.subject: css
subject02.credit: 5
subject02.printOut(): css, 5
```

WEB/studyhtml/WebContent/js/j06/j01.js

```javascript
'use strict';

// 객체 리터럴

let circle = {
    color : 'yellow',
    diameter : 100,
    radius : function(){
        return this.diameter/2;
    }
};

console.log(`circle.color: ${circle.color}`);
console.log(`circle.diameter: ${circle.diameter}`);
console.log(`circle.radius(): ${circle.radius()}`);

// 객체 생성자 함수

function Triangle(b,h){
    this.base = b;
    this.height = h;
    this.area = function(){
        return this.base * this.height /2;
        
    };
}

let triangle01 = new Triangle(10,10);
let triangle02 = new Triangle(20,10);

console.log(`triangle01.base: ${triangle01.base}`);
console.log(`triangle01.height: ${triangle01.height}`);
console.log(`triangle01.area(): ${triangle01.area()}`);

console.log(`triangle02.base: ${triangle02.base}`);
console.log(`triangle02.height: ${triangle02.height}`);
console.log(`triangle02.area(): ${triangle02.area()}`);
```

결과
```
circle.color: yellow
circle.diameter: 100
circle.radius(): 50
triangle01.base: 10
triangle01.height: 10
triangle01.area(): 50
triangle02.base: 20
triangle02.height: 10
triangle02.area(): 100
```

<hr/>

## prototype

prototype을 이용하면 객체의 메서드를 생성자 함수 내에 정의 하지 않고도 생성된 객체에서 호출 가능.

WEB/studyhtml/WebContent/js/j06/j02.js
```javascript
'use strict';

//prototype을 이용하면 객체의 메서드를 생성자 함수 내에 정의 하지 않고도 생성된 객체에서 호출 가능.

// 생성자 함수
function Triangle(b,h){
    this.base = b;
    this.height = h;
}

// 동적 추가된 함수
Triangle.prototype.area = function(){
    return this.base * this.height / 2;
};

// 동적 추가된 함수
Triangle.prototype.printOut = function(){
    return '밑변:' + this.base + ', 높이:' + this.height + ', 넓이:' + this.area(); 
};

let triangle01 = new Triangle(10,10);
console.log(`triangle.area: ${triangle01.area()}`);
console.log(`triangle01.printOut: ${triangle01.printOut()}`);
```

결과
```
triangle.area: 50
triangle01.printOut: 밑변:10, 높이:10, 넓이:50
```
<hr/>

##for..in 문
객체에 속성에 쉽게 접근 가능

```
형식)
for(let 변수 in 객체명){
  실행문;
}
```

WEB/studyhtml/WebContent/js/j06/j03
```javascript
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
```

결과
```
i=subject, 	 info[subject]=JavaScript
i=credit, 	 info[credit]=3
i=days, 	 info[days]=20
i=tuition, 	 info[tuition]=100
```
<hr/>

## class

ECMAScript 2015(ES6)에서 새로 추가
객체 생성, 상속도 가능.

```
class 클래스명{
  constructor(매개변수01, 매개변수02, ...){
    this.이름01 = 매개변수01;
    this.이름02 = 매개변수02;
  }
  메서드(){}
  
  get 메서드(){}
  
  set 메서드(){}
}

let 변수01 = new 클래스명(매개변수01, 매개변수02,...);
let 변수02 = new 클래스명(매개변수01, 매개변수02,...);
```

WEB/studyhtml/WebContent/js/j06/j04.js
```javascript
'use strict';

class Person{
    // 생성자
    constructor(name, age){
        //멤버변수
        this.name = name;
        this.age = age;
    }
    // 메서드
    speak(){
        console.log(`name: ${this.name}, age: ${this.age} speak!`);
    }
}

const pcwk = new Person('PCWK',23);
// 멤버변수
console.log(`pcwk.name: ${pcwk.name}, pcwk.age: ${pcwk.age}`);
pcwk.speak();
```

결과
```
pcwk.name: PCWK, pcwk.age: 23
name: PCWK, age: 23 speak!
```

<hr/>

## User class생성, get, set 사용

WEB/studyhtml/WebContent/js/j06/j05.js
```javascript
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
```

결과
```
name: PCWK
pass: undefined
age: -1
age: 0
```

<hr/>

## callback function

자바스크립트 함수는 일급객체(first-class object)

함수의 파람으로 함수가 전달!

1급 객체란?
아래 3 가지조건을 충족한다면 1급 객체라고 할수 있습니다.
- 변수나 데이타에 할당 할 수 있어야 한다.
- 객체의 인자로 넘길 수 있어야 한다.
- 객체의 리턴값으로 리턴 할수 있어야 한다.

WEB/studyhtml/WebContent/js/j06/j06.js
```javascript
'use strict';

// 더하기
function add(num01, num02){
    return num01 + num02;
}

// 곱하기
function multiply(num1, num2){
    return num1 * num2;
}

function surprise(callback){
    const result = callback(11,10);
    
    console.log(`result: ${result}`);
}

//
surprise(add);
surprise(multiply);
```

결과
```
result: 21
result: 110
```

## 상속

```
class child extends parents{

}
```

<img src="https://user-images.githubusercontent.com/104181668/166396221-fe0aeebb-4f8c-453c-9bc2-a2a70970915e.png"></img>

WEB/studyhtml/WebContent/js/j06/j07.js
```javascript
'use strict';

class Shape{
    
    constructor(width,height,color){
        this.width = width; // 넓이
        this.height = height; // 높이
        this.color = color; // 색상
    }
    
    draw(){
        console.log(`drawing: ${this.color} color!`);
    }
    
    getArea(){
        return this.width * this.height;
    }
}

// 사각형
class Rectangle extends Shape{
    
} 


// 사각형 클래스
const rectangle = new Rectangle(10,10,'Red');

rectangle.draw();
console.log(`rectangle.getArea(): ${rectangle.getArea()}`);

// 삼각형
class Triangle extends Shape{
    
    draw(){
        // parent에 있는 메서드 호출
        super.draw();
        console.log(`Triangle drawing Blue color!`);
    }
    
    // getArea() 재정의
    getArea(){
        return (this.width*this.height)/2;
    }
    
    toString(){
        return `Triangle: color: ${this.color}}`;
    }
    
}

const triangle = new Triangle(10,10,'yellow');

triangle.draw();
console.log(`triangle.getArea(): ${triangle.getArea()}`);
console.log(`triangle.toString(): ${triangle.toString()}`);

// instanceof
console.log(`triangle instanceof shape: ${triangle instanceof Shape}`);

// 사각형, 삼각형
console.log(`triangle instanceof rectangle: ${triangle instanceof Rectangle}`);
```

결과
```
drawing: Red color!
rectangle.getArea(): 100
drawing: yellow color!
Triangle drawing Blue color!
triangle.getArea(): 50
triangle.toString(): Triangle: color: yellow}
triangle instanceof shape: true
triangle instanceof rectangle: false
```


# 내장객체
Number, String, Array, Math, Date, RegExp, Set, Map


```
생성방법
let num = new Number(11);

let num = 13;
```

|메서드|설명|
|---|:---:|
|toFixed()|toFixed(n)일때 n값 만큼의 소수점 자릿수를 만들어준다.<br>(자릿수 이전 값은 반올림)|
|toString()|toString(n)일때 n값의 진수로 만들어 줍니다.|

WEB/studyhtml/WebContent/js/j06/j08.js
```javascript
'use strict';

// Number 객체 생성
let num01 = new Number(10);

let num02 = 12;

console.log(`num01+num02 = ${num01+num02}`);

let num = 328.575;
// toFixed() : toFixed(n)일 때 n값 만큼의 소수점 자릿수를 만들어 준다.
console.log(`num.toFixed(1): ${num.toFixed(1)}`);
console.log(`num.toFixed(2): ${num.toFixed(2)}`);
console.log(`num.toFixed(): ${num.toFixed()}`);

num = 12;

//toString(n)일때 n값의 진수로 만들어 줍니다.
console.log(`num.toString(2): ${num.toString(2)}`);
```

결과
```
num01+num02 = 22
num.toFixed(1): 328.6
num.toFixed(2): 328.57
num.toFixed(): 329
num.toString(2): 1100
```

## String 객체
내장 객체중 가장 많이 사용하는 객체입니다.

https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/String

```
let str = new String('자바스크립트');
let str = '자바스크립트';
```

WEB/studyhtml/WebContent/js/j06/j09.js
```javascript
'use strict';

let str = 'Javascript';
console.log(`str: ${str}`);

// length: 문자열의 길이
console.log(`str.length: ${str.length}`);

// charAt(n): n과 같은 index번호에 위치한 문자를 반환
console.log(`str.charAt(8): ${str.charAt(8)}`);

// indexOf('a')
// 'a'를 왼쪽부터 문자를 검색해서 일치하는 index에 해당하는 문자 반환
console.log(`str.indexOf('a'): ${str.indexOf('a')}`);

// lastIndexOf('a')
// 'a'를 오른쪽부터 문자를 검색해서 일치하는 index에 해당하는 문자 반환
console.log(`str.lastIndexOf('a'): ${str.lastIndexOf('a')}`);

// substring(4,9): 문자열 index번호 4부터 index 9이전까지 출력
// str.substring(4,9): script 끝번호는 포함되지 않음
console.log(`str.substring(4,9): ${str.substring(4,9)}`);

// substr(4,6): index번호 4번부터 6개의 문자
console.log(`str.substr(4,6): ${str.substr(4,6)}`);

// split('') ''(공백) 문자를 기준으로 문자열을 분할하고 return 배열
str = '010-1234-5678';
let phoneNumArray = str.split('-');
console.log(phoneNumArray[0]+''+phoneNumArray[1]+''+phoneNumArray[2]);

// replace('x','y') : 'x'문자를 'y'문자로 치환
str = 'Javascript';
console.log(`str.replaceAll('a','A'): ${str.replaceAll('a','A')}`);

// trim(): 문자열의 앞뒤 공백 제거
str = ' Javascript ';
console.log(`str.trim(): ${str.trim()}`);

// toLowerCase(): 소문자로
// toUpperCase(): 대문자로
console.log(`str.toUpperCase(): ${str.toUpperCase()}`);
console.log(`str.toLowerCase(): ${str.toLowerCase()}`);
```

결과
```
str: Javascript
str.length: 10
str.charAt(8): p
str.indexOf('a'): 1
str.lastIndexOf('a'): 3
str.substring(4,9): scrip
str.substr(4,6): script
01012345678
str.replace('a','A'): JAvAscript
str.trim(): Javascript
str.toUpperCase():  JAVASCRIPT 
str.toLowerCase():  javascript
```
<hr/>

# Bootstrap

## 부트스트랩이란?

부트스트랩(Bootstrap)은 웹사이트를 쉽게 만들 수 있게 도와주는 HTML, CSS, JS 프레임워크이다. 하나의 CSS로 휴대폰, 태블릿, 데스크탑까지 다양한 기기에서 작동한다. 다양한 기능을 제공하여 사용자가 쉽게 웹사이트를 제작, 유지, 보수할 수 있도록 도와준다.

## CDN

Content Delivery Network의 약자인 CDN은 지리적 제약 없이 전 세계 사용자에게 빠르고 안전하게 콘텐츠를 전송할 수 있는 콘텐츠 전송 기술

[Bootstrap]http://bootstrapk.com/getting-started/

[jquery]https://jquery.com/

[jquery CDN]https://releases.jquery.com/

<hr/>

# Array

객체 리터럴처럼 변수에 데이터 값을 필요한 만큼 저장할 수 있다.
저장된 값에는 자동으로 index가 부여된다.

```
ex)
  let subject = new Array(10,20,'javascript','css');
  let subject = [10,20,'javascript','css'];
  length : 배열의 길이 return
```

WEB/studyhtml/WebContent/js/j07/j01.js
```javascript
'use strict';

let subject = [11,13,'html','javascript','jquery'];

console.log(`subject[0]: ${subject[0]}`);

// 배열에 길이
console.log(`subject.length: ${subject.length}`)

// 대문자로 변경
subject[3] = subject[3].toUpperCase();
console.log(`subject[3]: ${subject[3]}`);

// 배열에 값을 for문을 이용해 모두 출력
for(let i=0; i<subject.length; i++){
    console.log(`subject[${i}]: ${subject[i]}`);
}

// 배열에 요소 추가: push('jsp');
let newLength = subject.push('jsp');
console.log(`newLenght: ${newLength}`);

for(let i=0; i<subject.length; i++){
    console.log(`subject[${i}]: ${subject[i]}`);
}

// toString(): 배열을 문자열로 변환
console.log(`{subject.toString: ${subject.toString()}}`)

// join('-'): 배열의 요소를 '-'로 연결
console.log(`subject.join('-'): ${subject.join('-')}`);

// 배열과 배열의 결합: concat()
let alpha01 = ['a','b','c'];
let alpha02 = ['D','E','Z'];
console.log(`alpha01.concat(alpha02): ${alpha01.concat(alpha02)}`);
```

결과
```
subject[0]: 11
subject.length: 5
subject[3]: JAVASCRIPT
subject[0]: 11
subject[1]: 13
subject[2]: html
subject[3]: JAVASCRIPT
subject[4]: jquery
newLenght: 6
subject[0]: 11
subject[1]: 13
subject[2]: html
subject[3]: JAVASCRIPT
subject[4]: jquery
subject[5]: jsp
{subject.toString: 11,13,html,JAVASCRIPT,jquery,jsp}
subject.join('-'): 11-13-html-JAVASCRIPT-jquery-jsp
alpha01.concat(alpha02): a,b,c,D,E,Z
```

## 배열 요소 접근 명령문 및 메서드

```
for ... in
  배열의 인덱스를 반환
```

WEB/studyhtml/WebContent/js/j07/j02.js
```javascript
'use strict';

let city = ['미국','영국','일본','필리핀','아이슬란드'];

for(let i in city){
    console.log(`i: ${i}, city[${i}]:${city[i]}`);
}

// for ... of문
for(let i of city){
    console.log(`i: ${i}`);
}
```

결과
```
i: 0, city[0]:미국
j02.js:6 i: 1, city[1]:영국
j02.js:6 i: 2, city[2]:일본
j02.js:6 i: 3, city[3]:필리핀
j02.js:6 i: 4, city[4]:아이슬란드
j02.js:11 i: 미국
j02.js:11 i: 영국
j02.js:11 i: 일본
j02.js:11 i: 필리핀
j02.js:11 i: 아이슬란드
```

## forEach()

배열의 요소에 순차적으로 접근하여 필요한 값을 만들때 사용하는 메서드

WEB/studyhtml/WebContent/js/j07/j03.js
```javascript
'use strict';

let numArray = [1,2,3,4,5,6,7];
let sum = 0;

numArray.forEach(function(value,index,array){
//    console.log(`value: ${value}`);
//    console.log(`index: ${index}`);
//    console.log(`index: ${index},${array}`);
    sum += value;
});

console.log(`sum=${sum}`);

// map() : 기존 배열을 이용해 새로운 배열을 생성

let base = [1,2,3];

let newArray = base.map(function(value,index,array){
    console.log(`value: ${value}, index: ${index}, array: ${array}`);
    return value*2;
});

console.log(`newArray: ${newArray.toString()}`);

// filter() : 조건에 맞는 배열의 요소들만 걸러 새로운 배열 생성

let data = ['JAVASCRIPT',20,30,'JQUERY'];

let numArray02 = data.filter(function(value,index,array){
   console.log(`value: ${value}, index: ${index}, array: ${array}`); 
   console.log(`type: ${typeof value}`);
   return typeof value == 'number';
});

console.log(`${numArray02.toString()}`);
```

결과
```
sum=28
value: 1, index: 0, array: 1,2,3
value: 2, index: 1, array: 1,2,3
value: 3, index: 2, array: 1,2,3
newArray: 2,4,6
value: JAVASCRIPT, index: 0, array: JAVASCRIPT,20,30,JQUERY
type: string
value: 20, index: 1, array: JAVASCRIPT,20,30,JQUERY
type: number
value: 30, index: 2, array: JAVASCRIPT,20,30,JQUERY
type: number
value: JQUERY, index: 3, array: JAVASCRIPT,20,30,JQUERY
type: string
20,30
```

# Math

https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Math

Math는 수학적인 상수와 함수를 위한 속성과 메서드를 가진 내장 객체입니다. 함수 객체가 아닙니다.

```
Math.프로퍼티
Math.메서드
```

WEB/studyhtml/WebContent/js/j07/j04.js
```javascript
'use strict';

// 1~100 배열 설정, 이중에 행운의 숫자 1개 출력

let luckyNumber = [];
for(let i=1; i<=100; i++){
    luckyNumber.push(i);
}

console.log(`luckyNumber.toString():${luckyNumber.toString()}`);

//Math.random() 함수는 0 이상 1 미만의 구간에서 근사적으로 균일한(approximately uniform) 부동소숫점 의사난수를 반환하며, 이 값은 사용자가 원하는 범위로 변형할 수 있다.
// 난수 생성 알고리즘에 사용되는 초기값은 구현체가 선택하며, 사용자가 선택하거나 초기화할 수 없다.

console.log(`Math.random(): ${Math.floor(Math.random() * luckyNumber.length)}`);
let idx = Math.floor(Math.random() * luckyNumber.length);
console.log(`luckyNumber: ${luckyNumber[idx]}`);
```

결과
```
luckyNumber.toString():1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
Math.random(): 2
luckyNumber: 21
```

## lotto

WEB/studyhtml/WebContent/js/j07/j05.js
```javascript
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
```

결과
```
28,13,4,42,9,1
after sort: 1,4,9,13,28,42
(45) [5, 28, 24, 31, 38, 39, 4, 41, 34, 11, 6, 37, 33, 19, 7, 13, 35, 25, 22, 16, 9, 21, 32, 36, 30, 1, 12, 45, 15, 44, 29, 42, 18, 27, 43, 23, 10, 14, 17, 26, 40, 20, 8, 2, 3]
1번째 번호 : 3
2번째 번호 : 2
3번째 번호 : 8
4번째 번호 : 20
5번째 번호 : 40
6번째 번호 : 26
```

# Date 객체

https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Date

날짜와 시간에 대한 정보를 얻거나 설정 할 수 있다.

JavaScript Date 객체는 시간의 한 점을 플랫폼에 종속되지 않는 형태로 나타냅니다. Date 객체는 1970년 1월 1일 UTC(협정 세계시) 자정과의 시간 차이를 밀리초로 나타내는 정수 값을 담습니다.

```
ex)
(local 시간)
  let date = new Date();
  let date = new Date('년도/월/일');
  let date = new Date('년도,월,일,시,분,초,밀리초');
```

WEB/studyhtml/WebContent/js/j07/j06.js
```javascript
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
```

결과
```
year: 2022
month: 7
day: 12
week: 2
hour: 14
minutes: 10
second: 45
miliseconds: 0
```

# 이벤트

마우스, 키이벤트, 폼이벤트, 로드, 기타 이벤트...


## 마우스 이벤트 
마우스 이벤트의 종류
 1. click 

 - 사용자해 해당 element를 클릭했을 때(버튼을 눌렀다가 떼었을 때) 발생 합니다.

 2. mousedown 

 - 사용자가 해당 element에서 마우스 버튼을 눌렀을 때 발생합니다.

 3. mouseup 

 - 사용자가 해당 element에서 눌렀던 마우스 버튼을 떼었을 때 발생합니다.

 4. dblclick 

 - 사용자가 해당 element에서 마우스 버튼을 더블 클릭했을 때 발생합니다.

 5. mousemove 

 - 사용자가 해당 element에서 마우스를 움직였을 때 발생합니다.

6. mouseover 

 - 사용자가 마우스를 해당 element 바깥에서 안으로 옮겼을 때 발생합니다.

 7. mouseout 

 - 사용자가 마우스를 해당 element 안에서 바깥으로 옮겼을 때 발생합니다.

 8. mouseenter 

 - 사용자가 마우스를 해당 element 바깥에서 안으로 옮겼을 때 발생합니다.

 - 버블링이 발생하지 않습니다.

 9. mouseleave 

 - 사용자가 마우스를 해당 element 안에서 바깥으로 옮겼을 때 발생합니다.

 - 버블링이 발생하지 않습니다.

 10. contextmenu 

 - 마우스 오른쪽 버튼을 눌렀을 때 발생합니다.

## 키이벤트
key down : 키가 눌렸을 때 발생

keyup : 키 누름이 해제될 때

keypress : 키가 눌린 상태일 때 -- 더이상 사용되지 않습니다. 사용이 권장되지 않습니다.


## 기타 이벤트

|이벤트|설명|
|---|:---:|
|load|로딩이 완료 되었을 때 발생되는 이벤트|
|scroll|스크롤바를 움직였을 때 발생되는 이벤트|
|resize|사이즈가 변경 되었을 때|


# 이벤트 연결 방식

인라인, 기본, 표준

## 인라인 이벤트 모델

html 요소에 직접 이벤트를 연결하는 방식

```
ex)
  <button onClick='doSave();'>저장</button>
```

WEB/studyhtml/WebContent/js/j07/h07.html
```html
  <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- 스타일 시트-->
<style type = "text/css">

</style>
<title>Insert title here</title>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	function sum(num) {
		alert(`num: ${num}`);
	}
</script>
</head>
<body>
	<h2>인라인 이벤트 모델</h2>
	<hr/>
	<button onclick="javascript:sum(10);">클릭</button>
</body>
</html>
```

## 기본 이벤트 모델

javascript에서 html요소를 취득한 후 이벤트를 객체의 메서드 형식으로 연결

```
ex)
  let btn = document.getElementId('bt');  // 요소 취득
  
  btn.onclick = function(){
    console.log('ok');
  }
```

WEB/studyhtml/WebContent/js/j07/h08.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- 스타일 시트-->
<style type = "text/css">

</style>
<title>Insert title here</title>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	window.onload = function(){
		
		console.log(`window.onload`);
		
		let btn = document.getElementById('btn');
		btn.onclick = function() {
			alert('btn.onclick');
		}
	} 
</script>
</head>
<body>
	<h2>기본 이벤트 모델</h2>
	<hr/>
	<button id="btn">클릭</button>
</body>
</html>
```

WEB/studyhtml/WebContent/js/j07/h09.html
기본 이벤트 모델로 다른 함수를 호출할 때는 함수에 ()를 붙이지 않는다.

```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- 스타일 시트-->
<style type = "text/css">

</style>
<title>Insert title here</title>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	window.onload = function(){
		
		console.log(`window.onload`);
		
		let btn = document.getElementById('btn');
		
		function view(){
			alert('btn.onclick');
		}
		// 기본 이벤트 모델로 다른 함수를 호출할 때는 함수에 ()를 붙이지 않는다.
		btn.onclick = view;
		// btn.onclick = view(); 이벤트 강제 수행
	} 
</script>
</head>
<body>
	<h2>기본 이벤트 모델</h2>
	<hr/>
	<button id="btn">클릭</button>
</body>
</html>


## 표준 이벤트 모델

객체.addEventListner('이벤트','처리함수');

WEB/studyhtml/WebContent/js/j07/h10.html

```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- 스타일 시트-->
<style type = "text/css">

</style>
<title>표준 이벤트 모델</title>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	// window에 html 엘리멘트가 로드 완료되면 발생!
	window.onload = function(){
		let btn = document.getElementById('btnSave');
		
		// 처리 함수
		function view(){
			alert('표준 이벤트 모델');
		}
		
		// Event 감지
		btn.addEventListener('click',view);
	}
</script>
</head>
<body>
	<h2>표준 이벤트 모델</h2>
	<hr/>
	<input type="button" value="표준이벤트" id="btnSave" />
	
</body>

</html>
```

## 이벤트 객체

자바스크립트에서 기본적으로 제공해주는 객체

마우스를 클릭했을 때 클릭한 좌표, 이벤트를 발생시킨 객체가 어떤 것인지 등 정보를 담고 있습니다.

```
btn.onclick = function(event){
	event.프로퍼티
	event.메서드
}
```

|프로퍼티|설명|
|---|:---:|
|target|이벤트를 발생시킨 객체를 반환|										
|type|이벤트의 이름을 반환|
|clientX|이벤트가 발생한 x좌표(브라우저 기준)|							
|clientY|이벤트가 발생한 y좌표(브라우저 기준)|						
|screenX|이벤트가 발생한 x좌표(모니터 기준)|			
|screenY|이벤트가 발생한 y좌표(모니터 기준)|				
|button|마우스 왼쪽(0), 가운데(1),오른쪽(2)|

WEB/studyhtml/WebContent/js/j07/h11.html

```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- 스타일 시트-->
<style type = "text/css">
    div{
        height: 100px;
        background: #718c00;
        margin-top: 20px;
        color: #fff;
    }
</style>
<title>Insert title here</title>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	window.onload = function(){
		// 클릭 버튼 객체
		let bt = document.getElementById('btn');
		
		bt.onclick = function(event){
			  console.log(`event.target: ${event.target}`);	
			  console.log(`event.type: ${event.type}`);
			  
			  console.log(`event.clientX: ${event.clientX}`);
			  console.log(`event.clientY: ${event.clientY}`);
			  
			  console.log(`event.screenX: ${event.screenX}`);
			  console.log(`event.screenY: ${event.screenY}`);
		};
		
		// div 객체
		let divArea = document.getElementById('area');
		
		divArea.onmousedown = function(event){
			  console.log(`event.button: ${event.button}`);	
		};
	}   
</script>
</head>
<body>
	<h2>이벤트 객체</h2>
	<hr/>
	<button id="btn">클릭</button>
	<div id="area">여기에 마우스 왼쪽, 가운데, 오른쪽 버튼 클릭!</div>
</body>
</html>
```

## 이벤트 객체 주요 메서드

|메서드|설명|
|---|:---:|
|preventDefault()|기본 이벤트의 실행을 막아준다.|
|stopPropagation()|이벤트 버블링을 방지한다.|

## preventDefault()

기본 이벤트는 html요소중 자바스크립트가 아닌 html요소 자체가 가지고 있는 이벤트
```
ex) form submit, a href 
```

WEB/studyhtml/WebContent/js/j08/h01.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- 스타일 시트-->
<style type = "text/css">

</style>
<title>preventDefault()</title>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	window.onload = function(){
		// a 객체
		let pcwk = document.getElementById('pcwk');
		
		pcwk.onclick = function(event){
			  alert('PCWK');	
			  //html요소 자체가 가지고 있는 이벤트를 막기
// 			  event.preventDefault();
			  
			  return false;
		};
	};
</script>
</head>
<body>
	<h2>preventDefault()</h2>
	<h5>기본 이벤트는 html요소중 자바스크립트가 아닌 html요소 자체가 가지고 있는 이벤트를 막기</h5>
	<hr/>
	
	<div>
	   <a href="http://cafe.daum.net/pcwk" id="pcwk">PCWK</a>
	</div>
</body>
</html>
```

## stopPropagation(), 이벤트 버블링

이벤트 버블링은 부모요소와 자식요소 모두에 이벤트가 연결되어 있을 경우 자식 요소의 이벤트를 실행 했을 때 부모 요소의 이벤트도 같이 실행되는 경우이다.

![image](https://user-images.githubusercontent.com/104181668/167048624-ef8510c5-ac3d-4904-8125-40c82c4e6260.png)

1. <input>에 할당된 onclick 핸들러 작동.
2. 바깥에 div에 할당된 핸들러 작동.
3. div 바깥의 <form>에 할당된 핸들러 작동.
4. document 객체를 만날 때까지 각 요소의 할당된 핸들러가 동작.

WEB/studyhtml/WebContent/js/j08/h02.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- 스타일 시트-->
<style type = "text/css">
    form,div,input{
        margin: 12px;
        border: 1px solid red;
    }
</style>
<title>Insert title here</title>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">

</script>
</head>
<body>
	<h2>버블링</h2>
	<p>이벤트 버블링은 부모요소와 자식요소 모두에 이벤트가 연결되어 있을 경우 자식 요소의 이벤트를 실행 했을 때 부모 요소의 이벤트도 같이 실행되는 경우이다.</p>
	<hr/>
	
	<form action="#" onclick="alert('form');">
	   <div onclick="event.stopPropagation();">
            <input type="submit" onclick="alert('submit')" value='클릭' />	   
	   </div>
	</form>
</body>
</html>
```

## 캡처링
	
이벤트에는 버블링 외에도 캡처링이라는 흐름이 존재한다. 실제 코드에서는 자주 쓰이지 않는다.
	
DOM 이벤트에서 정의한 이벤트 흐름 3가지 단계
1. 캡처링 단계 - 이벤트가 하위 요소로 전파
2. 타겟 단계 - 이벤트가 타겟 요소에 전달되는 단계
3. 버블링 단계 - 이벤트가 하위요소로 전파되는 단계!

![2](https://user-images.githubusercontent.com/104181668/167049026-5c3a9870-0ca4-4c74-b6a7-6e3adbd350a3.png)

<td>를 클릭하면 이벤트가 최상위 조상에서 시작해 아래로 전파(캡처링)-> 이벤트가 타겟 요소에 도착해 실행된 후(타겟 단계) -> 다시 위로 전파(버블링 단계)

