Python의 클래스(Class)는 객체 지향 프로그래밍(OOP, Object-Oriented Programming)을 지원하는 핵심 개념 중 하나입니다. 클래스를 사용하면 데이터(속성)와 해당 데이터를 조작하는 메서드(함수)를 하나의 구조로 묶을 수 있습니다.

---

## **1. 클래스 정의**
클래스는 `class` 키워드를 사용하여 정의합니다.

```python
class Person:
    def __init__(self, name, age):  # 생성자 (Initializer)
        self.name = name  # 속성 (Attribute)
        self.age = age

    def introduce(self):  # 메서드 (Method)
        print(f"Hello, my name is {self.name} and I am {self.age} years old.")

# 객체 생성
p1 = Person("Alice", 25)
p1.introduce()  # Hello, my name is Alice and I am 25 years old.
```

---

## **2. 클래스 속성(Class Attribute) vs 인스턴스 속성(Instance Attribute)**
클래스 속성은 클래스 자체에 저장되는 값이고, 인스턴스 속성은 객체(인스턴스)별로 개별적으로 저장되는 값입니다.

```python
class Car:
    wheels = 4  # 클래스 속성 (모든 인스턴스가 공유)

    def __init__(self, brand):
        self.brand = brand  # 인스턴스 속성 (각 객체마다 다름)

c1 = Car("Toyota")
c2 = Car("Honda")

print(c1.wheels)  # 4
print(c2.wheels)  # 4
print(c1.brand)   # Toyota
print(c2.brand)   # Honda
```

---

## **3. 클래스 메서드, 정적 메서드**
### ① **인스턴스 메서드 (Instance Method)**
- `self`를 첫 번째 매개변수로 받아서, 개별 객체(인스턴스)를 조작할 수 있습니다.

### ② **클래스 메서드 (Class Method)**
- `@classmethod` 데코레이터를 사용하며, `cls`를 통해 클래스 자체에 접근할 수 있습니다.

### ③ **정적 메서드 (Static Method)**
- `@staticmethod` 데코레이터를 사용하며, 클래스나 인스턴스에 의존하지 않는 독립적인 메서드입니다.

```python
class Example:
    class_attr = "Class Attribute"

    def __init__(self, value):
        self.instance_attr = value

    def instance_method(self):
        return f"Instance method: {self.instance_attr}"

    @classmethod
    def class_method(cls):
        return f"Class method: {cls.class_attr}"

    @staticmethod
    def static_method():
        return "Static method: No access to class or instance attributes"

obj = Example("Instance Attribute")
print(obj.instance_method())  # 인스턴스 메서드 호출
print(Example.class_method())  # 클래스 메서드 호출
print(Example.static_method())  # 정적 메서드 호출
```

---

## **4. 상속(Inheritance)**
기존 클래스를 확장하여 새로운 클래스를 만들 수 있습니다.

```python
class Animal:
    def speak(self):
        return "Some sound"

class Dog(Animal):  # Animal을 상속받음
    def speak(self):
        return "Bark!"

dog = Dog()
print(dog.speak())  # Bark!
```

---

## **5. 다중 상속 (Multiple Inheritance)**
Python에서는 여러 부모 클래스를 상속받을 수 있습니다.

```python
class A:
    def method_A(self):
        return "A"

class B:
    def method_B(self):
        return "B"

class C(A, B):  # 다중 상속
    pass

obj = C()
print(obj.method_A())  # A
print(obj.method_B())  # B
```

---

## **6. 캡슐화 (Encapsulation)**
Python에서는 변수와 메서드의 접근 제한을 지원하지만, 완전히 숨기지는 않습니다.
- `_변수명`: **(Protected)** 내부적으로 사용을 권장, 외부에서 접근 가능
- `__변수명`: **(Private)** 내부에서만 접근 가능 (이름 맹글링 적용)

