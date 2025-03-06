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
맞습니다! 파이썬에서 **getter**는 **프로퍼티** 메서드로 구현되며, 사실 별도로 `getter`라는 명시적인 키워드는 존재하지 않습니다. 대신, `@property` 데코레이터를 사용하여 **읽기** 전용 메서드를 만들 수 있습니다. 이 메서드는 **객체의 속성 값을 가져오는 역할**을 하며, getter처럼 동작합니다.

**getter** 메서드는 보통 `@property` 데코레이터를 통해 속성처럼 보이게 하지만, 사실 메서드로 구현되어 있습니다. **setter**와 마찬가지로, `getter`는 속성 값을 반환하는 데 사용됩니다.

### **getter 예시 (프로퍼티 사용)**

```python
class Dog:
    def __init__(self, name, age):
        self._name = name  # 실제 값을 저장하는 변수
        self._age = age

    @property
    def name(self):  # getter
        return self._name

    @property
    def age(self):  # getter
        return self._age

    @age.setter
    def age(self, new_age):  # setter
        if new_age < 0:
            print("Age cannot be negative!")
        else:
            self._age = new_age

# 객체 생성
dog = Dog("Buddy", 3)

# getter를 사용하여 값 가져오기
print(dog.name)  # Buddy
print(dog.age)   # 3

# setter를 사용하여 값 변경
dog.age = 4
print(dog.age)   # 4
```

### **프로퍼티를 사용한 getter, setter**

- **`@property`** 데코레이터를 통해 `name`과 `age`는 마치 **인스턴스 변수처럼** 접근할 수 있지만, 실제로는 메서드입니다.
- **getter**는 값을 **읽을 때** 자동으로 호출되는 메서드입니다.
- **setter**는 값을 **설정할 때** 자동으로 호출됩니다.

### **간단한 정리**

- **getter**는 값을 반환하는 메서드로, **`@property`**를 통해 구현됩니다.
- **setter**는 값을 설정하는 메서드로, **`@<property name>.setter`**를 통해 구현됩니다.
- `getter`와 `setter` 모두 **속성처럼** 동작하지만, 실제로는 메서드로 구현되기 때문에 **더 많은 제어**를 할 수 있습니다.

아래는 **클래스 변수에서 인스턴스화 되는 경우**와 **새로 할당되는 경우**를 변수 타입에 따라 깔끔하게 정리한 표입니다.

| **변수 타입**          | **클래스 변수 동작**                                        | **예시**                                                                                                                                               | **설명**                                                                                                                                                       |
|--------------------|----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **가변 객체 (Mutable)**  (예: `list`, `dict`, `set`) | **인스턴스 간 참조 공유**. 수정 시 모든 인스턴스에 영향을 미침.                       | ```python<br>class Dog:<br>    breed = ['Beagle', 'Poodle']<br>dog1 = Dog()<br>dog2 = Dog()<br>dog1.breed.append('Bulldog')<br>print(dog1.breed)<br>print(dog2.breed)``` | `dog1.breed`에 `'Bulldog'` 추가 시 `dog2.breed`도 동일하게 변경됨. **같은 객체를 참조**함. |
| **불변 객체 (Immutable)** (예: `int`, `str`, `tuple`) | **새로운 값 할당 시 새로운 객체 생성**. 기존 인스턴스는 영향을 받지 않음. | ```python<br>class Counter:<br>    count = 10<br>counter1 = Counter()<br>counter2 = Counter()<br>counter1.count += 1<br>print(counter1.count)<br>print(counter2.count)``` | `counter1.count += 1` 시 `count`는 **새로운 객체**가 되어 `counter2.count`는 여전히 `10`을 유지. |
| **None (특수값)**      | **불변 객체**처럼 **새로운 값 할당 시 객체 새로 생성**. 기존 인스턴스에는 영향 없음. | ```python<br>class Data:<br>    value = None<br>data1 = Data()<br>data2 = Data()<br>data1.value = 'new'<br>print(data1.value)<br>print(data2.value)``` | `data1.value`를 `'new'`로 할당해도 `data2.value`는 여전히 `None`. **불변 객체**로 다뤄짐. |
| **클래스 자체**        | **인스턴스가 클래스 변수와 동일한 이름을 사용하면 참조가 분리**됨. | ```python<br>class Animal:<br>    species = "Dog"<br>animal1 = Animal()<br>animal2 = Animal()<br>animal1.species = "Cat"<br>print(animal1.species)<br>print(animal2.species)``` | `animal1.species`가 `'Cat'`으로 변경되지만, `animal2.species`는 여전히 `'Dog'`. 인스턴스 변수처럼 동작함. |

