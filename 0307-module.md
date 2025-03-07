`__str__`은 Python 클래스에서 객체를 **문자열로 표현**할 때 사용하는 특별한 메서드(매직 메서드, dunder method)야.  

### 📌 `__str__`의 역할
- `print(obj)`를 호출하면 `__str__`이 자동으로 실행돼.
- `str(obj)`를 호출해도 `__str__`이 실행돼.
- 객체를 사람이 읽기 쉽게 문자열로 변환하는 역할을 해.

---

### ✅ 예제: `__str__` 없는 경우  
```python
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

user = User("Alice", 25)
print(user)  # <__main__.User object at 0x7f8c3b5c5e80>
```
📌 `__str__`이 없으면 객체의 메모리 주소가 출력돼서 읽기 어려워.

---

### ✅ 예제: `__str__` 추가한 경우  
```python
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return f"User(name={self.name}, age={self.age})"

user = User("Alice", 25)
print(user)  # User(name=Alice, age=25)
```
📌 `__str__`을 정의하면 `print(user)`가 사람이 읽기 쉬운 형식으로 출력돼.

---

### ✅ `__str__` vs `__repr__`
- `__str__` → 사람이 보기 쉽게 출력
- `__repr__` → 디버깅 및 개발자가 보기 좋게 출력

```python
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return f"User(name={self.name}, age={self.age})"

    def __repr__(self):
        return f"User('{self.name}', {self.age})"

user = User("Alice", 25)

print(str(user))   # User(name=Alice, age=25)  (사람이 읽기 좋은 형태)
print(repr(user))  # User('Alice', 25)        (개발자가 보기 좋은 형태)
```

📌 `repr(user)`는 디버깅할 때 `eval()`로 다시 객체를 복원할 수 있도록 보통 `클래스이름(데이터)` 형태로 만든다.

---

### 🔥 결론
✔ `__str__`을 정의하면 `print(obj)`를 할 때 사람이 읽기 좋은 문자열이 출력된다.  
✔ `__repr__`은 디버깅 시 유용하고, 객체를 복원할 수 있는 형태로 출력된다.  

👉 `__str__`은 가독성 좋은 출력을 위해, `__repr__`은 개발자가 디버깅하기 쉽게 만들어두면 좋아. 🚀

### 📌 **모듈(Module)이란?**
Python에서 **모듈(module)**은 **하나의 `.py` 파일**로, 함수, 클래스, 변수 등을 포함할 수 있어.  
즉, **코드를 여러 파일로 나눠 관리하고 재사용할 수 있도록 하는 단위**야.

---

## 📌 1. **모듈 만드는 방법**
Python 파일(`.py`)을 만들면 그것이 곧 모듈이야.

✅ **예제: `myModule.py` 만들기**  
```python
# myModule.py

def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

PI = 3.141592
```

---

## 📌 2. **모듈 가져오는 방법 (import)**
### ✅ 2.1 `import 모듈명`
가장 기본적인 모듈 가져오기 방법이야.

```python
import myModule

print(myModule.add(10, 5))    # 15
print(myModule.PI)            # 3.141592
```
📌 `myModule`을 가져오면 `myModule.add()`처럼 **모듈명을 앞에 붙여서 사용해야 해**.

---

### ✅ 2.2 `from 모듈명 import 함수명`
특정 함수나 변수만 가져올 수도 있어.

```python
from myModule import add, PI

print(add(10, 5))   # 15
print(PI)           # 3.141592
```
📌 `myModule.add()`가 아니라 **`add()` 바로 사용 가능**.

---

### ✅ 2.3 `from 모듈명 import *` (비추천 ⚠️)
```python
from myModule import *

print(add(10, 5))   # 15
print(subtract(10, 5))  # 5
```
📌 `*`를 쓰면 모듈의 모든 요소를 가져오지만, **이름 충돌 위험**이 있어서 권장되지 않아.

---

### ✅ 2.4 `import 모듈명 as 별칭`
모듈명을 짧게 줄일 때 유용해.
```python
import myModule as mm

print(mm.add(10, 5))  # 15
print(mm.PI)          # 3.141592
```

---

## 📌 3. **모듈의 `__name__` 속성**
모듈이 직접 실행된 건지, 다른 곳에서 import된 건지 확인할 수 있어.

✅ **예제: `myModule.py`**
```python
def add(x, y):
    return x + y

if __name__ == "__main__":
    print("myModule이 직접 실행됨")
```

✅ **다른 파일에서 import할 때**
```python
import myModule
```
✅ **출력 결과**
```
(myModule이 직접 실행되지 않음) 
```

📌 `__name__ == "__main__"` 조건문이 있으면 **모듈을 직접 실행할 때만 특정 코드가 실행됨**.

---

## 📌 4. **모듈 경로 설정 (`sys.path`)**
Python이 모듈을 찾는 경로는 `sys.path`에 저장돼 있어.

```python
import sys
print(sys.path)  # Python이 모듈을 찾는 경로 목록 출력
```