```python
class BankAccount:
    def __init__(self, balance):
        self._balance = balance  # protected (외부에서 접근 가능하지만 권장되지 않음)
        self.__secret = "Secret Data"  # private (외부에서 직접 접근 불가)

    def get_balance(self):
        return self._balance

account = BankAccount(1000)
print(account.get_balance())  # 1000
print(account._balance)  # 가능하지만 권장되지 않음
# print(account.__secret)  # AttributeError 발생
```

---

## **7. 연산자 오버로딩 (Operator Overloading)**
특정 연산자(`+`, `-`, `*`, `==` 등)를 클래스에서 직접 정의할 수 있습니다.

```python
class Vector:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __add__(self, other):
        return Vector(self.x + other.x, self.y + other.y)

    def __str__(self):
        return f"Vector({self.x}, {self.y})"

v1 = Vector(1, 2)
v2 = Vector(3, 4)
print(v1 + v2)  # Vector(4, 6)
```

---

### **8. 데이터 클래스 (dataclass)**
Python 3.7 이상에서는 `@dataclass`를 사용하여 간결한 클래스를 정의할 수 있습니다.

```python
from dataclasses import dataclass

@dataclass
class Point:
    x: int
    y: int

p = Point(3, 4)
print(p)  # Point(x=3, y=4)
```

---

이제 Python의 클래스를 이해하고 효과적으로 활용할 수 있을 것입니다. 더 궁금한 점이 있으면 질문하세요! 🚀
### **Python 모듈(Module)이란?**
Python에서 **모듈(Module)**은 하나의 `.py` 파일로, 변수, 함수, 클래스 등을 포함하여 코드의 재사용성을 높이고 프로그램을 구조적으로 관리할 수 있도록 합니다.

---

## **1. 모듈 만들기**
모듈은 간단하게 하나의 `.py` 파일로 만들 수 있습니다.

### **🔹 mymodule.py (모듈 파일)**
```python
# 변수
PI = 3.14159

# 함수
def add(a, b):
    return a + b

# 클래스
class Math:
    def square(self, x):
        return x * x
```

---

## **2. 모듈 사용하기 (`import`)**
모듈을 사용하려면 `import` 키워드를 사용합니다.

### **🔹 main.py (메인 파일)**
```python
import mymodule  # mymodule.py 가져오기

print(mymodule.PI)  # 3.14159
print(mymodule.add(2, 3))  # 5

math_obj = mymodule.Math()
print(math_obj.square(4))  # 16
```

---

## **3. 모듈에서 특정 요소만 가져오기 (`from ... import ...`)**
전체 모듈이 아닌 특정 함수나 변수를 가져올 수도 있습니다.

```python
from mymodule import add, PI

print(add(5, 7))  # 12
print(PI)  # 3.14159
```

---

## **4. 모듈의 별칭 지정 (`import ... as ...`)**
긴 모듈 이름을 짧게 줄여서 사용할 수 있습니다.

```python
import mymodule as mm

print(mm.add(10, 20))  # 30
```

---

## **5. 모듈의 모든 요소 가져오기 (`from ... import *`)**
모듈의 모든 요소를 가져올 수도 있지만, **권장되지 않습니다**.

```python
from mymodule import *

print(add(3, 4))  # 7
print(PI)  # 3.14159
```

> **❗ 주의:** `import *`는 어떤 요소가 로드되는지 명확하지 않기 때문에, 코드의 가독성이 떨어질 수 있습니다.

---

## **6. 내장 모듈 사용하기**
Python에는 기본적으로 제공되는 **표준 라이브러리(내장 모듈)**가 있습니다.

### **🔹 math 모듈 사용 예시**
```python
import math

print(math.sqrt(16))  # 4.0
print(math.factorial(5))  # 120
```

### **🔹 random 모듈 사용 예시**
```python
import random

print(random.randint(1, 10))  # 1부터 10 사이의 랜덤 정수
print(random.choice(['apple', 'banana', 'cherry']))  # 랜덤 선택
```