### **핵심 정리:**
- **가변 객체**는 인스턴스 간 **참조를 공유**하므로 하나에서 변경하면 모두 변경됩니다.
- **불변 객체**는 값을 변경할 때마다 **새로운 객체**가 생성되어, 다른 인스턴스에는 영향을 미치지 않습니다.
- **None**도 불변 객체로 다뤄져, 새로운 값 할당 시 기존 값을 변경하지 않습니다.
- **클래스 변수**가 **인스턴스 변수처럼 동작**할 수 있으므로 주의가 필요합니다.

이렇게 정리하면 각 타입별로 동작 차이를 한눈에 볼 수 있습니다.

### **Python에서 오버로드(Overloading)와 오버라이드(Overriding)**
Python에서 오버로딩과 오버라이딩은 객체지향 프로그래밍(OOP)에서 메서드를 다루는 중요한 개념입니다.

---

## **1. 오버로딩 (Overloading)**
오버로딩은 **같은 이름의 메서드를 매개변수의 타입이나 개수에 따라 다르게 동작하도록 정의하는 것**을 의미합니다.  
하지만, **Python은 전통적인 의미의 메서드 오버로딩을 지원하지 않습니다.**

### **(1) 파이썬에서 오버로딩을 흉내내는 방법**
Python에서는 **기본값 매개변수(default parameter)** 또는 **가변 인수(\*args, \*\*kwargs)**를 이용하여 오버로딩과 유사한 기능을 구현할 수 있습니다.

#### **예제 1: 기본값을 활용한 오버로딩**
```python
class Math:
    def add(self, a, b=0, c=0):  # 기본값을 설정하여 오버로딩처럼 구현
        return a + b + c

m = Math()
print(m.add(5))        # 5 (a만 전달)
print(m.add(5, 10))    # 15 (a, b 전달)
print(m.add(5, 10, 15)) # 30 (a, b, c 전달)
```

#### **예제 2: 가변 인수를 활용한 오버로딩**
```python
class Math:
    def add(self, *args):  # 여러 개의 인수를 받을 수 있음
        return sum(args)

m = Math()
print(m.add(5))         # 5
print(m.add(5, 10))     # 15
print(m.add(5, 10, 15)) # 30
```
💡 **Python에서는 같은 이름의 메서드를 여러 개 정의할 수 없으므로, `*args`나 기본값을 활용하여 오버로딩을 흉내냅니다.**

---

## **2. 오버라이딩 (Overriding)**
오버라이딩은 **부모 클래스에서 정의한 메서드를 자식 클래스에서 재정의(override)하여 동작을 변경하는 것**을 의미합니다.

### **(1) 기본적인 오버라이딩 예제**
```python
class Animal:
    def speak(self):
        return "동물이 소리를 냅니다."

class Dog(Animal):
    def speak(self):  # 부모의 speak() 메서드를 오버라이딩
        return "멍멍!"

class Cat(Animal):
    def speak(self):  # 부모의 speak() 메서드를 오버라이딩
        return "야옹!"

dog = Dog()
cat = Cat()

print(dog.speak())  # 멍멍!
print(cat.speak())  # 야옹!
```

### **(2) `super()`를 이용한 오버라이딩**
부모 클래스의 메서드를 호출하고 추가적인 기능을 덧붙이고 싶을 때 `super()`를 사용할 수 있습니다.

```python
class Animal:
    def speak(self):
        return "동물이 소리를 냅니다."

class Dog(Animal):
    def speak(self):
        return super().speak() + " 하지만 개는 '멍멍!' 하고 웁니다."

dog = Dog()
print(dog.speak())  
# 동물이 소리를 냅니다. 하지만 개는 '멍멍!' 하고 웁니다.
```

---