✅ 특정 폴더의 모듈을 가져오려면:
```python
sys.path.append('/path/to/your/module')
```

---

## 📌 5. **패키지(폴더 단위 모듈)**
폴더 안에 여러 개의 모듈을 관리할 때 사용해.

✅ **예제: 패키지 구조**
```
myPackage/
│── __init__.py
│── module1.py
│── module2.py
```
✅ **패키지 가져오기**
```python
from myPackage import module1
```

---

### 🔥 **정리**
✔ **모듈** = `.py` 파일 하나  
✔ `import`로 가져와서 사용 가능  
✔ `sys.path.append()`로 모듈 경로 추가 가능  
✔ 패키지는 **폴더 단위의 모듈 관리 시스템**  

모듈을 잘 사용하면 코드 재사용성이 높아지고 유지보수가 쉬워져. 🚀
### 📌 **"직접 실행됨"이란?**
Python 파일(모듈)은 두 가지 방법으로 실행될 수 있어.  

1. **직접 실행 (Standalone 실행)**  
   - 사용자가 `python myModule.py`처럼 터미널에서 직접 실행하는 경우.  
2. **다른 파일에서 import되어 실행**  
   - 다른 파일에서 `import myModule`로 가져다 쓰는 경우.  

Python에서는 이를 구분하기 위해 **`__name__` 변수를 사용**해.  

---

## ✅ **직접 실행과 import 실행의 차이**
```python
# myModule.py
def add(x, y):
    return x + y

if __name__ == "__main__":
    print("myModule이 직접 실행됨")
```

---

### 🔹 **1. 직접 실행할 때 (`python myModule.py`)**
```bash
$ python myModule.py
myModule이 직접 실행됨
```
✔ `__name__ == "__main__"` 조건이 **참(True)** 이므로 `print("myModule이 직접 실행됨")`이 실행됨.  

---

### 🔹 **2. 다른 파일에서 import할 때**
```python
# main.py
import myModule

print(myModule.add(10, 5))
```
```bash
$ python main.py
15
```
✔ `myModule.py`가 import되었지만 **"myModule이 직접 실행됨"이 출력되지 않음**  
✔ `__name__` 값이 `"myModule"`이 되기 때문.

---

## 📌 **`__name__` 변수의 역할**
- Python에서는 각 파일마다 `__name__`이라는 내장 변수가 자동으로 설정됨.
- `__name__`의 값:
  - **직접 실행하면** `"__main__"`
  - **import되면** `"모듈명"` (`myModule`)

✅ **확인해보자**
```python
# myModule.py
print(f"__name__ = {__name__}")
```
✔ `python myModule.py` 실행 → `__name__ = __main__`  
✔ `import myModule` 실행 → `__name__ = myModule`  

---

## 🔥 **정리**
✔ `if __name__ == "__main__":` 구문은 **직접 실행할 때만 특정 코드가 실행되도록 하는 장치**  
✔ 다른 파일에서 `import`하면 `__name__` 값이 변해서 실행되지 않음  
✔ 모듈이 직접 실행될 때만 실행할 코드를 구분하는 방법  

이제 이해됐지? 🚀

### 📌 **서로 참조하는 모듈 간 `import` 문제 해결 방법**  
Python에서 서로 다른 `.py` 파일들이 서로 참조할 경우, 특히 **순환 참조(Circular Import)**가 발생할 수 있어.  
아래에서 **올바른 `import` 구조**와 **순환 참조 해결 방법**을 설명할게.  

---

## ✅ **예제: 학생 관리 시스템**  
### 📂 프로젝트 폴더 구조  
```
project/
│── student.py      # 학생 정보를 관리하는 클래스
│── file_storage.py # 파일 저장을 담당하는 클래스
│── student_manager.py # 학생 목록을 관리하는 클래스 (파일 저장을 사용)
│── main.py         # 실행 파일
```

---

## 📌 **1. `student.py` (학생 클래스)**  
학생 정보를 정의하는 기본 클래스야.  
```python
# student.py

class Student:
    def __init__(self, student_id, name, age):
        self.student_id = student_id
        self.name = name
        self.age = age

    def __str__(self):
        return f"Student({self.student_id}, {self.name}, {self.age})"
```

---

## 📌 **2. `file_storage.py` (파일 저장 클래스)**
파일 저장 기능을 담당하는 클래스야.  
```python
# file_storage.py

import json

class FileStorage:
    @staticmethod
    def save_to_file(filename, data):
        with open(filename, 'w') as file:
            json.dump(data, file)

    @staticmethod
    def load_from_file(filename):
        try:
            with open(filename, 'r') as file:
                return json.load(file)
        except FileNotFoundError:
            return []
```

---

## 📌 **3. `student_manager.py` (학생 관리 클래스)**
- **학생 목록을 관리**하는 클래스  
- **파일 저장 기능**을 사용하기 위해 `file_storage.py`를 import  