---

## **7. 사용자 정의 모듈의 위치 (`sys.path`)**
Python은 `sys.path`에 정의된 경로에서 모듈을 찾습니다.

```python
import sys
print(sys.path)  # 모듈 검색 경로 출력
```

모듈을 특정 폴더에 넣고 사용하려면, 해당 폴더를 `sys.path.append()`로 추가할 수 있습니다.

```python
import sys
sys.path.append('/path/to/your/module')  # 모듈이 있는 경로 추가
```

---

## **8. `if __name__ == "__main__"`의 의미**
Python 모듈은 다른 파일에서 import될 수도 있고, 직접 실행될 수도 있습니다. 이를 구분하기 위해 `if __name__ == "__main__"`을 사용합니다.

### **🔹 mymodule.py**
```python
def greet():
    print("Hello from mymodule!")

if __name__ == "__main__":
    greet()  # 직접 실행될 때만 실행됨
```

### **🔹 main.py**
```python
import mymodule  # greet() 실행되지 않음 (import 시에는 실행 안 됨)
```

---

## **9. 패키지 (여러 모듈을 포함하는 폴더)**
모듈이 여러 개 모이면 **패키지(Package)**가 됩니다.

### **🔹 폴더 구조**
```
mypackage/
    ├── __init__.py  # 패키지를 인식하는 파일
    ├── module1.py
    ├── module2.py
```

### **🔹 패키지 사용**
```python
from mypackage import module1, module2
```

---

이제 Python 모듈을 만들고, 사용하고, 패키지로 확장하는 방법까지 이해했을 것입니다. 궁금한 점이 있으면 질문하세요! 🚀
## **📌 객체 초기화 (Object Initialization) in Python**  

Python에서 객체를 생성할 때, **초기 상태를 설정하는 과정**을 **"객체 초기화"**라고 합니다.  
이를 위해 클래스 내부에서 `__init__` 메서드를 사용합니다.

---

## **1️⃣ `__init__()` 메서드란?**
`__init__()`은 **생성자(Constructor) 역할을 하는 특별한 메서드**로,  
객체가 생성될 때 자동으로 호출되어 **초기 상태를 설정**하는 데 사용됩니다.

```python
class Person:
    def __init__(self, name, age):  # 생성자 (객체 초기화)
        self.name = name  # 인스턴스 변수 초기화
        self.age = age

# 객체 생성 시 자동으로 __init__ 호출
p1 = Person("Alice", 25)
p2 = Person("Bob", 30)

print(p1.name, p1.age)  # Alice 25
print(p2.name, p2.age)  # Bob 30
```
- `__init__(self, name, age)` : 객체가 생성될 때 `name`과 `age`를 받음.
- `self.name = name` : **인스턴스 변수**로 저장하여 객체마다 개별적으로 유지.

---

## **2️⃣ `__init__()` 없이도 객체 생성 가능**
`__init__()`은 선택 사항이므로, 클래스에 정의하지 않아도 객체를 만들 수 있음.

```python
class Example:
    pass

obj = Example()  # 가능하지만, 초기화할 내용이 없음
print(obj)  # <__main__.Example object at 0x7f...>
```
- `__init__()`을 정의하지 않으면 기본적으로 **빈 객체가 생성됨.**
- 그러나 **실제 사용에서는 `__init__()`을 거의 항상 정의**함.

---

## **3️⃣ 기본값을 가지는 `__init__()`**
`__init__()`에서 **기본값을 설정**하면, 인자를 전달하지 않아도 객체를 생성할 수 있음.

```python
class Person:
    def __init__(self, name="Unknown", age=0):  # 기본값 설정
        self.name = name
        self.age = age

p1 = Person()  # 인자를 전달하지 않음 → 기본값 사용
p2 = Person("Charlie", 40)

print(p1.name, p1.age)  # Unknown 0
print(p2.name, p2.age)  # Charlie 40
```
- 기본값을 설정하면 **객체를 만들 때 일부 또는 모든 인자를 생략 가능**.

