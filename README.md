# DLS
---
## 세팅하기
- **현재 지원중인 os : window**
- **dart 언어를 먼저 다운받으셔야 합니다**
- 환경변수를 DLS/bin 으로 세팅한다
- cmd 를 켜서 dls -v 으로 세팅이 되었는지 확인한다
- cmd 에 dls-h 를 실행시키면 vscode 에 하이라이팅이 적용됩니다
---
### 0. 주석처리
```
// 주석
```
---
### 1.0 변수 지정방법
이름 = 값
```
name = "DLS"
print(name) // DLS
```
### 1.1 global 변수 지정방법
```
global.name = "DLS"
print(global.name) // DLS
```
---
### 2.0 함수 정의하기
def 이름(매개변수) {}
```
def get() {
    return "DLS"
}
```
### 2.1 비동기함수 정의하기
```
def doing() async {
    //await somedoing()
    return 0
}
```
### 2.2 함수 호출하기
```
//위에서 선언한 get 함수를 실행합니다
get()
//위에서 선언한 get 함수의 리턴값을 불러옵니다
user = get()
```
### 2.3 비동기함수수함수 호출하기
```
//위에서 선언한 doing 함수를 실행합니다
await doing()
//위에서 선언한 doing() 함수의 리턴값을 불러옵니다
reply = await doing()()
```
---
### 3.0 모듈 불러오기
```
import "모듈 혹은 파일위치"
```
-- read.ds
```
def get() {
    return "DLS"
}
```
-- index.ds
```
import "./read.dart" // ds 파일이 dart 파일로 컴파일러 되므로 dart 파일로 불러와야합니다
user = read.get()
```
### 3.1 global 변수 불러오고 값 바꾸기
-- 3.0 을 응용해서 global 변수를 가져올수있습니다
-- read.ds
```
def after() {
    print(global.data)
    global.data = 2
    print(global.data)
}
global.data = 0
print(global.data)
```
-- index.ds
```
import "./read.dart"
read.global.data = 1
print(read.global.data)
read.after()
```
-- 출력
```
0
1
2
```
### 이외기능
-- 정수 리피터
```
number = 1_000_000
print(number) // 1000000
```
-- 타입변환
```
import "DLS:type.dart"
string = "12"
number = 12
print("int -> string ${str(number)}")
print("string -> int ${int(string)}")
```