```python
# student_manager.py

from student import Student   # ✅ 학생 클래스를 import
from file_storage import FileStorage  # ✅ 파일 저장 클래스를 import

class StudentManager:
    def __init__(self):
        self.students = []

    def add_student(self, student):
        self.students.append(student)

    def save_students(self, filename):
        data = [{"id": s.student_id, "name": s.name, "age": s.age} for s in self.students]
        FileStorage.save_to_file(filename, data)

    def load_students(self, filename):
        data = FileStorage.load_from_file(filename)
        self.students = [Student(d["id"], d["name"], d["age"]) for d in data]
```

---

## 📌 **4. `main.py` (실행 파일)**
이제 실행을 해보자.

```python
# main.py

from student_manager import StudentManager
from student import Student

manager = StudentManager()
manager.add_student(Student(1, "Alice", 20))
manager.add_student(Student(2, "Bob", 22))

# 파일 저장
manager.save_students("students.json")

# 파일 불러오기
manager.load_students("students.json")

for student in manager.students:
    print(student)
```

---

## 🔥 **순환 참조 문제 해결 방법**
### 📌 **❌ 잘못된 구조 (순환 참조 발생)**
아래처럼 **두 개의 모듈이 서로 import**하면 순환 참조 오류가 발생해.
```python
# student.py
from student_manager import StudentManager   # ❌ 순환 참조 발생
```
```python
# student_manager.py
from student import Student   # ❌ 순환 참조 발생
```
📌 **`student.py`가 `student_manager.py`를 import하고, `student_manager.py`가 다시 `student.py`를 import하면서 무한 루프 발생!**

---

### ✅ **순환 참조 해결 방법**
**1. `import`를 지연시키기 (`import`를 함수 내부로 이동)**  
```python
# student.py
def get_student_manager():
    from student_manager import StudentManager
    return StudentManager()
```
📌 `import`를 함수 내부에서 실행하면 **실제 함수가 호출될 때만 import됨** → 순환 참조 방지  

---

**2. `import`를 `if TYPE_CHECKING:` 조건문 안에 두기**  
Python 3.5+에서는 `if TYPE_CHECKING:`을 사용하면 정적 타입 검사에서만 import되고 런타임에는 실행되지 않아.
```python
# student.py
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from student_manager import StudentManager
```

---

**3. 모듈 분리 (권장)**
- **공통 요소**(예: `Student`)는 별도의 파일(`student.py`)로 분리  
- **파일 저장(`file_storage.py`)**과 **학생 관리(`student_manager.py`)**를 명확히 구분  

이렇게 하면 `import`가 명확해지고 **순환 참조를 방지**할 수 있어. 🚀

`json.dump()` 함수에서 `ensure_ascii`는 **인코딩 방식**을 설정하는 인자입니다. 기본적으로 `ensure_ascii=True`로 설정되어 있으며, 이 설정은 모든 비-ASCII 문자를 **이스케이프 시퀀스**로 변환하여 출력합니다. 즉, 한글이나 특수 문자는 `\u`로 시작하는 유니코드 이스케이프 시퀀스로 출력됩니다.

### 📌 **기본 사용법 (`ensure_ascii=True`)**

```python
import json

data = {"name": "홍길동", "age": 30}

with open("data.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=True)
```

위 코드에서 `ensure_ascii=True`이면, `홍길동`은 `\u`로 시작하는 유니코드 형식으로 저장됩니다:
```json
{"name": "\ud64d\uae38\ub3d9", "age": 30}
```

---

### 📌 **`ensure_ascii=False` 설정**

`ensure_ascii=False`로 설정하면, **비-ASCII 문자**가 **원래 문자 그대로 저장**됩니다. 즉, 한글이나 특수 문자가 그대로 파일에 저장됩니다.

```python
import json

data = {"name": "홍길동", "age": 30}

with open("data.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False)
```

위 코드에서는 `ensure_ascii=False`이므로, `홍길동`이 그대로 저장됩니다:
```json
{"name": "홍길동", "age": 30}
```

---

### 📌 **정리**
- **`ensure_ascii=True` (기본값)**: 모든 비-ASCII 문자는 유니코드 이스케이프 시퀀스로 저장됩니다.
- **`ensure_ascii=False`**: 비-ASCII 문자가 그대로 저장됩니다.

따라서, 한글이나 다른 비-ASCII 문자를 그대로 저장하려면 **`ensure_ascii=False`**로 설정하면 됩니다.
파이썬에서 사용되는 테스트 도구들은 다양하며, 각 도구마다 특정 용도와 특성이 있습니다. 주요 테스트 도구들을 소개하겠습니다:

1. **unittest**
   - 파이썬 표준 라이브러리에서 제공하는 테스트 프레임워크입니다.
   - `JUnit`에서 영향을 받았으며, 테스트 케이스 작성과 실행을 위한 다양한 기능을 제공합니다.
   - 사용법이 직관적이고, 표준 라이브러리의 일부라 별도의 설치가 필요 없습니다.
   - 예시:
     ```python
     import unittest

     class MyTest(unittest.TestCase):
         def test_addition(self):
             self.assertEqual(1 + 1, 2)

     if __name__ == '__main__':
         unittest.main()
     ```