---

## **4️⃣ `__init__()`에서 로직 추가하기**
`__init__()` 내부에서 **데이터 검증, 계산, 초기화 로직을 추가**할 수도 있음.

```python
class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        if balance < 0:
            raise ValueError("Balance cannot be negative")
        self.balance = balance

try:
    acc1 = BankAccount("Alice", -100)  # ❌ 예외 발생
except ValueError as e:
    print(e)  # Balance cannot be negative

acc2 = BankAccount("Bob", 500)
print(acc2.owner, acc2.balance)  # Bob 500
```
- `if balance < 0:` 로 **잘못된 값이 들어오는 것을 방지**하는 검증을 추가할 수 있음.

---

## **5️⃣ `__new__()` vs `__init__()`**
- `__new__()`는 객체를 **메모리에 할당하는 역할**을 함.
- `__init__()`은 **이미 생성된 객체의 초기화를 담당**.

보통 `__init__()`만 사용하면 되지만,  
싱글톤 패턴이나 객체 생성을 제어하려면 `__new__()`를 재정의할 수도 있음.

```python
class Singleton:
    _instance = None

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def __init__(self, name):
        self.name = name

s1 = Singleton("First")
s2 = Singleton("Second")

print(s1.name)  # Second
print(s2.name)  # Second
print(s1 is s2)  # True (같은 객체)
```
- `__new__()`는 **객체를 한 번만 생성하고, 이후에는 동일한 객체를 반환**함.
- `s1`과 `s2`는 **같은 객체**이므로 `s1.name`도 `"Second"`로 변경됨.

---

## **✅ 정리**
✔ `__init__()`은 객체 생성 시 **자동 호출되는 생성자 메서드**  
✔ `self`를 사용하여 **인스턴스 변수를 초기화**  
✔ `__init__()` 없이도 객체 생성은 가능하지만, 보통 초기화를 위해 사용  
✔ 기본값을 설정하면 **일부 인자를 생략 가능**  
✔ 로직을 추가하여 **데이터 검증**이나 **초기 설정 가능**  
✔ 객체 생성 과정을 제어하려면 `__new__()`를 사용할 수도 있음
### **📌 Python의 `__del__()` 호출 시점과 참조 카운트 관리**  

맞음! **Python에서는 객체의 참조 카운트(reference count)가 0이 되는 즉시 `__del__()`이 호출됨**.  
즉, Python은 **명확한 소멸 시점을 가짐**.  

반면, **C#은 가비지 컬렉터(GC)**가 실행될 때까지 소멸자가 호출되지 않을 수 있어서 **소멸 시점을 예측할 수 없음**.

---

## **🔹 Python의 객체 소멸 원리**  

Python의 메모리 관리는 **"참조 카운트 기반 + 가비지 컬렉터"** 방식으로 동작함.  

1️⃣ **객체가 생성되면 참조 카운트가 증가**  
2️⃣ **객체를 참조하는 변수가 없어지면 참조 카운트가 감소**  
3️⃣ **참조 카운트가 0이 되는 순간, `__del__()`이 즉시 호출됨**  
4️⃣ 다만, **순환 참조(circular reference)**가 있을 경우, 참조 카운트가 0이 되지 않아서 GC가 개입해야 함  

🔹 **즉, Python은 "참조 카운트가 0이 되면 즉시 소멸"하는 특징이 있음.**  
🔹 **C#은 GC가 실행될 때까지 대기해야 하므로, 소멸 시점이 불확실함.**

---

## **🔹 예제: Python에서 `__del__()` 호출 시점**
```python
import time

class Example:
    def __init__(self, name):
        self.name = name
        print(f"{self.name} 객체 생성됨.")

    def __del__(self):
        print(f"{self.name} 객체 소멸됨.")

obj = Example("Test")  # 생성
del obj  # 즉시 소멸
time.sleep(1)  # 1초 대기
```