## **3. 오버로딩 vs 오버라이딩 정리**
| 개념 | 오버로딩 (Overloading) | 오버라이딩 (Overriding) |
|------|----------------------|----------------------|
| 의미 | 같은 이름의 메서드를 인자의 수나 타입에 따라 다르게 정의하는 것 | 부모 클래스의 메서드를 자식 클래스에서 재정의하는 것 |
| 지원 여부 | **Python에서는 직접 지원하지 않음** (가변 인수 `*args` 또는 기본값 활용) | **Python에서 직접 지원** |
| 사용 방식 | 같은 클래스 내에서 메서드 이름을 동일하게 하고 인자의 수나 타입을 다르게 설정 | 자식 클래스에서 부모 클래스의 메서드를 같은 이름으로 다시 정의 |
| 코드 예시 | `def add(self, a, b=0, c=0):` 또는 `def add(self, *args):` | `def speak(self):` (부모 메서드 재정의) |
| 대표 예제 | `__init__()`에서 여러 개의 초기화 방식 지원 | `speak()` 메서드를 자식 클래스에서 재정의 |

---

### **결론**
- **오버로딩(Overloading)**  
  - Python은 오버로딩을 공식적으로 지원하지 않지만, **기본값 매개변수**와 **가변 인수 (`*args`, `**kwargs`)**를 활용하여 구현 가능하다.
  
- **오버라이딩(Overriding)**  
  - 부모 클래스의 메서드를 자식 클래스에서 **같은 이름으로 재정의**하여 동작을 변경하는 방식이며, **Python에서 공식적으로 지원**된다.

궁금한 점 있으면 더 질문해 줘! 😊

### **클래스 메서드를 정의하는 데코레이터**
Python에서 클래스 메서드를 정의할 때 사용하는 대표적인 데코레이터는 `@classmethod`와 `@staticmethod`입니다.  

---

## **1. `@classmethod` (클래스 메서드)**
- 클래스 자체를 첫 번째 인자로 받는 메서드를 정의할 때 사용한다.
- `cls`를 첫 번째 인자로 받으며, 클래스 변수를 수정하거나 클래스 레벨에서 접근할 때 유용하다.

### **사용 예시**
```python
class Dog:
    species = "Canine"  # 클래스 변수

    def __init__(self, name):
        self.name = name  # 인스턴스 변수

    @classmethod
    def change_species(cls, new_species):
        cls.species = new_species  # 클래스 변수 변경

# 클래스 메서드 호출
Dog.change_species("Feline")
print(Dog.species)  # Feline
```
💡 **클래스 메서드는 인스턴스가 아닌 클래스 자체에서 호출 가능하다.**

---

## **2. `@staticmethod` (정적 메서드)**
- 클래스나 인스턴스와 관계없이 독립적으로 실행되는 메서드.
- 첫 번째 인자로 `self`나 `cls`를 받지 않는다.
- 일반적인 유틸리티 함수처럼 동작하지만 클래스 내부에서 논리적으로 관련된 기능을 제공할 때 유용하다.

### **사용 예시**
```python
class MathUtils:
    @staticmethod
    def add(a, b):
        return a + b

# 정적 메서드는 클래스 또는 인스턴스를 통해 호출 가능
print(MathUtils.add(5, 10))  # 15
```
💡 **정적 메서드는 인스턴스를 만들 필요 없이 바로 호출할 수 있다.**

---

## **3. `@property` (프로퍼티)**
- 게터(getter) 메서드를 정의할 때 사용된다.
- **인스턴스 변수를 직접 접근하지 않고, 메서드를 통해 접근하도록 유도**하는 방식.
- `@property`, `@<property_name>.setter`, `@<property_name>.deleter`를 함께 사용할 수 있다.

### **사용 예시**
```python
class Person:
    def __init__(self, name):
        self._name = name  # private 변수처럼 취급

    @property
    def name(self):  # 게터 역할
        return self._name

    @name.setter
    def name(self, new_name):  # 세터 역할
        if isinstance(new_name, str) and new_name:
            self._name = new_name
        else:
            raise ValueError("이름은 비어있을 수 없습니다.")

p = Person("John")
print(p.name)  # John

p.name = "Alice"  # 세터 사용
print(p.name)  # Alice

# p.name = ""  # ValueError 발생
```
💡 **프로퍼티를 활용하면 인스턴스 변수의 직접적인 접근을 막고, 제어할 수 있다.**

---