2. **pytest**
   - 매우 인기 있는 테스트 도구로, `unittest`보다 더 간결하고 강력한 기능을 제공합니다.
   - 플러그인 시스템을 지원하고, 테스트 스위트 작성과 디버깅이 편리합니다.
   - 다양한 기능 (예: 파라미터화된 테스트, 테스트 고립)을 제공하고, assert 문을 더 직관적으로 사용할 수 있습니다.
   - 설치: `pip install pytest`
   - 예시:
     ```python
     def test_addition():
         assert 1 + 1 == 2
     ```

3. **nose2**
   - `nose`의 후속 프로젝트로, `unittest`와의 호환성도 높고, 확장성 있는 테스트 프레임워크입니다.
   - 자동으로 테스트를 탐지하고, 다양한 플러그인과 확장 기능을 제공합니다.
   - 설치: `pip install nose2`
   - 예시:
     ```python
     import unittest

     class MyTest(unittest.TestCase):
         def test_addition(self):
             self.assertEqual(1 + 1, 2)
     ```

4. **doctest**
   - 파이썬의 문서화 문자열 (docstring) 내에 예시를 테스트하는 도구입니다.
   - 코드 주석 내의 예시가 실제로 실행되는지 확인할 수 있어, 문서와 테스트를 함께 작성할 수 있습니다.
   - 예시:
     ```python
     def add(a, b):
         """
         Adds two numbers.
         Example:
         >>> add(1, 2)
         3
         """
         return a + b
     ```

5. **tox**
   - 다중 환경에서 테스트를 실행할 수 있도록 도와주는 도구입니다.
   - 여러 파이썬 버전에서 테스트를 실행하거나, 다양한 의존성 환경을 설정할 수 있습니다.
   - 설치: `pip install tox`
   - 예시: `tox.ini` 파일을 사용하여 다양한 환경 설정 가능.

6. **coverage.py**
   - 테스트 커버리지를 측정하는 도구입니다.
   - 코드가 얼마나 테스트되었는지 확인할 수 있어, 테스트의 완전성을 평가하는 데 유용합니다.
   - 설치: `pip install coverage`
   - 예시:
     ```bash
     coverage run -m pytest
     coverage report
     ```

7. **mock**
   - 객체나 함수의 동작을 가짜로 만들어서 테스트하는 데 사용되는 라이브러리입니다.
   - `unittest.mock` 모듈로 표준 라이브러리에 포함되어 있으며, 외부 의존성을 분리하고 독립적인 테스트를 가능하게 합니다.
   - 예시:
     ```python
     from unittest.mock import MagicMock

     mock = MagicMock()
     mock.some_method.return_value = 'mocked'
     assert mock.some_method() == 'mocked'
     ```

이 외에도 다양한 라이브러리와 도구들이 있으며, 각 테스트 도구의 선택은 프로젝트의 필요와 개발 환경에 따라 달라질 수 있습니다.

아래는 지금까지 질문하신 내용과 그에 대한 설명을 한 곳에 정리한 것입니다. 각 항목을 보기 좋게 정리해 두었으며, `unittest.main()`의 내부 구현 내용도 포함되어 있습니다.

---

### 1. **`unittest.main()`이 `TestCase`를 찾는 방법**

`unittest.main()`이 현재 스크립트에서 `TestCase`를 상속받은 클래스를 자동으로 찾는 방법을 설명합니다. `unittest.main()`은 내부적으로 `TestLoader`를 사용하여 현재 스크립트에서 `unittest.TestCase`를 상속받은 모든 클래스를 자동으로 찾아서 실행합니다.

- **`unittest.main()`의 역할**: `unittest.main()`은 현재 스크립트를 실행할 때, `TestLoader`를 사용하여 현재 스크립트 내에서 `TestCase`를 상속받은 클래스를 자동으로 찾고 이를 실행합니다.

- **`TestCase` 클래스 찾는 과정**:
  1. **`globals()` 사용**: `unittest.main()`은 `globals()`를 사용하여 현재 스크립트의 전역 심볼 테이블을 검사합니다. 이 함수는 현재 스크립트 내에서 정의된 모든 클래스와 함수, 변수를 반환합니다.
  2. **클래스 타입 확인**: 반환된 아이템 중에서 `unittest.TestCase`를 상속받은 클래스를 `issubclass()` 함수로 확인합니다.
  3. **자동 실행**: `unittest.main()`은 `TestCase` 클래스를 자동으로 찾아서 테스트 메서드들을 실행합니다.

---

### 2. **`loadTestsFromTestCase` 메서드**

`TestLoader.loadTestsFromTestCase`는 `TestCase` 클래스를 입력받아 해당 클래스의 테스트 메서드를 로드하는 함수입니다.

- **사용 예시**:
  ```python
  loader = unittest.TestLoader()
  suite = loader.loadTestsFromTestCase(MyTestCase)
  runner = unittest.TextTestRunner()
  runner.run(suite)
  ```

