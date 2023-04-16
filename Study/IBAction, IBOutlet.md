##### 23-04-16
##### 참고 블로그 : https://velog.io/@myeongs07/iOS-IBOutlet-IBAction
# IBAction, IBOutlet


> Outlet Variable, Action Function
스토리보드에 추가한 객체를 선택하고 내용을 변경하거나 특정 동작을 수행하도록 하기 위해서는 해당 객체에 접근할 수 있는 변수인 `아울렛 변수(Outlet Variable)`와 동작을 정의한 `액션 함수(Action Function)`가 필요하다.

예를 들어 스토리보드에 텍스트 필드를 추가하고, 사용자가 텍스트 필드에 이름을 입력하도록 하려면 텍스트필드를 받아 저장할 변수를 만들고, 변수와 텍스트필드를 연결시켜 줘야 한다. 
이때 텍스트필드와 연결될 변수를 `아울렛 변수(Outlet Variable)`이라고 한다. 
그리고 `send` 버튼을 입력하여 레이블에 출력하는 함수를 만들고 이 함수를 버튼과 연결 시켜줘야 한다. 이러한 함수를 `액션 함수(Action Function)`라고 한다.


## 1. Outlet Variable
```@IBOutlet var playPause: UIButton!``` 
* @IBOutlet : 
    IB는 Interface Builder의 약자로, @IB로 시작되는 변수나 함수는 인터페이스 빌더와 관련된 변수나 함수라는 것을 의미한다.
    @IBOutlet은 객체를 소스 코드에서 참조하기 위해 사용하는 키워드이며 주로 색상, 크기, 모양, 선의 두께, 텍스트 내용 등 객체의 속성을 제어하는데 사용한다.
* var playPause : 
    변수를 선언하는 var뒤에 아웃렛 변수의 이름을 입력하여 변수를 선언한다.
* UIButton! : 
    선언하고자 하는 변수의 타입을 나타낸다. 버튼 객체에 대한 변수 선언을 하므로 UIButton 클래스 타입을 선택했다. 여기서 UI는 User Interface를 의미한다.

> # Optional 
> #### 옵셔널은 값이 '있을 수도, 없을 수도 있다'는 것을 뜻한다.
> ``` 
> let optionalConstant = Int ?= nil
> let someConstant = Int = nill // error
> ```
> #### 옵셔널이 아닌 변수에 nil 값을 할당하려고 하면 컴파일 오류가 발생한다. 그리고 옵셔널 타입을 사용하라고 "?"를 추가하라고 한다.
> #### nil 의 값을 가지려면 옵셔널 타입을 추가해주어야 한다. 옵셔널의 기본 값은 `nil` 이다.
> #### 변수에 아무것도 없다면 nil을 반환해주게 되는데 nil 이 나오는 이유는 nil 도 메모리를 차지하고 있기 때문이라고 한다.
> ```
> var opVal: Int?
> print(opVal)
> // 출력 결과 : nil
> ```
> # 옵셔널을 쓰는 이유
> 1. 명시적 표현
> - 옵셔널은 nil의 가능성을 명시적으로 표현
> - nil 가능성을 문서화 하지 않아도 코드만으로 충분히 표현 가능
> - 문서와 주석 작성 시간을 절약(옵셔널을 사용해야만 값이 없을수도 있다는 것을 알 수 있기 때문에)
> 2. 안전한 사용
> 