🔹 **출력:**
```
Test 객체 생성됨.
Test 객체 소멸됨.
```
- `del obj`을 호출하는 순간 참조 카운트가 0이 되므로 **즉시 `__del__()` 실행됨.**

---

## **🔹 C#과 Python의 차이점**  

| **특징** | **Python** | **C#** |
|----------|-----------|--------|
| 소멸자 호출 시점 | 참조 카운트가 0이 되는 즉시 | GC가 실행될 때까지 대기 |
| 메모리 관리 방식 | 참조 카운트 + GC | GC (Mark & Sweep, Gen 0~2) |
| 명확한 소멸 보장? | **예 (순환 참조 예외)** | **아니오 (GC 실행 시점 불명확)** |

---

## **🔹 예제: C#에서 소멸자 호출 시점 예측 불가**
```csharp
using System;

class Example {
    public Example() {
        Console.WriteLine("객체 생성됨.");
    }

    ~Example() {
        Console.WriteLine("객체 소멸됨.");
    }
}

class Program {
    static void Main() {
        Example obj = new Example();
        obj = null; // 참조 제거

        GC.Collect(); // 명시적으로 GC 실행 요청
        Console.WriteLine("GC 실행 요청함.");
    }
}
```

🔹 **출력 (하지만 실행할 때마다 다를 수 있음)**  
```
객체 생성됨.
GC 실행 요청함.
(여기서 객체 소멸이 즉시 일어나지 않을 수도 있음)
객체 소멸됨. (언제 실행될지 모름)
```
- `obj = null;`을 해도 소멸자가 즉시 실행되지 않음.  
- **C#에서는 GC가 실행될 때까지 소멸자(`~Example()`) 호출이 지연됨**.

---

## **✅ 정리**
✔ **Python은 참조 카운트 기반**이라 **참조 카운트가 0이 되는 순간 `__del__()`이 실행됨.**  
✔ **C#은 GC가 실행될 때까지 소멸자가 호출되지 않으므로 소멸 시점을 예측할 수 없음.**  
✔ Python에서도 **순환 참조가 있는 경우 `__del__()`이 자동으로 호출되지 않을 수 있음** → `gc.collect()` 필요.  

🔹 **결론:**  
👉 Python은 "참조 카운트가 0이면 즉시 소멸"하므로 **C#보다 소멸 시점이 더 예측 가능함.**  
👉 하지만, Python도 **순환 참조가 생기면 GC가 개입해야 해서 `__del__()`이 바로 실행되지 않을 수도 있음.**

Python에서는 **`static` 변수**라는 개념이 직접적으로 존재하지 않습니다. 하지만 Python에서는 **클래스 변수**와 **인스턴스 변수**를 통해 비슷한 기능을 구현할 수 있습니다.

### **1. 클래스 변수 = Static 변수?**

Python에서 **클래스 변수**는 C++, Java에서의 **`static` 변수**와 유사한 역할을 합니다. 클래스 변수를 사용하면, **모든 인스턴스가 공유**하는 변수를 만들 수 있습니다. `static` 변수의 핵심은 **객체와 관계없이 클래스 수준에서 공유되는 변수**인데, Python의 **클래스 변수**가 바로 이런 용도로 사용됩니다.

### **2. Python의 staticmethod와 classmethod**

또한, Python에서는 **`staticmethod`**와 **`classmethod`**라는 메서드를 사용해 `static`과 유사한 기능을 구현할 수 있습니다. 이 메서드들은 객체 인스턴스나 클래스 인스턴스에 접근하지 않고, **클래스 자체에서 실행되는 메서드**입니다.

- **`staticmethod`**: 클래스의 인스턴스나 클래스 자체를 참조하지 않으므로, 클래스 변수나 인스턴스 변수에 접근할 수 없습니다.
- **`classmethod`**: 클래스 자체를 첫 번째 인자로 받기 때문에, 클래스 변수에 접근할 수 있습니다.