- **동작**:
  - `loadTestsFromTestCase` 메서드는 `MyTestCase`와 같은 `TestCase` 서브클래스를 인자로 받으면, 그 클래스 안에서 `test_`로 시작하는 메서드를 찾아서 **테스트 스위트**를 구성합니다.
  - 이 스위트는 나중에 `runner.run(suite)`를 통해 실행됩니다.

---

### 3. **`unittest.main()` 내부 구현**

`unittest.main()`은 모듈을 분석하여, 그 안에서 `TestCase`를 상속받은 클래스를 자동으로 찾고 테스트를 실행합니다. 이를 위해 내부적으로 `globals()`와 `issubclass()`를 사용하여 모든 클래스를 순회하고, `TestCase` 서브클래스를 찾아 테스트 메서드를 실행합니다.

#### 코드 예시:
```python
import unittest

class MyTestCase(unittest.TestCase):
    def test_addition(self):
        self.assertEqual(1 + 1, 2)

    def test_subtraction(self):
        self.assertEqual(5 - 3, 2)

    def test_multiplication(self):
        self.assertEqual(2 * 3, 6)

# unittest.main()이 호출될 때 내부적으로 어떻게 TestCase 클래스를 찾는지 확인하는 코드
if __name__ == "__main__":
    # 현재 모듈 내의 모든 클래스들을 globals()에서 확인하여 TestCase를 상속받은 클래스만 찾는다
    test_cases = []
    for name, obj in globals().items():
        if isinstance(obj, type) and issubclass(obj, unittest.TestCase) and obj is not unittest.TestCase:
            test_cases.append(obj)
    
    # 찾은 TestCase 클래스 출력
    print("Found TestCase classes:")
    for test_case in test_cases:
        print(test_case.__name__)

    # TestLoader를 통해 실제로 로드하고 실행
    loader = unittest.TestLoader()
    suite = loader.loadTestsFromTestCase(MyTestCase)  # MyTestCase 로드
    runner = unittest.TextTestRunner()
    runner.run(suite)
```

#### 출력 예시:
```
Found TestCase classes:
MyTestCase
...
----------------------------------------------------------------------
Ran 3 tests in 0.001s

OK
```

### 4. **`globals()`와 `issubclass()`**

- **`globals()`**:
  - 현재 모듈의 전역 심볼 테이블을 반환합니다. 이를 통해 현재 스크립트 내에서 정의된 모든 클래스와 함수들을 확인할 수 있습니다.

- **`issubclass(obj, unittest.TestCase)`**:
  - 객체 `obj`가 `unittest.TestCase`의 서브클래스인지 확인하는 함수입니다. 이를 통해 `TestCase`를 상속받은 클래스를 찾습니다.

### 5. **`unittest.main()` 동작 흐름**

1. **모듈 분석**: `unittest.main()`은 `globals()`를 통해 현재 모듈의 모든 클래스와 함수를 확인합니다.
2. **서브클래스 확인**: 각 클래스에 대해 `issubclass()`를 사용하여 `TestCase`를 상속받았는지 검사합니다.
3. **테스트 로드 및 실행**: `TestLoader`가 `TestCase` 클래스를 찾으면, 해당 클래스의 `test_`로 시작하는 메서드를 테스트 스위트에 추가하고 실행합니다.

---

이러한 과정을 통해, `unittest.main()`은 사용자가 명시적으로 `TestCase` 클래스를 지정하지 않아도, 현재 스크립트 내에서 `TestCase`를 상속받은 클래스를 자동으로 찾아 실행할 수 있게 됩니다. 이 과정은 `unittest` 프레임워크의 핵심적인 동작 방식으로, 사용자는 `unittest.main()`만 호출하면 모든 테스트가 자동으로 처리됩니다.
Python에서 **예외 처리**(Exception Handling)는 프로그램 실행 중 발생할 수 있는 오류를 처리하여 **비정상적인 종료를 방지**하고, **원하는 방식으로 대응**할 수 있도록 합니다.  

---

## 🔹 1. 예외(Exception)란?  
예외는 프로그램 실행 중 발생하는 **예상치 못한 오류**를 의미합니다.  
예를 들어, 0으로 나누거나, 존재하지 않는 파일을 열려고 할 때 예외가 발생합니다.

### ❗ 자주 발생하는 예외 유형
| 예외 | 설명 |
|------|------|
| `ZeroDivisionError` | 0으로 나누었을 때 발생 |
| `IndexError` | 리스트, 튜플 등의 인덱스 범위를 벗어났을 때 발생 |
| `KeyError` | 딕셔너리에서 존재하지 않는 키를 참조할 때 발생 |
| `ValueError` | 형변환 등에서 부적절한 값을 사용할 때 발생 |
| `TypeError` | 연산이나 함수 호출 시 타입이 맞지 않을 때 발생 |
| `FileNotFoundError` | 존재하지 않는 파일을 열려고 할 때 발생 |
| `AttributeError` | 존재하지 않는 속성이나 메서드를 호출할 때 발생 |

