# WEB
# JavaScript

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
```
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
```
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
```
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