## **4. `@staticmethod` vs `@classmethod` 비교**
| 구분         | `@staticmethod` | `@classmethod` |
|-------------|---------------|---------------|
| 첫 번째 인자 | 없음         | `cls` (클래스 자체) |
| 클래스 변수 접근 | 불가능      | 가능 |
| 인스턴스 변수 접근 | 불가능 | 불가능 |
| 호출 방식 | 클래스 또는 인스턴스를 통해 호출 가능 | 클래스 또는 인스턴스를 통해 호출 가능 |
| 주요 사용 목적 | 독립적인 기능 (유틸리티 메서드) | 클래스 변수 변경 또는 클래스 레벨 동작 수행 |

---

### **결론**
- `@classmethod` → 클래스 변수를 수정하거나, 클래스 레벨의 동작을 정의할 때 사용.
- `@staticmethod` → 클래스와 무관한 독립적인 기능을 정의할 때 사용.
- `@property` → 인스턴스 변수에 대한 접근을 제어하고, 게터/세터 역할을 수행.

필요한 내용 더 궁금하면 질문해 줘! 😊

Yes, both **class methods** and **static methods** can be used to implement the **Factory Pattern** in Python. However, they have key differences that affect how the factory is structured and used.

---

## **🔹 차이점: 클래스 메서드 vs 정적 메서드 팩토리 패턴**
|  | **클래스 메서드 (`@classmethod`)** | **정적 메서드 (`@staticmethod`)** |
|---|---------------------------------|--------------------------------|
| **첫 번째 매개변수** | `cls` (클래스를 첫 번째 인자로 받음) | 첫 번째 인자로 클래스 정보를 받지 않음 |
| **서브클래싱 영향** | 서브클래스에서 호출하면 `cls`가 해당 서브클래스가 됨 (서브클래스에 맞는 객체 생성 가능) | 서브클래스에서 호출해도 기본 클래스에서 정의된 대로 동작 |
| **클래스 상태 접근** | 클래스 변수를 읽거나 수정 가능 | 클래스 변수에 접근할 수 없음 |
| **사용 목적** | 서브클래싱을 고려하는 유연한 팩토리 | 독립적인 유틸리티 팩토리 |

---

## **🔹 예제: 클래스 메서드 기반 팩토리 패턴**
```python
class Animal:
    def __init__(self, name):
        self.name = name

    @classmethod
    def create(cls, animal_type):
        if animal_type == "dog":
            return cls("Dog")
        elif animal_type == "cat":
            return cls("Cat")
        else:
            raise ValueError("Unknown animal type")

# 서브클래스
class Dog(Animal):
    pass

class Cat(Animal):
    pass

# 서브클래스에서 사용 가능
dog = Dog.create("dog")
print(dog.name)  # Dog (Dog 클래스의 인스턴스)
print(isinstance(dog, Dog))  # True
```
### **📌 특징**
- `@classmethod`를 사용하여 **서브클래스에서도 재사용 가능**.
- `cls`를 통해 **현재 호출한 클래스(Dog, Cat 등)에 맞는 객체를 반환**.

---

## **🔹 예제: 정적 메서드 기반 팩토리 패턴**
```python
class Animal:
    def __init__(self, name):
        self.name = name

    @staticmethod
    def create(animal_type):
        if animal_type == "dog":
            return Animal("Dog")
        elif animal_type == "cat":
            return Animal("Cat")
        else:
            raise ValueError("Unknown animal type")

dog = Animal.create("dog")
print(dog.name)  # Dog
print(isinstance(dog, Animal))  # True
```
### **📌 특징**
- `@staticmethod`을 사용하여 **클래스 정보(`cls`) 없이도 독립적으로 동작**.
- 항상 `Animal` 클래스의 인스턴스를 반환하며, **서브클래스에서 호출해도 Animal 인스턴스만 생성**.

---

## **🔹 결론: 언제 어떤 것을 사용할까?**
| **상황** | **사용할 것** |
|---------|-------------|
| 팩토리 메서드가 **클래스 계층을 지원해야 할 때** | `@classmethod` |
| 팩토리 메서드가 **클래스 상태를 참조해야 할 때** | `@classmethod` |
| 팩토리 메서드가 **독립적인 함수로 동작해야 할 때** | `@staticmethod` |
| 팩토리 메서드가 **서브클래스에서 다르게 동작할 필요 없을 때** | `@staticmethod` |