---

## 🔹 2. 기본 예외 처리 (`try-except` 문)  
예외 처리는 `try`와 `except` 블록을 사용하여 수행합니다.  

```python
try:
    x = 10 / 0  # ZeroDivisionError 발생
except ZeroDivisionError:
    print("0으로 나눌 수 없습니다.")
```
**출력:**  
```
0으로 나눌 수 없습니다.
```

---

## 🔹 3. 여러 개의 예외 처리 (`except` 여러 개 사용)  
```python
try:
    lst = [1, 2, 3]
    print(lst[5])  # IndexError 발생
except ZeroDivisionError:
    print("0으로 나눌 수 없습니다.")
except IndexError:
    print("리스트 인덱스 범위를 벗어났습니다.")
```
**출력:**  
```
리스트 인덱스 범위를 벗어났습니다.
```

---

## 🔹 4. 모든 예외 처리 (`Exception`)  
모든 예외를 한꺼번에 처리하려면 `Exception`을 사용합니다.  
```python
try:
    x = int("Hello")  # ValueError 발생
except Exception as e:
    print(f"예외 발생: {e}")
```
**출력:**  
```
예외 발생: invalid literal for int() with base 10: 'Hello'
```
✔ **모든 예외를 처리하는 것은 권장되지 않으며, 특정 예외를 처리하는 것이 바람직합니다.**

---

## 🔹 5. `else`와 `finally` 사용  
- `else`: 예외가 발생하지 않았을 때 실행됨  
- `finally`: 예외 발생 여부와 관계없이 **항상 실행됨** (리소스 해제 등에서 사용)

```python
try:
    num = int(input("숫자를 입력하세요: "))  # 정상 입력 시 실행됨
except ValueError:
    print("잘못된 입력입니다! 숫자를 입력하세요.")
else:
    print(f"입력한 숫자는 {num}입니다.")
finally:
    print("프로그램 종료")  # 항상 실행됨
```

✔ **실행 흐름**  
- 숫자를 입력하면 `else` 블록 실행  
- 숫자가 아닌 값을 입력하면 `except` 블록 실행  
- `finally`는 **무조건 실행됨**

---

## 🔹 6. 사용자 정의 예외 (`raise`)  
`raise` 키워드를 사용하면 직접 예외를 발생시킬 수 있습니다.  
```python
def check_age(age):
    if age < 18:
        raise ValueError("18세 이상만 가능합니다.")
    return "입장 가능합니다."

try:
    print(check_age(15))
except ValueError as e:
    print(f"오류 발생: {e}")
```
**출력:**  
```
오류 발생: 18세 이상만 가능합니다.
```

---

## 🔹 7. 사용자 정의 예외 클래스 만들기  
기존 예외 대신 **사용자 정의 예외**를 만들려면 `Exception`을 상속받아 사용합니다.  
```python
class NegativeNumberError(Exception):
    def __init__(self, value):
        super().__init__(f"음수는 입력할 수 없습니다: {value}")

def check_positive(num):
    if num < 0:
        raise NegativeNumberError(num)
    return num

try:
    print(check_positive(-5))
except NegativeNumberError as e:
    print(f"예외 발생: {e}")
```
**출력:**  
```
예외 발생: 음수는 입력할 수 없습니다: -5
```

---

## 🔹 8. `with`문과 예외 처리 (파일 처리 예제)  
파일 입출력 시에는 `finally` 없이도 자동으로 자원을 정리할 수 있도록 `with`문을 사용합니다.  
```python
try:
    with open("파일.txt", "r") as file:
        content = file.read()
        print(content)
except FileNotFoundError:
    print("파일을 찾을 수 없습니다.")
```
✔ **`with`를 사용하면 파일을 자동으로 닫아줍니다.**

---

## 🔹 9. 예외 처리 Best Practices  
✅ **특정 예외를 명확히 처리하기** (모든 예외를 `Exception`으로 처리하지 않기)  
✅ **가능한 한 자세한 예외 메시지 출력하기**  
✅ **파일이나 네트워크 리소스는 `with`문을 사용하여 관리하기**  
✅ **사용자 정의 예외를 만들어 의미 있는 예외를 발생시키기**  

---

## 🔹 10. 예외 처리를 활용한 안전한 코드 예제  
```python
def divide(a, b):
    try:
        return a / b
    except ZeroDivisionError:
        return "0으로 나눌 수 없습니다."
    except TypeError:
        return "숫자만 입력하세요."

print(divide(10, 2))  # 정상 실행
print(divide(10, 0))  # 0으로 나누는 예외 처리
print(divide(10, "a"))  # 타입 오류 예외 처리
```
**출력:**  
```
5.0
0으로 나눌 수 없습니다.
숫자만 입력하세요.
```

---

## 🔹 결론  
Python의 예외 처리는 **안전한 프로그램을 만들기 위한 필수 요소**입니다.  
예외 처리를 적절히 활용하면 **예기치 않은 오류로 인한 프로그램 중단을 방지**할 수 있습니다. 🚀