### **예시:**

#### 1. **클래스 변수 (Static 변수처럼 사용)**

```python
class Dog:
    species = "Canine"  # 클래스 변수 (Static 변수처럼)

    def __init__(self, name, age):
        self.name = name
        self.age = age

# 객체 생성
dog1 = Dog("Buddy", 3)
dog2 = Dog("Max", 5)

# 클래스 변수 사용
print(dog1.species)  # Canine
print(dog2.species)  # Canine

# 클래스 변수 수정
Dog.species = "Feline"  # 클래스 변수 변경

print(dog1.species)  # Feline
print(dog2.species)  # Feline
```

#### 2. **`staticmethod` 사용**

```python
class Dog:
    @staticmethod
    def bark():
        print("Woof!")

# static method 호출
Dog.bark()  # Woof!
```

- `bark` 메서드는 **인스턴스와 관계없이 클래스에서 직접 호출**할 수 있는 **static method**입니다.

#### 3. **`classmethod` 사용**

```python
class Dog:
    species = "Canine"

    @classmethod
    def change_species(cls, new_species):
        cls.species = new_species

# 클래스 메서드를 통해 클래스 변수 변경
Dog.change_species("Feline")

print(Dog.species)  # Feline
```

- `change_species` 메서드는 **클래스 자체를 첫 번째 인자로 받으며**, 이를 통해 클래스 변수에 접근하고 값을 변경합니다.

---

### **정리**

- Python에는 **`static` 변수**라는 용어는 없지만, **클래스 변수**가 그와 유사한 역할을 합니다.
- **`staticmethod`**와 **`classmethod`**는 `static` 변수처럼 동작할 수 있도록 Python에서 제공하는 기능입니다.
- `static` 변수의 핵심은 **클래스 수준에서 공유되는 변수**라는 점에서, Python의 **클래스 변수**와 비슷합니다.

- ### **클래스의 인스턴스 (Instance of a Class)**

클래스의 인스턴스는 **클래스**를 바탕으로 만들어진 **객체**입니다. 객체는 클래스를 설계도(청사진)으로 해서 **실제로 메모리 상에 생성된 구체적인 실체**를 의미합니다. 이 객체는 클래스의 정의에 의해 **속성(변수)**과 **메서드(기능)**을 가집니다.

---

## **1️⃣ 클래스와 인스턴스의 차이**

- **클래스**는 객체의 **설계도**입니다. 클래스에는 **속성**과 **기능(메서드)**이 정의되어 있지만, 클래스 자체는 **실제 데이터를 담고 있지 않습니다**.
- **인스턴스**는 이 클래스를 기반으로 메모리에 **실제로 생성된 객체**입니다. 인스턴스는 각기 다른 **데이터(속성값)**를 가질 수 있습니다.

---

## **2️⃣ 인스턴스 생성하기**

클래스를 정의하고, 그 클래스를 기반으로 **인스턴스를 생성**하려면 **클래스명()**을 사용하여 객체를 만듭니다.

### **예시:**

```python
class Dog:
    # 클래스 속성 (클래스 변수)
    species = "Canine"

    # 인스턴스 초기화 메서드 (__init__) 
    def __init__(self, name, age):
        self.name = name  # 인스턴스 변수
        self.age = age    # 인스턴스 변수

    # 인스턴스 메서드
    def bark(self):
        print(f"{self.name} says Woof!")

# 인스턴스 생성
dog1 = Dog("Buddy", 3)  # Dog 클래스의 인스턴스 생성
dog2 = Dog("Max", 5)    # 또 다른 Dog 클래스의 인스턴스 생성

# 인스턴스 메서드 호출
dog1.bark()  # Buddy says Woof!
dog2.bark()  # Max says Woof!
```