**💡 정리:**  
- **서브클래싱이 필요하면 `@classmethod`**  
- **독립적인 팩토리 로직이면 `@staticmethod`**  

즉, **유연성과 확장성을 고려한다면 `@classmethod`가 더 적합**한 경우가 많다. 🚀

파이썬에서 클래스의 생성자(`__init__`)는 자동으로 생성되는 경우도 있습니다. 여기서는 **자동 생성자**가 발생하는 상황에 대해 설명드리겠습니다.

### 1. **부모 클래스에 `__init__`이 정의되지 않은 경우**
부모 클래스에 `__init__` 생성자가 명시적으로 정의되지 않은 경우, 자식 클래스에서 `__init__`를 정의하지 않으면 **자동으로 부모 클래스의 `__init__` 생성자가 호출됩니다**. 만약 부모 클래스에 생성자가 없다면, 파이썬은 자동으로 기본 생성자를 사용하게 됩니다.

#### 예시 1: 부모 클래스에 `__init__`가 없을 때
```python
class Parent:
    pass  # 부모 클래스에 __init__ 없음

class Child(Parent):
    pass  # 자식 클래스도 __init__ 없음

child = Child()  # Parent의 기본 생성자가 호출됨
```

**출력**: 특별한 출력이 없지만, 부모 클래스의 기본 생성자가 호출됩니다.

### 2. **부모 클래스에 기본 생성자가 있을 때**
부모 클래스에 기본 생성자(인자 없는 `__init__` 메서드)가 있을 경우, 자식 클래스에서 `__init__` 메서드를 명시적으로 정의하지 않으면 **자동으로 부모 클래스의 기본 생성자가 호출**됩니다.

#### 예시 2: 부모 클래스에 기본 생성자가 있을 때
```python
class Parent:
    def __init__(self):
        print("Parent's constructor")

class Child(Parent):
    pass  # 자식 클래스에 __init__ 없음

child = Child()  # 부모 클래스의 __init__가 호출됨
```

**출력**:
```
Parent's constructor
```

### 3. **부모 클래스에 `__init__`가 정의되어 있지만 자식 클래스에서 `super()`를 사용할 경우**
자식 클래스에서 `__init__`를 정의하면서 `super()`를 사용하면, 부모 클래스의 생성자가 자동으로 호출됩니다. 이때 부모 클래스의 생성자는 **명시적으로 호출하지 않아도 `super()`에 의해 자동 호출**됩니다.

#### 예시 3: `super()`를 사용한 경우
```python
class Parent:
    def __init__(self):
        print("Parent's constructor")

class Child(Parent):
    def __init__(self):
        super().__init__()  # 부모 클래스의 __init__ 호출

child = Child()
```

**출력**:
```
Parent's constructor
```

여기서 `super()`가 부모 클래스의 생성자를 자동으로 호출합니다.

### 4. **다중 상속에서 자동 호출되는 경우**
다중 상속에서 `super()`를 사용하면, **MRO(Method Resolution Order)**에 따라 부모 클래스들의 생성자가 자동으로 호출됩니다. 즉, 자식 클래스에서 `super()`만 사용하면 MRO에 따라 순차적으로 부모 클래스의 생성자가 호출됩니다.

#### 예시 4: 다중 상속에서 `super()` 사용
```python
class A:
    def __init__(self):
        print("A's constructor")

class B(A):
    def __init__(self):
        super().__init__()  # A의 __init__ 호출
        print("B's constructor")

class C(A):
    def __init__(self):
        super().__init__()  # A의 __init__ 호출
        print("C's constructor")

class D(B, C):
    def __init__(self):
        super().__init__()  # B, C, A 순으로 호출됨
        print("D's constructor")

d = D()
```

**출력**:
```
A's constructor
C's constructor
B's constructor
D's constructor
```

### 5. **`object` 클래스의 기본 생성자**
모든 파이썬 클래스는 **암묵적으로 `object` 클래스를 상속**받습니다. 만약 클래스에서 `__init__` 생성자를 정의하지 않으면, 파이썬은 자동으로 `object` 클래스의 기본 생성자를 호출합니다. `object` 클래스는 `__init__` 생성자를 제공하지만, 아무 작업도 하지 않습니다.

#### 예시 5: `object` 기본 생성자
```python
class MyClass:
    pass  # __init__ 정의하지 않음

obj = MyClass()  # 자동으로 object의 기본 생성자 호출
```