리턴은 문장이 다 실행되고 나서 return

### **📌 `__init__.py`의 활용과 역할**  

`__init__.py`는 **Python 패키지의 일부임을 나타내는 파일**이며, 다양한 용도로 활용될 수 있어. 기본적인 역할과 활용법을 정리해줄게.  

---

## **1️⃣ `__init__.py`의 기본 역할**
1. **패키지 인식 역할**  
   - `__init__.py`가 존재하는 디렉터리는 **Python 패키지로 간주됨.**  
   - 예전 버전(Python 3.2 이전)에서는 이 파일이 반드시 필요했지만, 최신 버전에서는 없어도 패키지로 인식됨. 하지만 여전히 활용도가 높음.

2. **패키지 초기화 코드 실행**  
   - 패키지가 임포트될 때, `__init__.py` 내부 코드가 실행됨.
   - 전역 변수, 로깅, 설정값 등을 정의하는 데 사용 가능.

3. **패키지 내에서 특정 모듈을 자동으로 임포트 가능**  
   - `__init__.py`에서 특정 모듈을 미리 로드하여, 패키지 사용자가 더 쉽게 접근하도록 할 수 있음.

---

## **2️⃣ `__init__.py` 활용 예제**
### **📌 (1) 기본적인 패키지 구조**
```bash
my_package/
│── __init__.py
│── module1.py
│── module2.py
```

### **📌 (2) `__init__.py` 내부에서 모듈을 미리 로드**
#### **파일: `my_package/__init__.py`**
```python
print("패키지 my_package가 로드되었습니다.")

# 특정 모듈을 미리 임포트
from .module1 import foo
from .module2 import bar
```

#### **파일: `my_package/module1.py`**
```python
def foo():
    return "Hello from module1"
```

#### **파일: `my_package/module2.py`**
```python
def bar():
    return "Hello from module2"
```

### **📌 (3) 패키지를 임포트하면 자동 실행**
```python
import my_package

print(my_package.foo())  # "Hello from module1"
print(my_package.bar())  # "Hello from module2"
```
✅ `my_package`를 임포트할 때, `__init__.py` 내부의 코드가 실행되며, `module1`과 `module2`의 함수를 직접 호출할 수 있게 됨.

---

## **3️⃣ 고급 활용법**
### **📌 (1) 패키지 내에서 전역 설정 관리**
- `__init__.py`를 활용하여 패키지의 **전역 변수**나 **설정값**을 관리할 수 있음.

#### **예제: `config.py`를 `__init__.py`에서 로드**
```python
# __init__.py
from .config import settings
```

```python
# config.py
settings = {
    "db_host": "localhost",
    "db_port": 3306
}
```

#### **사용 예제**
```python
import my_package

print(my_package.settings["db_host"])  # "localhost"
```

---

### **📌 (2) 동적 임포트 활용 (`__all__` 설정)**
- `__init__.py`에서 `__all__`을 설정하면, `from my_package import *` 할 때 불러올 모듈을 제한할 수 있음.

```python
# __init__.py
__all__ = ["module1"]
```

```python
from my_package import *

print(module1.foo())  # 정상 작동
print(module2.bar())  # ImportError 발생 (제한됨)
```

---

### **📌 (3) `__path__`를 이용한 동적 패키지 확장**
- `__path__`를 조작하면 런타임에 동적으로 패키지를 확장할 수도 있음.

```python
# __init__.py
import os
import sys

# 현재 패키지 경로에 특정 디렉토리를 추가
sys.path.append(os.path.join(os.path.dirname(__file__), "extra_modules"))
```

---

## **4️⃣ 결론**
✅ **Python 패키지를 효과적으로 관리하고 초기화하는 데 `__init__.py`를 활용할 수 있음.**  
✅ **모듈을 자동으로 로드하거나, 전역 설정을 저장하거나, 동적 임포트 등을 할 때 유용함.**  
✅ **최근 버전(Python 3.3+)에서는 필수는 아니지만, 여전히 패키지 설계에서 중요한 역할을 함.**  

Google Colab에서 세션을 다시 시작하면, Python 인터프리터가 완전히 초기화되면서 모든 변수가 사라지고, 새롭게 시작됨. 이때 `__init__.py`가 다시 실행되지만, **이미 임포트된 모듈은 캐싱되어 있어서 이후 다시 실행되지 않는 것**이 원인임.  

---

## **📌 원인 분석**
1. **Colab 세션을 다시 시작하면 인터프리터가 재부팅됨**
   - 모든 임포트된 모듈, 변수, 객체가 사라짐.
   - 따라서, 패키지를 처음 임포트하면 `__init__.py`가 실행됨.

2. **두 번째 실행부터는 `sys.modules` 캐싱 때문에 실행되지 않음**
   - Python은 한 번 임포트한 모듈을 `sys.modules`에 저장하고, 같은 모듈을 다시 임포트할 때 `__init__.py`를 다시 실행하지 않음.
   - 이는 성능 최적화를 위해 Python이 제공하는 기본 동작임.

