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

> ### Optional 
> #### 옵셔널은 값이 '있을 수도, 없을 수도 있다'는 것을 뜻한다.
> ``` 
> let optionalConstant = Int ?= nil
> let someConstant = Int = nill // error
> ```
>  옵셔널이 아닌 변수에 `nil` 값을 할당하려고 하면 컴파일 오류가 발생한다. 그리고 옵셔널 타입을 사용하라고 "?"를 추가하라고 한다.
>  `nil` 의 값을 가지려면 옵셔널 타입을 추가해주어야 한다. 옵셔널의 기본 값은 `nil` 이다.
>  변수에 아무것도 없다면 `nil` 을 반환해주게 되는데 `nil` 이 나오는 이유는 `nil` 도 메모리를 차지하고 있기 때문이라고 한다.
> ```
> var opVal: Int?
> print(opVal)
> // 출력 결과 : nil
> ```
>
> ### 옵셔널을 쓰는 이유
> 1. 명시적 표현
> - 옵셔널은 `nil` 의 가능성을 명시적으로 표현
> - `nil` 가능성을 문서화 하지 않아도 코드만으로 충분히 표현 가능
> - 문서와 주석 작성 시간을 절약(옵셔널을 사용해야만 값이 없을수도 있다는 것을 알 수 있기 때문에)
> 2. 안전한 사용
> - 전달 받은 값이 옵셔널이 아니라면 `nil` 체크를 하지 않더라도 안심하고 사용
> - 예외 상황을 최소화 하는 안전한 코딩
> - 효율적인 코딩
>
> ### 옵셔널 문법
> ```
> // 완전한 문법
> let optionalValue: Optional<Int> = nil
> // 물음표로 표현 가능
> let optionalValue: Int? = nil
> ```
>
> ### 물음표(?)와 느낌표(!)
> * `!` 를 이용한 암시적 추출 옵셔널 | Implicitly Unwrapped Optional
> ```
> var optionalValue: Int! = 100
> 
> switch optionalValue {
> case .none:
>     print("This Optional variable is nil")
> case .some(let value):
>     print("Value is \(value)")
> }
> 
> // 출력결과 : Value is 100
> ```
> 느낌표를 사용한 옵셔널은 기존 변수처럼 사용이 가능하고 `nil` 을 할당할 수 있다.
> 물음표를 사용한 일반적인 옵셔널의 경우 `nil` 의 값을 할당할 수 있지만, 기존 변수처럼 사용할 수 없다고 한다.

* storage - Strong / weak :
    아웃렛 변수를 추가할때 `Strong` 과 `Weak` 둘 중에서 선택하게 된다. 이 두 가지는 메모리 회수 정책을 나타내는 키워드이다.
    일반적으로 객체를 참조하기 위한 아웃렛 변수는 `strong` 을 사용한다. Xcode에서도 `strong` 을 기본값으로 선택하게 되어있다.
    `Weak` 로 아웃렛 변수를 선언하면 변수정의 앞에 `weak` 가 추가되지만 `Strong` 을 선택하면 아무런 키워드도 추가되지 않는다.

    `Strong`으로 선언된 변수는 다른 곳에서 참조하고 있을 경우 메모리에서 제거되지 않지만, `Weak`로 선언된 변수는 다른 곳에서 참조하고 있더라도 시스템이 임의적으로 메모리에서 제거할 수 있다.

    왜 두 가지 메모리 회수 정책을 사용할까?
    메모리 관리 이슈때문이다.
    `strong`으로 선언된 변수들끼리 상호 참조하는 일이 생길 경우에는 앱이 종료되기 전까지는 메모리에서 제거되지 않기 때문에 메모리 누수가 발생한다.
    이 경우 어느 한 변수 또는 모든 변수를 `weak`로 지정하면 시스템에서 임의로 제거할 수 있으므로 상호 참조할 때에도 사용하지 않을 경우에는 메모리가 삭제될 수 있다.


## 2. Action Function
```
@IBAction func sliderValueControl(_sender : UISlider){
    print("slider value changed")
}
```
* @IBAction :
    @IBAction으로 정의된 함수를 액션 함수라 부른다.
    버튼을 누르거나, 피커가 선택되는 등, 특정 객체에서 원하는 이벤트가 발생했을 때 정해진 작업을 실행하기 위해 사용한다.

* func sliderValueControl :
    함수를 선언하는 func 뒤에 액션 함수의 이름 bthSend를 입력하여 액션 함수를 선언한다.

* (_ sender: UISlider):
    액션 함수가 실행되도록 이벤트를 보내는 객체, 여기서는 slider객체에 이벤트가 발생했을 때 해당 액션 함수를 실행시킬 것이므로 UISlider 클래스 타입을 선택한다.