**출력**: 특별한 출력이 없지만, `object` 클래스의 기본 생성자가 호출됩니다.

### 결론
- **부모 클래스에 `__init__` 생성자가 정의되지 않은 경우**, 자식 클래스에서 `__init__`를 정의하지 않으면 부모 클래스의 기본 생성자가 자동으로 호출됩니다.
- **부모 클래스에 `__init__`가 정의되어 있으면**, 자식 클래스에서 `super()`를 사용하거나, 명시적으로 부모 클래스의 생성자를 호출하면 부모 클래스의 생성자가 자동으로 호출됩니다.
- **다중 상속**에서는 `super()`를 사용하여 부모 클래스들의 생성자가 MRO에 따라 자동으로 호출됩니다.
- **클래스에 `__init__`가 정의되지 않으면** 파이썬은 `object` 클래스의 기본 생성자를 호출합니다.

네, 맞습니다! C++에서 자식 클래스가 부모 클래스의 생성자를 호출하는 방식은 바로 그 방식이 맞습니다. 다만, 조금 더 명확하게 설명드리자면, **자식 클래스의 생성자에서 부모 클래스의 생성자를 명시적으로 호출하는 문법**은 다음과 같습니다.

### 부모 클래스 생성자 호출 문법
C++에서는 **자식 클래스의 생성자**에서 **부모 클래스의 생성자를 명시적으로 호출**할 수 있습니다. 부모 클래스의 생성자를 호출하는 방법은 **`: Parent(value)`**처럼 **콜론( : )** 뒤에 부모 클래스의 생성자를 호출하는 방식으로 이루어집니다.

#### 예시:
```cpp
#include <iostream>
using namespace std;

class Parent {
public:
    Parent(int value) {  // 매개변수를 받는 생성자
        cout << "Parent's constructor with value: " << value << endl;
    }
};

class Child : public Parent {
public:
    // 자식 클래스 생성자에서 부모 클래스의 생성자를 명시적으로 호출
    Child(int value) : Parent(value) {
        cout << "Child's constructor" << endl;
    }
};

int main() {
    Child c(10);  // Child의 생성자가 호출되고, Parent의 생성자도 호출됨
    return 0;
}
```

### 설명:
- `Child(int value) : Parent(value)`에서 `Parent(value)`가 **부모 클래스 `Parent`의 생성자**를 호출합니다.
- 부모 클래스 `Parent`는 `int` 매개변수를 받는 생성자만 존재하므로, 자식 클래스에서 부모의 생성자를 호출할 때 반드시 그 매개변수를 넘겨주어야 합니다.
- `Child` 클래스의 생성자가 호출되면서 `Parent` 클래스의 생성자가 먼저 호출되고, 그 후 `Child` 클래스의 생성자가 실행됩니다.

### 출력:
```
Parent's constructor with value: 10
Child's constructor
```

### 자식 클래스에서 부모 클래스 생성자 호출이 필수인 경우
만약 부모 클래스에 **매개변수가 있는 생성자만 정의**되어 있고, **기본 생성자가 없다면**, 자식 클래스에서 부모 클래스 생성자를 **명시적으로 호출**하지 않으면 컴파일 에러가 발생합니다.

#### 예시:
```cpp
#include <iostream>
using namespace std;

class Parent {
public:
    Parent(int value) {  // 기본 생성자가 없고 매개변수를 받는 생성자만 있음
        cout << "Parent's constructor with value: " << value << endl;
    }
};

class Child : public Parent {
    // 자식 클래스에서 부모 클래스 생성자 호출하지 않으면 에러 발생
};

int main() {
    Child c(10);  // 컴파일 에러 발생
    return 0;
}
```

**컴파일 에러**:
```
error: no matching function for call to 'Parent::Parent()'
```

### 결론
- **자식 클래스에서 부모 클래스의 생성자를 호출하는 방식**은 `Child(int value) : Parent(value)`처럼 **명시적으로 부모 클래스의 생성자를 호출하는 방법**이 맞습니다.
- 부모 클래스에 기본 생성자가 없고, 매개변수를 받는 생성자만 있을 경우 자식 클래스에서 부모 클래스 생성자를 **명시적으로 호출**해야 하며, 호출하지 않으면 컴파일 에러가 발생합니다.
