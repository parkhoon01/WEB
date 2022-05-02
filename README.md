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
ex)
let 변수 = {
  프로퍼티 값1 : 값,
  프로퍼티 값2 : 값
  
  메서드: function(){
         }
}
```
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
```

결과
```
info.subject: javascript
info.credit: 5
info.printOut: javascript, 5
```

## 객체 리터럴의 속성 추가, 삭제, 변경

```javascrpt
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