### **핵심 포인트:**
- `dog1`과 `dog2`는 **`Dog`** 클래스의 **인스턴스**입니다.
- 각 인스턴스는 `name`과 `age` 같은 **인스턴스 변수**를 가지고 있으며, 서로 다른 데이터를 가질 수 있습니다.
- `dog1.bark()`와 `dog2.bark()` 호출 시 각 인스턴스에 맞는 `name` 값이 사용됩니다.

---

## **3️⃣ 인스턴스 변수와 클래스 변수**

- **인스턴스 변수**는 **각 인스턴스마다 독립적인 변수**로, `self`를 통해 정의합니다. 각 객체마다 값이 다를 수 있습니다.
- **클래스 변수**는 **모든 인스턴스가 공유**하는 변수로, 클래스에서 정의된 값을 참조합니다.

### **예시:**

```python
class Dog:
    species = "Canine"  # 클래스 변수

    def __init__(self, name, age):
        self.name = name  # 인스턴스 변수
        self.age = age    # 인스턴스 변수

# 인스턴스 생성
dog1 = Dog("Buddy", 3)
dog2 = Dog("Max", 5)

# 인스턴스 변수 접근
print(dog1.name)  # Buddy
print(dog2.name)  # Max

# 클래스 변수 접근
print(dog1.species)  # Canine
print(dog2.species)  # Canine
```

---

## **4️⃣ 인스턴스 메서드와 클래스 메서드**

- **인스턴스 메서드**는 **인스턴스 변수에 접근**하고, **객체별 동작**을 수행하는 메서드입니다.
- **클래스 메서드**는 **클래스 변수에 접근**하고, **클래스 자체에 대해 동작**을 수행하는 메서드입니다.

### **예시 (인스턴스 메서드 vs 클래스 메서드):**

```python
class Dog:
    species = "Canine"  # 클래스 변수

    def __init__(self, name, age):
        self.name = name  # 인스턴스 변수
        self.age = age    # 인스턴스 변수

    def bark(self):  # 인스턴스 메서드
        print(f"{self.name} says Woof!")

    @classmethod
    def change_species(cls, new_species):  # 클래스 메서드
        cls.species = new_species

# 인스턴스 생성
dog1 = Dog("Buddy", 3)
dog2 = Dog("Max", 5)

# 인스턴스 메서드 호출
dog1.bark()  # Buddy says Woof!
dog2.bark()  # Max says Woof!

# 클래스 메서드를 사용하여 클래스 변수 변경
Dog.change_species("Feline")

print(dog1.species)  # Feline
print(dog2.species)  # Feline
```

- `bark()`는 **인스턴스 메서드**로 인스턴스의 데이터를 사용하여 동작합니다.
- `change_species()`는 **클래스 메서드**로, **모든 인스턴스에서 공유하는 클래스 변수**를 변경합니다.

---

## **5️⃣ 인스턴스 생성 시 `__init__` 메서드**

`__init__()` 메서드는 **인스턴스가 생성될 때 자동으로 호출**되는 메서드로, 주로 인스턴스 변수들을 초기화하는 데 사용됩니다.

### **예시:**

```python
class Dog:
    def __init__(self, name, age):  # __init__ 메서드
        self.name = name
        self.age = age

# 객체 생성 시 __init__ 호출
dog1 = Dog("Buddy", 3)
dog2 = Dog("Max", 5)

print(dog1.name)  # Buddy
print(dog2.age)   # 5
```

---

## **정리**

- **클래스**는 객체의 **설계도**입니다.
- **인스턴스**는 클래스를 기반으로 생성된 **실체 객체**입니다.
- **인스턴스 변수**는 각 객체마다 독립적으로 값을 가지며, **클래스 변수**는 모든 인스턴스에서 공유됩니다.
- **인스턴스 메서드**는 객체마다 동작하고, **클래스 메서드**는 클래스 자체를 대상으로 동작합니다.