---

## **📌 해결 방법**
### **1️⃣ `importlib.reload()` 사용**
한 번 임포트된 모듈을 다시 로드하고 싶다면 `importlib.reload()`를 사용하면 됨.

```python
import importlib
import my_package  # 첫 번째 실행: __init__.py 실행됨

importlib.reload(my_package)  # 다시 로드하면 __init__.py 다시 실행됨
```

---

### **2️⃣ `sys.modules`에서 제거 후 재임포트**
Python의 `sys.modules`에서 패키지를 제거하면 다시 임포트할 때 `__init__.py`가 실행됨.

```python
import sys
import my_package

del sys.modules["my_package"]  # 캐시에서 제거
import my_package  # 다시 실행됨
```

---

### **3️⃣ `runpy` 모듈 사용**
`runpy` 모듈을 사용하여 패키지를 직접 실행할 수도 있음.

```python
import runpy
runpy.run_module("my_package")
```

---

## **📌 결론**
✅ **Colab에서 세션이 재시작되면, `__init__.py`는 처음에는 실행되지만 이후 다시 실행되지 않음.**  
✅ **이는 Python이 `sys.modules`에 임포트된 모듈을 캐싱하기 때문.**  
✅ **`importlib.reload()`, `del sys.modules`, `runpy.run_module()` 등을 사용하면 다시 실행 가능.**

### **Streamlit이란?**  
**Streamlit**은 **Python 기반의 데이터 애플리케이션 및 대시보드를 쉽게 만들 수 있는 라이브러리**임.  
주로 **데이터 시각화, 머신러닝 모델 공유, 웹 애플리케이션 개발**에 사용됨.  

---

## **📌 Streamlit 주요 특징**
✅ **간단한 코드**  
- Flask, Django와 달리 HTML, CSS 없이 **Python 코드만으로 웹 앱 개발 가능**  
- `st.write()`, `st.button()`, `st.slider()` 등의 API 제공  

✅ **빠른 실행**  
- 코드 변경 시 자동으로 **핫 리로드**  
- 빠르게 **프로토타이핑(시제품 개발)** 가능  

✅ **데이터 시각화 지원**  
- `Matplotlib`, `Seaborn`, `Plotly`, `Altair` 등과 통합  
- Pandas DataFrame도 바로 렌더링 가능  

✅ **인터랙티브 UI 지원**  
- `st.slider()`, `st.button()`, `st.selectbox()` 등 UI 요소 제공  
- 사용자 입력을 실시간으로 반영 가능  

✅ **클라우드 배포 가능**  
- **Streamlit Community Cloud**를 통해 손쉽게 배포 가능  

---

## **📌 Streamlit 설치 방법**
```bash
pip install streamlit
```

---

## **📌 Streamlit 기본 예제**
다음은 간단한 Streamlit 웹앱 코드임.  

### **🔹 `app.py`**
```python
import streamlit as st

st.title("📊 Streamlit 예제")
st.write("안녕하세요! 이것은 Streamlit을 활용한 간단한 웹 애플리케이션입니다.")

# 사용자 입력 받기
name = st.text_input("이름을 입력하세요:")
if name:
    st.write(f"환영합니다, {name}님!")

# 슬라이더로 숫자 선택
num = st.slider("숫자를 선택하세요", 0, 100, 50)
st.write(f"선택한 숫자: {num}")

# 버튼 추가
if st.button("클릭하세요"):
    st.write("버튼이 클릭되었습니다!")
```

---

## **📌 실행 방법**
Streamlit은 명령어 한 줄로 실행 가능함.
```bash
streamlit run app.py
```
이후, **로컬 브라우저(`localhost:8501`)**에서 실행됨.

---

## **📌 결론**
✅ **Streamlit은 Python만으로 데이터 애플리케이션을 쉽게 개발할 수 있는 라이브러리**  
✅ **웹 개발 지식 없이도 대시보드, 머신러닝 모델을 공유할 수 있음**  
✅ **빠른 프로토타이핑과 배포가 가능하여 데이터 과학자, 연구원들에게 유용함**

ngrok은 로컬 서버를 인터넷 상에서 접근할 수 있게 만들어주는 서비스입니다. 개발 중인 웹 애플리케이션이나 API를 로컬 환경에서 테스트할 때, 외부에서 접근할 수 있도록 하는 터널링 도구입니다.

ngrok을 사용하면 로컬 머신에서 실행 중인 서버에 대한 공개 URL을 생성할 수 있어서, 클라우드나 외부 서버를 설정하지 않고도 외부에서 로컬 서버를 테스트하거나, 다른 사람들이 접근할 수 있도록 할 수 있습니다. 특히 웹훅(Webhook) 테스트나, 개발 중인 앱을 다른 사람과 공유하고자 할 때 유용합니다.

간단히 말하면, ngrok은 로컬 서버에 대한 "공개 주소"를 생성해주는 도구입니다.
