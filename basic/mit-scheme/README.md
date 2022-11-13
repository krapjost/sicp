# MIT-scheme 튜토리얼 (Yet Another Scheme Tutorial)
개인적인 공부를 위해 번역하기로 했습니다. 많이 건너뛰면서 번역할 예정이니 부족한 부분이 있다면
[원문](http://www.shido.info/lisp/idx_scm_e.html)은 여기에 있습니다.
번역에 잘못된 부분이 보인다면 알려주세요.

## 도입
초심자를 위한 스킴 튜토리얼입니다. 조금의 프로그래밍 경험이 있는 독자를 대상으로 합니다.


다른 튜토리얼에 만족하지 못하셨다면 이 튜토리얼을 따라해보세요.
프로그래밍 언어 지식 구조와 같은 추상적인 주제를 설명하는데는 많은 방법이 있고,
독자에게 가장 좋은 방법은 독자 자신의 능력과 배경에 의존하게 됩니다.
(모두에게 맞는 절대적인 최고의 방법이란 없습니다.)
이게 제가 다른 좋은 튜토리얼들이 있음에도 이 글을 작성한 이유입니다.


이 튜토리얼의 목표는 SICP를 읽을 수 있을 정도의 스킴 프로그래밍 언어 지식과 경험을 제공하는 것입니다.
SICP는 최고의 컴퓨터 과학 책 중 하나입니다.


<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**목차**

- [MIT-scheme 튜토리얼 (Yet Another Scheme Tutorial)](#mit-scheme-튜토리얼-yet-another-scheme-tutorial)
- [도입](#도입)
- [목차](#목차)
- [MIT-scheme 설치](#mit-scheme-설치)
- [스킴을 계산기로 사용하기](#스킴을-계산기로-사용하기)
- [리스트 만들기](#리스트-만들기)
- [함수 정의하기](#함수-정의하기)
- [브랜칭](#브랜칭)
- [지역 변수들](#지역-변수들)
- [반복하기 (Looping)](#반복하기-looping)
- [고차함수 (Higher Order Function)](#고차함수-higher-order-function)
- [입출력 (IO)](#입출력-io)
- [할당 (Assignment)](#할당-assignment)
- [문자, 문자열 (Char, String)](#문자-문자열-char-string)
- [심볼](#심볼)
- [링크드 리스트와 해시 테이블 (Association List and Hash table)](#링크드-리스트와-해시-테이블-association-list-and-hash-table)
- [벡터와 구조체 (Vector and Structure)](#벡터와-구조체-vector-and-structure)
- [구문 정의하기 (Defining Syntaxes)](#구문-정의하기-defining-syntaxes)
- [계속 (Continuation)](#계속-continuation)
- [지연 계산 (Lazy Evaluation)](#지연-계산-lazy-evaluation)
- [비결정론 (Nondeterminism)](#비결정론-nondeterminism)

<!-- markdown-toc end -->


## MIT-scheme 설치
### 왜 스킴인가?
스킴을 사용하면:
- 아름다운 프로그램을 작성할 수 있다.
- 프로그래밍을 즐길 수 있다.

이것들이 유일한 이유입니다. 스킴으로 실용적인 앱을 작성하기엔 조금 어렵습니다.

하지만, 훌륭한 해커들은 스킴을 좋아합니다. 배울만한 가치가 있습니다.
SICP는 스킴을 프로그램을 설명하기 위해 사용하고 있습니다.
GNU 또한 스킴(guile)을 공통된 스크립팅 언어로 사용하고 있습니다.
guile은 MS-Word나 Excell의 매크로로 사용되기도 합니다.
간단한 스크립트로 앱을 조작할 수 있습니다.

게다가 Common-Lisp은 실용적인 앱을 만드는데 사용되기도 하는데,
저는 다음 이유로 우선 스킴을 먼저 배우는 것을 추천합니다.

1. 간단한 언어 디자인
2. 단순한 문법


[스킴을 배우면 더 나은 프로그래머가 된다](http://www.catb.org/~esr/faqs/hacker-howto.html#skills1)고들 합니다.

    > LISP is worth learning for a different reason — the profound enlightenment experience you will have when you finally get it. That experience will make you a better programmer for the rest of your days, even if you never actually use LISP itself a lot. (You can get some beginning experience with LISP fairly easily by writing and modifying editing modes for the Emacs text editor, or Script-Fu plugins for the GIMP.)
    
실제로 스킴을 사용하는 일이 드물지라도, 스킴을 배우며 길러진 좋은 감각은 다른 언어를 배울 때에
도움이 될 것입니다.

스킴 튜토리얼들은 웹에 많이 있지만 초심자들을 위해서는 조금 어렵기도 합니다.
반면 이 튜토리얼은 약간의 프로그래밍 지식이 있는 초심자들을 위해 쓰여졌습니다.

### 스킴 설치

이 튜토리얼에서는 [MIT/GNU Scheme](https://www.gnu.org/software/mit-scheme/)을 사용합니다.
MIT-Scheme은 설치하기 쉽고, 높은 성능을 보여줍니다. 인터프리터는 꽤 빠르고 네이티브 코드로 컴파일도 가능합니다.

사실상, MIT-Scheme와 DrRacket만 인스톨러가 준비되어 있습니다. 어떤 이들은 Racket을 추천하지만 좀 느립니다. 프로그램을 설치할 수 있을 정도의 지식이 있다면 [Petite Chez Scheme](https://www.scheme.com/petitechezscheme.html)도 추천합니다. Cmd line에서 작동하는
인터프리터가 있습니다.

스킴 구현체들은 다양합니다. 스킴에 익숙해졌다면 다른 구현체들도 시도해보는 것도 좋은 생각입니다.
하지만 대부분의 스킴 구현체들은 유닉스나 리눅스에서 돌아가기 때문에 맥이나 리눅스를 사용해야 합니다.

설치가 끝나면 HOME 디렉터리에 scheme.ini 파일을 작성하여 MIT-Scheme을 설정할 수 있습니다.


#### 역자 주

이 튜토리얼에서는 윈도우용 인스톨러를 안내하고 있지만 현재(2022-11-13) 기준으로는 [더 이상 지원하지
않는다고 합니다](https://www.gnu.org/software/mit-scheme/#:~:text=We%20no%20longer%20support%20OS/2%2C%20DOS%2C%20or%20Windows%2C%20though%20it%27s%20possible%20that%20this%20software%20could%20be%20used%20on%20Windows%20Subsystem%20for%20Linux). 하지만 [9.x버전](https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/9.2/)까지는
윈도우용으로 배포되고 있으니 이것으로 설치하거나 WSL을 사용하시면 될 것 같습니다.
또한 MacOS의 경우 MIT/GNU Scheme이 메모리를 관리하는 방법에 충돌이 있어 현재는 M1칩을 지원하지 않고 있다고 합니다.

###### Mac

``` sh
brew install mit-scheme
```

###### Arch
``` sh
yay -S mit-scheme
# or
pacman -S mit-scheme
```


## 스킴을 계산기로 사용하기

터미널에서 scheme을 입력하면 REPL이 실행됩니다.

1 + 2 는 `(+ 1 2)`를 입력합니다.
``` scheme
1 ]=> (+ 1 2)

;Value: 3

1 ]=> 
```

1. 괄호는 계산의 단계를 의미합니다.
2. 열리는 괄호 뒤에는 함수 이름이 옵니다. 나머지는 인자입니다.
3. 토큰은 스페이스, 탭, `\n` 개행으로 구분합니다. 쉼표나 콜론은 필요 없습니다.

계산이 수행되는 프로세스를 따라가봅시다.
계산은 모든 인자들의 값이 평가된 후 수행됩니다.
값의 평가 순서는 특정할 수 없습니다. 
인자들이 항상 왼쪽에서 오른쪽 순으로 평가되지는 않는다는 의미입니다.

- `+` 심볼은 덧셈 프로시져로 평가됩니다. REPL에 `+`만 실행하면 다음이 출력됩니다.
``` scheme
;Value: #[arity-dispatched-procedure 12]
```
이는 `+` 심볼이 '12번 프로시져' 를 위한 심벌임을 나타냅니다.

- `1`은 1로 평가됩니다. 보통 불린, 숫자, 문자, 문자열은 그 자체로 평가됩니다. 반면 심볼은 다른 것으로 평가됩니다.

- `2`는 2로 평가됩니다.

- 마지막으로 `(+ 1 2)`는 3으로 평가되고 괄호를 벗어납니다. 스킴에서는 평가된 값들은 괄호 밖으로 빠져나오고
가장 밖에 있는 괄호에서 벗어나는 값이 출력됩니다.

함수 `+`의 아규먼트는 정해진 갯수가 없습니다.

``` scheme
(+) → 0
(+ 1)  → 1
(+ 1 2) → 3
(+ 1 2 3) → 6
```


### 기본 산술 연산자

스킴과 대부분의 리습은 분수(fractional numbers)를 다룰 수 있습니다.
함수 `exact->inexact`는 분수를 float형 숫자로 바꿔줍니다.
스킴은 복소수(complex number)도 다룰 수 있습니다.
복소수는 `a`+`b`i로 표현됩니다. `a`는 실수이고 `b`는 허수를 말합니다.
`+ - * /`는 각각 덧셈, 뺄셈, 곱셈, 나눗셈입니다.

``` scheme
(- 10 3) 
; → 7

(- 10 3 5)
; → 2

(* 2 3)
; → 6

(* 2 3 4)
; → 24

(/ 29 3)
; → 29/3

(/ 29 3 7)
; → 29/21

(/ 9 6)
; → 3/2

(exact->inexact (/ 29 3 7))
; → 1.380952380952381
```

괄호들은 다음과 같이 중첩될 수 있습니다.

``` scheme
(* (+ 2 3) (- 5 3)) 
; → 10
(/ (+ 9 1) (+ 2 3))
; → 2
```

공식은 괄호, 토큰, 구분자로 이뤄져있고 이것을 S표현식(S-expression)이라고 말합니다.

#### 문제 1

다음을 스킴 인터프리터에서 계산해보세요.

1. (1+39) * (53-45)
2. (1020 / 39) + (45 * 2)
3. 39, 48, 72, 23, 91의 합
4. 39, 48, 72, 23, 91의 평균을 float으로 출력

### 다른 산술 연산자들

#### quotient, remainder, modulo, sqrt

- `quotient`는 몫
- `remainder`와 `modulo`는 나머지
- `sqrt`는 제곱근

``` scheme
(quotient 7 3) → 2
(modulo 7 3) → 1
(sqrt 8) → 2.8284271247461903
```

#### 삼각 함수들

`sin`, `cos`, `tan`, `asin`, `acos`, `atan` 이 있습니다.
`atan`은 하나 혹은 두개의 인자를 받습니다.
atan의 값이 `1/2 pi`일 것으로 예상된다면 두개의 인자를 사용하세요.

#### 지수와 로그
지수와 로그는 `exp`와 `log`를 사용합니다.
`a`의 `b`승은 다음처럼 계산합니다.

`(expt a b)`


#### 문제 2

1. π
2. exp(2/3)
3. 4의 3승
4. 1000의 로그

### 요약

스킴 인터프리터를 계산기로 사용해봤습니다.
다음 챕터에서는 스킴에서 '리스트' 데이터 타입에 대해 설명하겠습니다.

### 연습문제 정답
#### 답 1

``` scheme
;1
(* (+ 1 39) (- 53 45))              ⇒    320

;2
(+ (/ 1020 39) (* 45 2))            ⇒    1510/13

;3
(+ 39 48 72 23 91)                  ⇒    273

;4
(exact->inexact (/ (+ 39 48 72 23 91) 5))   ⇒    54.6
```

#### 답 2
``` scheme
;1
(* 4 (atan 1.0))          ⇒   3.141592653589793

;2
(exp 2/3)                 ⇒   1.9477340410546757

;3
(expt 3 4)                ⇒   81

;4
(log 1000)                ⇒   6.907755278982137

```

## 리스트 만들기


## 함수 정의하기


## 브랜칭


## 지역 변수들


## 반복하기 (Looping)


## 고차함수 (Higher Order Function)


## 입출력 (IO)


## 할당 (Assignment)


## 문자, 문자열 (Char, String)


## 심볼


## 링크드 리스트와 해시 테이블 (Association List and Hash table)


## 벡터와 구조체 (Vector and Structure)


## 구문 정의하기 (Defining Syntaxes)


## 계속 (Continuation)


## 지연 계산 (Lazy Evaluation)


## 비결정론 (Nondeterminism)
[비결정론적 알고리즘](https://ko.wikipedia.org/wiki/%EB%B9%84%EA%B2%B0%EC%A0%95%EB%A1%A0%EC%A0%81_%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98)

