Python 3.7부터 딕셔너리의 **키 입력 순서가 유지**된다고 해서, 해시 테이블이 아닌 것은 아닙니다. 여전히 **해시 테이블 기반의 구조**를 사용하지만, 내부 구현 방식이 개선된 것입니다.  

---

### **💡 Python 3.7 이후 딕셔너리의 동작 방식**  
- **해시 테이블을 사용하지만, 추가적인 배열을 도입**하여 키 입력 순서를 유지함.  
- 즉, **탐색 속도는 O(1)로 유지하면서도, 키 입력 순서를 보장하는 방식**으로 개선됨.  
- `dict`는 **해시 테이블 + 이중 배열 구조**를 사용함.

---

### **🔍 내부 구현 (CPython 3.6 이후 구조 변화)**  
#### **1. Python 3.6 이전 (기본 해시 테이블 구조)**  
- 딕셔너리는 **일반적인 해시 테이블**을 사용했으며, 키의 순서는 전혀 보장되지 않았음.  
- 내부적으로 `hash(key) % table_size`를 이용해 데이터를 저장했으며, **삭제가 일어나거나 충돌이 발생하면 키 순서가 변경될 가능성이 있음**.  

#### **2. Python 3.6 (순서를 유지하는 딕셔너리 도입 - 실험적 적용)**  
- **Insertion-ordered dict**가 추가됨.  
- 기본 해시 테이블 외에도 **키 입력 순서를 유지하는 별도의 배열을 추가하여, 키 순서를 보장하도록 개선됨**.  
- 하지만 3.6에서는 공식적인 보장이 아니었고, 내부 구현이 변경될 가능성이 있었음.

#### **3. Python 3.7 이후 (공식적으로 키 순서 유지 보장)**  
- Python 3.6에서 도입된 방식이 **정식 스펙으로 확정**됨.  
- 딕셔너리는 여전히 해시 테이블을 사용하지만, **키의 입력 순서를 유지하는 구조가 추가됨**.  

---

### **📌 결론: 해시 테이블이지만, 순서도 유지된다!**
Python 3.7 이후의 딕셔너리는 여전히 **해시 테이블을 사용**하여 평균 O(1) 탐색 속도를 유지하지만,  
**별도의 배열을 활용하여 키 입력 순서를 보장**하는 방식으로 동작함.  

즉,  
✅ **해시 테이블 기반** + ✅ **키 입력 순서 유지 기능 추가**  
➡ **해시 테이블이면서 순서를 유지하는 구조**  

따라서 딕셔너리는 **순서를 보장하면서도 빠른 검색 속도를 유지할 수 있는 자료구조**가 된 것임. 🚀

### **딕셔너리(Dictionary)의 장단점**  

#### **✅ 장점**  

1. **빠른 데이터 조회 (탐색 속도 O(1))**  
   - 딕셔너리는 **해시 테이블(Hash Table) 구조**를 사용하여 키(key)로 값을 빠르게 검색할 수 있음.  
   - 리스트나 튜플은 원하는 값을 찾기 위해 O(n)의 탐색 시간이 걸릴 수 있지만, 딕셔너리는 평균적으로 O(1)에 조회 가능.  

2. **키(key) 기반 데이터 관리**  
   - 리스트는 인덱스를 기반으로 접근해야 하지만, 딕셔너리는 의미 있는 키를 사용해 값을 저장하고 조회할 수 있음.  
   - 예시:  
     ```python
     student = {"name": "홍길동", "age": 20, "score": 95}
     print(student["name"])  # 홍길동
     ```
   - 가독성이 뛰어나고 데이터의 의미를 쉽게 파악 가능.

3. **중복된 키 없음 (데이터 무결성 보장)**  
   - 동일한 키를 여러 번 사용할 수 없으므로, 데이터의 중복을 방지할 수 있음.  
   - 예를 들어, 주민번호를 키로 사용하면 같은 사람이 중복 저장되지 않음.  

4. **데이터 추가 및 삭제가 빠름**  
   - 새로운 데이터를 추가하거나 삭제할 때도 해시 테이블을 사용하여 평균 O(1) 시간에 수행됨.  
   - 예시:  
     ```python
     student["math"] = 100  # 값 추가 (O(1))
     del student["age"]  # 값 삭제 (O(1))
     ```

5. **다양한 데이터 타입 저장 가능**  
   - 값(value)에는 리스트, 튜플, 딕셔너리 등 다양한 데이터 타입을 저장할 수 있음.  
   - 예시:  
     ```python
     student = {
         "name": "강감찬",
         "scores": {"math": 95, "english": 90},
         "hobbies": ["reading", "coding"]
     }
     ```

---

#### **❌ 단점**  

1. **메모리 사용량이 큼**  
   - 딕셔너리는 내부적으로 **해시 테이블을 유지하기 위해 추가적인 메모리를 사용**하므로, 리스트보다 메모리 효율이 떨어짐.  
   - 작은 데이터셋에서는 리스트나 튜플이 더 적절할 수 있음.  

2. **키(key) 순서가 보장되지 않음 (Python 3.6 이전)**  
   - Python 3.6부터는 입력 순서를 유지하지만, 이전 버전에서는 순서가 보장되지 않았음.  
   - 리스트처럼 순서를 유지하면서 반복하고 싶다면, `OrderedDict`를 사용할 수도 있음.  

3. **연산 속도가 느릴 수 있음 (특히 해시 충돌 발생 시)**  
   - 해시 테이블을 사용하기 때문에 **해시 충돌(hash collision)** 이 발생하면 탐색 성능이 저하될 수 있음.  
   - 최악의 경우 O(n)의 탐색 시간이 걸릴 수도 있음.  

4. **정렬이 번거로움**  
   - 리스트는 `sort()`를 사용하면 정렬이 간단하지만, 딕셔너리는 기본적으로 키나 값을 기준으로 정렬해야 함.  
   - 예시:  
     ```python
     sorted_dict = dict(sorted(student.items(), key=lambda x: x[0]))  # 키 기준 정렬
     ```

5. **KeyError 발생 가능**  
   - 존재하지 않는 키를 조회하면 `KeyError`가 발생하므로, 항상 키 존재 여부를 확인해야 함.  
   - 예시:  
     ```python
     print(student.get("gender", "정보 없음"))  # 존재하지 않는 키는 기본값 반환
     ```

---

### **📌 정리**  
|  | **장점** | **단점** |
|---|---|---|
| **조회 속도** | O(1)로 매우 빠름 | 해시 충돌이 발생하면 느려질 수 있음 |
| **데이터 관리** | 키(key)를 사용하여 의미 있는 데이터 저장 가능 | 키가 존재하지 않으면 `KeyError` 발생 가능 |
| **메모리 효율** | 빠른 탐색을 위해 해시 테이블 사용 | 리스트보다 메모리를 많이 사용 |
| **순서 유지** | Python 3.7부터 입력 순서 유지 | Python 3.6 이전에는 순서가 보장되지 않음 |
| **정렬** | 키/값 기준 정렬 가능하지만 번거로움 | 리스트처럼 `sort()`로 간단하게 정렬 불가 |

따라서 **빠른 탐색과 키 기반 데이터 저장이 중요할 때는 딕셔너리를 사용**,  
메모리 효율과 순서가 중요할 때는 리스트나 튜플을 고려하는 것이 좋음. 🚀

## **📌 Python 딕셔너리(Dictionary) 기본 사용법**  

Python의 딕셔너리는 **key-value 쌍**을 저장하는 **해시 테이블 기반의 자료구조**로, 데이터를 **생성(Create), 읽기(Read), 갱신(Update), 삭제(Delete)** 할 수 있습니다.  
이를 **CRUD 연산**이라고 하며, 아래와 같은 방식으로 사용됩니다.  

---

### **1️⃣ 딕셔너리 생성 (Create - C)**
딕셔너리는 `{}` 중괄호를 사용하여 생성하며, `key: value` 형태로 데이터를 저장합니다.  
```python
person = {
   'name': '철수',
   'age': 25,
   'kor': 100,
   'eng': 98,
   'math': 95
}
print(person)  # {'name': '철수', 'age': 25, 'kor': 100, 'eng': 98, 'math': 95}
```

---

### **2️⃣ 딕셔너리 조회 (Read - R)**
딕셔너리의 특정 값을 **키(key) 기반으로 접근**하여 읽을 수 있습니다.  
```python
print(f"이름 : {person['name']}")  # 이름 : 철수
print(f"나이 : {person['age']}")  # 나이 : 25
```
> **주의**: `person['없는키']`처럼 존재하지 않는 키를 조회하면 `KeyError`가 발생함.  
> 안전하게 조회하려면 `get()` 사용:
> ```python
> print(person.get('gender', '정보 없음'))  # gender 키가 없으면 기본값 반환
> ```

---

### **3️⃣ 딕셔너리 수정 (Update - U)**
기존 키에 새로운 값을 할당하면 업데이트됩니다.
```python
person['name'] = '김철수'  # 이름 변경
print(f"이름 : {person['name']}")  # 이름 : 김철수
```

---

### **4️⃣ 딕셔너리 값 추가 (Create - C)**
존재하지 않는 키에 값을 할당하면 새로운 데이터가 추가됩니다.
```python
person['sci'] = 100  # 과학 점수 추가
print(person)  
# {'name': '김철수', 'age': 25, 'kor': 100, 'eng': 98, 'math': 95, 'sci': 100}
```

---

### **5️⃣ 딕셔너리 값 삭제 (Delete - D)**
`del` 키워드를 사용하여 특정 키를 삭제할 수 있습니다.
```python
del person['age']  # 나이 삭제
print(person)  
# {'name': '김철수', 'kor': 100, 'eng': 98, 'math': 95, 'sci': 100}
```
> **주의**: 존재하지 않는 키를 삭제하려고 하면 `KeyError` 발생!  
> 안전하게 삭제하려면 `pop()` 사용:
> ```python
> person.pop('gender', '삭제할 데이터 없음')  # 키가 없으면 기본값 반환
> ```

---

## **✅ 딕셔너리 관련 주요 함수 정리**
| 기능 | 사용법 | 설명 |
|------|-------|------|
| 값 조회 | `person['name']` | 키를 이용해 값 읽기 (`KeyError` 주의) |
| 값 조회 | `person.get('name', '기본값')` | 존재하지 않는 키 조회 시 기본값 반환 |
| 값 추가 | `person['sci'] = 100` | 새로운 키-값 추가 |
| 값 수정 | `person['name'] = '김철수'` | 기존 키의 값 변경 |
| 값 삭제 | `del person['age']` | 특정 키 삭제 (`KeyError` 주의) |
| 값 삭제 | `person.pop('age', '없음')` | 키가 없을 경우 기본값 반환 |
| 키 목록 | `person.keys()` | 딕셔너리의 모든 키 조회 |
| 값 목록 | `person.values()` | 딕셔너리의 모든 값 조회 |
| 키-값 쌍 목록 | `person.items()` | (key, value) 튜플 목록 반환 |

---

## **📌 최종 정리**
- **딕셔너리는 `key: value` 형태의 데이터를 저장하는 자료구조**
- **CRUD (Create, Read, Update, Delete) 연산이 가능**
- **키를 이용한 빠른 조회(O(1))가 가능하지만, 메모리를 많이 사용**
- **Python 3.7 이후부터 입력 순서를 유지**

🚀 **딕셔너리는 키 기반 데이터 저장과 빠른 조회가 필요할 때 유용한 자료구조!**

## **📌 딕셔너리에서 키 존재 여부 체크하는 방법**

딕셔너리에서 특정 키가 존재하는지 확인하는 방법은 **in 연산자**를 사용하는 것이 일반적입니다.

---

### **✅ 1. `in` 연산자 사용 (추천)**
Python에서는 `in` 연산자를 사용하면 **해당 키가 딕셔너리에 존재하는지 빠르게 확인**할 수 있습니다.
```python
person = {
    'name': '철수',
    'age': 25,
    'kor': 100
}

# 존재 여부 확인
if 'name' in person:
    print("name 키가 존재합니다.")  # 출력됨
else:
    print("name 키가 없습니다.")

if 'gender' in person:
    print("gender 키가 존재합니다.")
else:
    print("gender 키가 없습니다.")  # 출력됨
```
> **🔹 특징**  
> - `in` 연산자는 내부적으로 **해시 테이블을 조회**하기 때문에 **O(1)**의 시간 복잡도를 가짐 → 매우 빠름.
> - **가장 많이 사용되는 방법**!

---

### **✅ 2. `.get()` 메서드 사용 (KeyError 방지)**
존재하지 않는 키를 조회할 경우 `KeyError`가 발생하는데, `get()`을 사용하면 **기본값을 설정**하여 안전하게 조회할 수 있습니다.
```python
value = person.get('gender')  # 존재하지 않는 키
print(value)  # None

value = person.get('gender', '정보 없음')
print(value)  # '정보 없음'
```
> **🔹 특징**  
> - 키가 존재하면 해당 값을 반환, 없으면 `None` 또는 기본값 반환.
> - 키가 없을 때 `KeyError`를 방지하는 용도로 많이 사용.

---

### **✅ 3. `keys()` 사용 (비효율적 - 추천하지 않음)**
`keys()` 메서드를 사용하여 모든 키를 리스트처럼 다룰 수도 있지만, **비효율적이므로 추천되지 않습니다.**
```python
if 'name' in person.keys():
    print("name 키가 존재합니다.")  # 출력됨
```
> **🔹 비효율적인 이유**  
> - `person.keys()`는 전체 키 목록을 가져와서 확인하므로, **O(N) 시간 복잡도**가 걸림.
> - 해시 테이블 조회(O(1))보다 비효율적 → `in` 연산자를 사용하는 것이 더 좋음!

---

## **📌 결론**
| 방법 | 성능 | 추천 여부 | 설명 |
|------|------|----------|------|
| `'key' in dict` | **O(1)** | ✅ **추천** | 해시 테이블 기반 빠른 조회 |
| `dict.get('key')` | **O(1)** | ✅ **추천** | 기본값 설정 가능, KeyError 방지 |
| `'key' in dict.keys()` | **O(N)** | ❌ **비추천** | 전체 키 목록을 가져와야 하므로 비효율적 |

📌 **➡ `in` 연산자를 사용한 키 존재 여부 체크가 가장 빠르고 효율적인 방법!** 🚀
`dict.get(key, default)`와 유사한 기능을 직접 구현해보려면, 딕셔너리에서 특정 키를 안전하게 조회하는 함수를 만들면 됩니다.  

---

## **✅ `get()` 기능 직접 구현**
```python
def dict_get(dictionary, key, default=None):
    if key in dictionary:
        return dictionary[key]  # 키가 존재하면 해당 값 반환
    return default  # 키가 없으면 기본값 반환

# 테스트용 딕셔너리
person = {
    'name': '철수',
    'age': 25,
    'kor': 100
}

# 존재하는 키 조회
print(dict_get(person, 'name'))  # 철수

# 존재하지 않는 키 조회 (기본값 없음)
print(dict_get(person, 'gender'))  # None

# 존재하지 않는 키 조회 (기본값 설정)
print(dict_get(person, 'gender', '정보 없음'))  # 정보 없음
```

---

## **✅ 동작 원리**
1. `key in dictionary`를 사용하여 키 존재 여부를 확인.
2. 존재하면 `dictionary[key]` 값을 반환.
3. 존재하지 않으면 `default` 값을 반환.

이 방식은 Python 내장 `get()`과 같은 동작을 하지만, 직접 구현하는 과정에서 **딕셔너리 조회 방식을 이해하는 데 도움이 됩니다.** 🚀
# 딕셔너리 주요 메서드 사용 예시
```python
# 딕셔너리 생성
person = {"name": "철수", "age": 25, "city": "서울"}

# ✅ 요소 조회 관련
print(person.get("name"))  # 철수
print(person.get("height", "정보 없음"))  # 키가 없으면 기본값 반환: 정보 없음
print(person.keys())  # dict_keys(['name', 'age', 'city'])
print(person.values())  # dict_values(['철수', 25, '서울'])
print(person.items())  # dict_items([('name', '철수'), ('age', 25), ('city', '서울')])

# ✅ 요소 추가 및 수정
person.update({"age": 30, "job": "개발자"})  # age 수정, job 추가
print(person)  # {'name': '철수', 'age': 30, 'city': '서울', 'job': '개발자'}

# ✅ 요소 삭제
person.pop("age")  # 'age' 삭제
print(person)  # {'name': '철수', 'city': '서울', 'job': '개발자'}
del person["city"]  # 'city' 삭제
print(person)  # {'name': '철수', 'job': '개발자'}
person.clear()  # 모든 요소 삭제
print(person)  # {}

# ✅ 기타 메서드
new_dict = dict.fromkeys(["a", "b", "c"], 0)
print(new_dict)  # {'a': 0, 'b': 0, 'c': 0}
```

## **📌 딕셔너리 다양한 생성 방법**

딕셔너리는 다양한 방법으로 생성할 수 있으며, 각각의 방법은 상황에 맞게 유용하게 활용될 수 있습니다. 여기서는 Python에서 **딕셔너리 생성하는 여러 가지 방법**을 정리해 보겠습니다.

---

### **1. 중괄호 `{}`를 이용한 딕셔너리 생성**
가장 기본적이고 일반적인 방법으로, 키-값 쌍을 **중괄호** 안에 작성하여 딕셔너리를 생성합니다.

```python
person = {'name': '철수', 'age': 25, 'city': '서울'}
print(person)
```
- **장점**: 직관적이고 간단하며, 가장 많이 사용되는 방법입니다.
- **단점**: 키와 값이 정해져 있는 상태에서만 사용 가능.

---

### **2. `dict()` 내장 함수 사용**
`dict()` 함수는 키-값 쌍을 인수로 받아서 딕셔너리를 생성할 수 있습니다. 주로 **튜플**이나 **리스트** 형태로 전달됩니다.

#### **키-값 쌍을 튜플로 전달**
```python
person = dict([('name', '철수'), ('age', 25), ('city', '서울')])
print(person)
```
- **장점**: 리스트나 튜플을 이용해 딕셔너리를 만들 수 있어 **동적으로 딕셔너리 생성** 시 유용.
- **단점**: 리스트나 튜플로 키-값 쌍을 작성해야 하므로 약간 번거로울 수 있음.

#### **키-값 쌍을 키워드 인수로 전달**
```python
person = dict(name='철수', age=25, city='서울')
print(person)
```
- **장점**: 키워드 인수로 작성할 수 있어 코드가 간결해짐.
- **단점**: 키에 공백이나 특수 문자가 포함될 수 없으며, **문자열 형태로만 키를 사용할 수 있음**.

---

### **3. `fromkeys()` 메서드 사용**
`fromkeys()`는 주어진 **반복 가능한 객체(iterable)**에 대해 **값을 동일하게 지정**하여 딕셔너리를 생성합니다.

```python
keys = ['a', 'b', 'c']
person = dict.fromkeys(keys, 0)
print(person)  # {'a': 0, 'b': 0, 'c': 0}
```
- **장점**: 동일한 값으로 초기화된 딕셔너리를 생성할 때 유용.
- **단점**: 모든 키의 값이 동일하게 설정됨.

---

### **4. 딕셔너리 컴프리헨션 (Dictionary Comprehension)**
리스트 컴프리헨션처럼 **조건에 맞는 딕셔너리를 한 줄로 생성**할 수 있습니다.

```python
person = {x: x**2 for x in range(1, 6)}
print(person)  # {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}
```
- **장점**: 조건에 맞는 딕셔너리를 동적으로 생성할 수 있어 유용.
- **단점**: 코드가 길어지면 가독성이 떨어질 수 있음.

---

### **5. `zip()` 함수와 `dict()`를 활용한 딕셔너리 생성**
`zip()` 함수로 두 개 이상의 리스트를 **짝지어서** 딕셔너리를 만들 수 있습니다.

```python
keys = ['name', 'age', 'city']
values = ['철수', 25, '서울']
person = dict(zip(keys, values))
print(person)  # {'name': '철수', 'age': 25, 'city': '서울'}
```
- **장점**: 두 개 이상의 리스트나 튜플을 결합하여 딕셔너리를 만들 수 있어 **동적 데이터 처리**에 유용.
- **단점**: `zip()`이 반복 가능한 객체들을 처리하기 때문에 **순서가 중요**.

---

### **6. `defaultdict`를 사용한 딕셔너리 생성**
**`collections` 모듈**에 있는 `defaultdict`는 **기본값을 설정**할 수 있는 딕셔너리입니다. 해당 키가 없을 경우 자동으로 기본값을 반환합니다.

```python
from collections import defaultdict

person = defaultdict(int)
person['age'] += 1  # 기본값이 0이므로 1 증가
print(person)  # defaultdict(<class 'int'>, {'age': 1})
```
- **장점**: 키가 없을 때 기본값을 설정할 수 있어, 예외 처리 없이 값을 쉽게 수정 가능.
- **단점**: `defaultdict`는 **일반 딕셔너리와 다른 동작**을 하므로, 일반 딕셔너리와는 조금 다르게 동작할 수 있음.

---

### **7. `Counter`를 사용한 딕셔너리 생성**
`collections.Counter`는 **빈도수를 세는 데 유용한 클래스**로, 주로 **문자열이나 리스트의 요소 빈도수를 딕셔너리 형태로 반환**하는 데 사용됩니다.

```python
from collections import Counter

person = Counter(['a', 'b', 'a', 'c', 'b', 'a'])
print(person)  # Counter({'a': 3, 'b': 2, 'c': 1})
```
- **장점**: **빈도수 계산**을 자동으로 처리해주므로, 주로 데이터를 분석할 때 유용.
- **단점**: `Counter`는 **일반 딕셔너리**와는 약간 다른 동작을 하므로, 주의가 필요.

---

## **📌 결론**
딕셔너리는 다양한 방법으로 생성할 수 있으며, 각 방법은 상황에 따라 더 효율적이고 유용한 방식이 될 수 있습니다. 데이터를 동적으로 생성하거나 특정 조건에 맞게 딕셔너리를 만들 때 유용한 방법들을 잘 활용하면, 코드의 효율성을 높이고 가독성을 개선할 수 있습니다.

## **📌 `zip()` 함수 설명**

`zip()` 함수는 **두 개 이상의 iterable 객체** (리스트, 튜플, 문자열 등)의 **각각의 요소를 묶어서 튜플로 반환**하는 함수입니다. 주로 여러 개의 리스트나 튜플을 묶을 때 사용됩니다.

### **기본 문법**

```python
zip(iterable1, iterable2, ..., iterableN)
```

- **`iterable1, iterable2, ..., iterableN`**: 여러 개의 iterable 객체들을 전달합니다. 예를 들어, 리스트, 튜플, 문자열 등을 사용할 수 있습니다.
- 반환값: **각각의 iterable 객체에서 동일한 인덱스에 위치한 요소들을 묶은 튜플의 반복 가능한 객체** (zip 객체)가 반환됩니다.

### **사용 예시**

#### **1. 두 리스트를 묶기**
```python
names = ['철수', '영희', '민수']
ages = [25, 24, 23]

zipped = zip(names, ages)
print(list(zipped))  # [('철수', 25), ('영희', 24), ('민수', 23)]
```
- `zip(names, ages)`는 `names`와 `ages` 리스트에서 **동일한 인덱스에 있는 값을 튜플로 묶어줍니다**.

#### **2. 여러 개의 리스트를 묶기**
```python
names = ['철수', '영희', '민수']
ages = [25, 24, 23]
cities = ['서울', '부산', '대구']

zipped = zip(names, ages, cities)
print(list(zipped))  # [('철수', 25, '서울'), ('영희', 24, '부산'), ('민수', 23, '대구')]
```
- `zip(names, ages, cities)`는 세 개의 리스트를 각각 **동일한 인덱스에 있는 값들을 튜플로 묶습니다**.

#### **3. `zip()`을 `dict()`와 함께 사용**
```python
keys = ['name', 'age', 'city']
values = ['철수', 25, '서울']

zipped = zip(keys, values)
person = dict(zipped)
print(person)  # {'name': '철수', 'age': 25, 'city': '서울'}
```
- `zip()`을 `dict()`와 함께 사용하면 **두 리스트를 키-값 쌍으로 묶어 딕셔너리를 생성**할 수 있습니다.

### **주요 특징**
1. **길이가 다른 iterable**이 주어졌을 때, `zip()`은 **가장 짧은 iterable의 길이에 맞춰서 묶습니다**. 나머지 데이터는 무시됩니다.
   
   ```python
   names = ['철수', '영희', '민수']
   ages = [25, 24]
   
   zipped = zip(names, ages)
   print(list(zipped))  # [('철수', 25), ('영희', 24)]
   ```

2. **반복 가능 객체**: `zip()`은 **반복 가능한 객체를 반환**합니다. 이 객체는 리스트나 튜플로 바로 변환할 수 있습니다.

3. **`zip()` 객체는 한 번만 순회 가능**:
   - `zip()` 함수는 **한 번 순회**한 뒤에는 재사용할 수 없습니다.
   - 그래서 한 번 순회한 결과를 리스트나 튜플로 변환하여 저장하는 것이 일반적입니다.

   ```python
   zipped = zip(names, ages)
   print(list(zipped))  # [('철수', 25), ('영희', 24)]
   print(list(zipped))  # 빈 리스트 출력
   ```

### **4. `zip()`과 `*` 연산자 활용 (언패킹)**
`*` 연산자를 이용하면 `zip()`으로 묶인 객체를 다시 **원래의 여러 개의 iterable로 풀어낼** 수 있습니다.

```python
zipped = [('철수', 25), ('영희', 24), ('민수', 23)]
names, ages = zip(*zipped)
print(names)  # ('철수', '영희', '민수')
print(ages)   # (25, 24, 23)
```
- `*zipped`는 `zipped`에 있는 각 튜플을 언패킹하여, 원래 두 개의 리스트로 나누어줍니다.

---

## **📌 결론**
- `zip()` 함수는 여러 iterable 객체를 **같은 인덱스의 요소들로 묶은 튜플을 반환**하며, **반복 가능한 객체**로 제공됩니다.
- 리스트나 튜플을 동시에 처리할 때 매우 유용하게 사용됩니다.
- **길이가 다른 iterable 객체**가 있을 경우, **가장 짧은 객체에 맞춰서 묶습니다**.
- `zip()`과 `*` 연산자를 활용하면 **언패킹**을 통해 다시 분리할 수 있습니다.

## **📌 `enumerate()` 함수 설명**

`enumerate()` 함수는 **반복 가능한 객체(iterable)**의 **인덱스와 값을 동시에** 처리할 수 있도록 도와주는 내장 함수입니다. 주로 **반복문에서** 사용되며, **인덱스와 값을 동시에 사용할 필요가 있을 때 유용**합니다.

### **기본 문법**

```python
enumerate(iterable, start=0)
```

- **`iterable`**: 반복 가능한 객체(리스트, 튜플, 문자열 등).
- **`start`**: 인덱스의 시작 값을 지정하는 선택적 매개변수. 기본값은 `0`입니다.

### **사용 예시**

#### **1. 리스트와 인덱스를 동시에 처리**
```python
fruits = ['apple', 'banana', 'cherry']

for index, fruit in enumerate(fruits):
    print(f"Index: {index}, Fruit: {fruit}")
```
- 출력:
  ```
  Index: 0, Fruit: apple
  Index: 1, Fruit: banana
  Index: 2, Fruit: cherry
  ```
- `enumerate(fruits)`는 각 요소에 대해 **인덱스와 값**을 튜플 형태로 반환하고, `for` 루프에서 이를 각각 `index`와 `fruit`로 받아 사용합니다.

#### **2. 인덱스 시작 값 변경**
```python
fruits = ['apple', 'banana', 'cherry']

for index, fruit in enumerate(fruits, start=1):
    print(f"Index: {index}, Fruit: {fruit}")
```
- 출력:
  ```
  Index: 1, Fruit: apple
  Index: 2, Fruit: banana
  Index: 3, Fruit: cherry
  ```
- `enumerate(fruits, start=1)`을 사용하면 **인덱스가 1부터 시작**하게 됩니다.

#### **3. `enumerate()` 결과를 리스트로 변환**
```python
fruits = ['apple', 'banana', 'cherry']
enumerated_fruits = list(enumerate(fruits))
print(enumerated_fruits)
```
- 출력:
  ```
  [(0, 'apple'), (1, 'banana'), (2, 'cherry')]
  ```
- `enumerate(fruits)`는 **각 요소의 인덱스와 값을 튜플로 묶어서 반환**하며, 이를 `list()` 함수로 변환하면 리스트 형태로 결과를 확인할 수 있습니다.

---

### **주요 특징**

1. **인덱스와 값 동시에 사용 가능**: `enumerate()`는 반복문에서 **인덱스와 값을 동시에 사용할 수** 있게 해주어, 코드가 더 간결하고 가독성이 높아집니다.

2. **시작 인덱스 지정 가능**: `start` 매개변수를 사용하여 **인덱스의 시작값을 변경**할 수 있습니다. 기본값은 `0`이며, 이를 다른 값으로 설정할 수 있습니다.

3. **반복 가능한 객체의 인덱스와 값을 튜플로 반환**: `enumerate()`는 반복 가능한 객체의 각 요소를 `(인덱스, 값)` 형식의 튜플로 묶어서 반환합니다.

---

### **사용 예시에서의 활용도**

#### **1. 리스트의 인덱스와 값을 사용해야 할 때**
`enumerate()`를 사용하면 `for` 루프에서 **인덱스를 별도로 관리하지 않아도** 됩니다. 이는 코드의 간결함과 가독성을 높여줍니다.

#### **2. 리스트에서 조건을 만족하는 인덱스 찾기**
```python
words = ['apple', 'banana', 'cherry', 'date']
for index, word in enumerate(words):
    if 'a' in word:
        print(f"Index: {index}, Word: {word}")
```
- 출력:
  ```
  Index: 0, Word: apple
  Index: 1, Word: banana
  Index: 2, Word: cherry
  ```

- 위 코드에서는 `enumerate()`를 사용하여 **단어에 'a'가 포함된 인덱스와 해당 단어**를 쉽게 찾을 수 있습니다.

---

## **📌 결론**

- `enumerate()`는 반복 가능한 객체의 **인덱스와 값을 동시에 처리**할 수 있는 유용한 함수입니다.
- 기본적으로 **인덱스가 0부터 시작**하지만, `start` 매개변수를 통해 시작 인덱스를 조정할 수 있습니다.
- **반복문에서 인덱스와 값을 동시에 사용해야 할 때** 매우 유용하며, 코드의 가독성을 높이는 데 도움이 됩니다.

# 딕셔너리를 이용하여 알파벳을 카운팅하기
```python
def count_letters(text):
    letter_count = {}  # 빈 딕셔너리 생성
    
    for char in text:
        if char.isalpha():  # 알파벳 문자일 경우
            char = char.lower()  # 대소문자 구분 없이 세기 위해 소문자로 변환
            if char in letter_count:
                letter_count[char] += 1  # 해당 알파벳이 이미 딕셔너리에 있으면 개수 증가
            else:
                letter_count[char] = 1  # 해당 알파벳이 처음 등장하면 1로 설정
    
    return letter_count

# 예시 실행
text = "Hello World!"
result = count_letters(text)
print(result)

```
`sorted()` 함수는 딕셔너리에도 사용될 수 있으며, 딕셔너리 자체를 정렬할 수는 없지만, 딕셔너리의 **키** 또는 **값**을 기준으로 정렬된 **리스트**를 반환할 수 있습니다.

### **1. 딕셔너리의 키 기준으로 정렬**

딕셔너리의 키를 기준으로 정렬하고 싶다면 `sorted()` 함수를 사용하여 키를 정렬할 수 있습니다. 기본적으로 `sorted()`는 오름차순으로 정렬됩니다.

#### **예시: 딕셔너리의 키 기준 정렬**
```python
person = {
    'name': 'Alice',
    'age': 30,
    'city': 'New York',
    'job': 'Engineer'
}

sorted_keys = sorted(person)  # 키를 기준으로 오름차순 정렬
print(sorted_keys)  # ['age', 'city', 'job', 'name']
```

- 위 코드에서는 `sorted(person)`을 사용하여 딕셔너리의 **키**를 오름차순으로 정렬합니다.

---

### **2. 딕셔너리의 값 기준으로 정렬**

딕셔너리의 값을 기준으로 정렬하려면 `key` 매개변수를 사용하여 정렬 기준을 설정해야 합니다.

#### **예시: 딕셔너리의 값 기준 정렬**
```python
person = {
    'name': 'Alice',
    'age': 30,
    'city': 'New York',
    'job': 'Engineer'
}

sorted_by_value = sorted(person.items(), key=lambda x: x[1])  # 값을 기준으로 정렬
print(sorted_by_value)  # [('age', 30), ('city', 'New York'), ('job', 'Engineer'), ('name', 'Alice')]
```

- `sorted(person.items(), key=lambda x: x[1])`는 **`items()`** 메서드를 사용해 딕셔너리의 `(key, value)` 튜플을 가져온 후, **값**을 기준으로 정렬합니다.

#### **내림차순 정렬**
```python
sorted_by_value_desc = sorted(person.items(), key=lambda x: x[1], reverse=True)  # 값 내림차순
print(sorted_by_value_desc)  # [('name', 'Alice'), ('job', 'Engineer'), ('age', 30), ('city', 'New York')]
```

- `reverse=True` 옵션을 사용하여 **값 기준 내림차순** 정렬할 수 있습니다.

---

### **3. 딕셔너리의 키와 값 쌍을 다시 딕셔너리로 변환**

정렬된 결과는 **리스트 형태**로 반환되므로, 이를 다시 딕셔너리 형태로 변환할 수 있습니다.

#### **예시: 키 기준 정렬 후 딕셔너리로 변환**
```python
sorted_by_key = sorted(person.items())  # 키 기준 정렬
sorted_dict_by_key = dict(sorted_by_key)  # 정렬된 리스트를 딕셔너리로 변환
print(sorted_dict_by_key)  # {'age': 30, 'city': 'New York', 'job': 'Engineer', 'name': 'Alice'}
```

#### **예시: 값 기준 정렬 후 딕셔너리로 변환**
```python
sorted_by_value = sorted(person.items(), key=lambda x: x[1])  # 값 기준 정렬
sorted_dict_by_value = dict(sorted_by_value)  # 정렬된 리스트를 딕셔너리로 변환
print(sorted_dict_by_value)  # {'age': 30, 'city': 'New York', 'job': 'Engineer', 'name': 'Alice'}
```

---

### **결론**

- **`sorted()`**는 딕셔너리 자체를 정렬할 수 없지만, 딕셔너리의 **키**나 **값**을 기준으로 정렬된 결과를 **리스트로 반환**합니다.
- `key` 매개변수를 사용하여 정렬 기준을 설정할 수 있으며, **내림차순**으로 정렬하려면 `reverse=True`를 사용합니다.
- 정렬된 결과를 다시 딕셔너리로 변환할 수 있습니다.

```python
# 학생에대한 정보
student1 = {}
student1['name'] = '홍길동'
student1['age'] = 20
student1['score'] = {'kor':100,'eng':100,'math':100}

student2 = {}
student2['name'] = '홍길동2'
student2['age'] = 22
student2['score'] = {'kor':100,'eng':100,'math':100}


my_class = [student1, student2]
print(my_class)
```
```python
print( sorted(my_class, key = lambda x:x['age'] ) )   # age 기준으로 오름차순
print( sorted(my_class, key = lambda x: sum(x['score'].values() ) ) )# score 기준 즉 딕셔너리의 값들의 총 합 기준
```
## 리스트 컴프리헨션
```python
[표현식 for 항목 in 반복가능한 객체 if 조건]
```
## 키워드 가변 매개변수
```python
def my_func1(data, epoch, lr, optimizer):
  print(f'data:{data}, epoch:{epoch}, lr:{lr}, optimizer:{optimizer}')

# 1. 함수 호출
my_func1([1,2,3,4],5,0.01,'adam')  # 순서에 맞춰야 함
my_func1(data = [1,2,3,4], epoch = 5,  lr = 0.01, optimizer = 'adam')  # 순서에 맞출 필요가 없음
```
```python
args = {
    'data' : [1,2,3,4],
    'epoch' : 5,
    'lr' : 0.01,
    'optimizer' : 'adam'
}
# unpack으로 함수에 전달
my_func1(**args)
```
```python
def my_func2(data,x,y):
  print(f'data:{data}, x:{x}, y:{y}')
my_func2([1,2,3], 10, 10)
```
```python
args = [
    [1,2,3],
    10,
    10
 ]
 # unpack
my_func2(*args)  #  my_func2([1,2,3], 10, 10)
```
## 반대로 함수에 * ** 를 적용
```python
def my_func3(*args):
  for arg in args:
    print(f'전달된 파라메터는 : {arg}')

my_func3(10,20,30,40,50)
```
```python
def my_func4(**args):
  for key,value in args.items():
    print(f'key:{key},value:{value}')

my_func4(a=1,b=2,c=3)
```
## 가변매개변수와 키워드 가변매개변수를 혼용해서 사용
```python
def my_func5(*items, **details):
  print(f'아이템:{items}')
  for key,value in details.items():
    print(f'key:{key},value:{value}')

my_func5("물풍선",'자석',title = '카트라이더', score = 1524120)
```

## 리스트 컴프리핸
```python
# result = []
# for i in range(5):
#   result.append(i)

result = [  i*5 for i in range(5)  ]

# 결과
print( result )
```
```python
# 조건문 포함
# 참 if 조건
result = [  i for i in range(10) if i % 2 == 0  ]
print(result)
```
```python
result = [  '짝수' if i % 2 == 0 else '홀수' for i in range(10)   ]
print(result)
```
```python
import random
random.randint(1,100)  # 1 부터 99까지의 임의의 숫자 한개
# 1 ~ 99까지의 숫자중에서 난수를 10개 리스트에 담기
[    random.randint(1,100)  for i in range(10)   ]
```
```python
# 문장을 입력받아서..
# 단어단위로 리스트로 분리해서  split()  공백기준
# 리스트에 있는 각 단어의 길이를 리스트에 저장
text = '동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세'
text = text.split()
result = [  len(word)      for word in text    ]
print(f'문자열의 각 단어들은 : {text}')
print(f'각 문자열의 길이는 : {result}')
```
```python
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
flattened = [element for row in matrix for element in row]
print(flattened)
```
```python
[ [ random.randint(1,100) for i in range(2)] for i in range(4)  ]
```
## 정리
- 딕셔너리
- 키워드 가변 매개변수
- 리스트 컴프리핸션
  - 결과를 리스트로
  - 결과를 딕셔너리
```python
sample = [ ('name','홍길동'),('age',20),('score', 95)          ]
{  key:value for key,value in sample    }
```
다음은 `dictionary`, `list`, `tuple`의 차이점을 정리한 표입니다.

| 자료형 | 변경 가능성 (Mutable) | 순서 보장 | 중복 허용 | 주요 특징 |
|--------|----------------|---------|---------|---------|
| `list` | ✅ 변경 가능 | ✅ 순서 유지 | ✅ 중복 가능 | 배열과 유사, 요소 추가/삭제 가능 |
| `tuple` | ❌ 변경 불가 | ✅ 순서 유지 | ✅ 중복 가능 | 리스트와 유사하지만 불변(Immutable) |
| `dict` | ✅ 변경 가능 | ✅ (Python 3.7 이상) | ❌ 키 중복 불가 | 키-값 쌍 저장, 키를 이용한 빠른 검색 가능 |

### 혼합 사용 예제
```python
# 리스트 안에 튜플
list_with_tuple = [(1, 2), (3, 4), (5, 6)]

# 튜플 안에 리스트 (리스트는 변경 가능)
tuple_with_list = ([1, 2], [3, 4], [5, 6])
tuple_with_list[0].append(99)  # 리스트 요소는 변경 가능

# 딕셔너리 안에 리스트와 튜플
dict_with_list_tuple = {
    "numbers": [1, 2, 3],  # 리스트
    "coordinates": (9.0, 8.5)  # 튜플
}

# 리스트 안에 딕셔너리
list_with_dict = [{"name": "Alice"}, {"name": "Bob"}]

# 튜플 안에 딕셔너리 (튜플 요소로 변경 가능한 객체 포함 가능)
tuple_with_dict = ({"key1": "value1"}, {"key2": "value2"})
tuple_with_dict[0]["key1"] = "new_value"  # 변경 가능
```
혼합 사용 시에는 **변경 가능 여부**를 잘 고려해야 합니다. `tuple`은 불변이지만, 내부에 `list`나 `dict`를 포함하면 해당 내부 객체는 변경할 수 있습니다.

C#과 Python에서 **값(value)과 참조(reference)의 차이**를 비교해 보겠습니다.

---

## **1. C#에서 값 타입과 참조 타입**
C#은 **값 타입(Value Type)**과 **참조 타입(Reference Type)**을 명확하게 구분합니다.

### **값 타입 (Value Type)**
- 스택(Stack)에 저장됨
- 변수 간 복사 시, **값 자체가 복사됨 (독립적인 메모리)**
- 변경해도 원본 변수에 영향 없음
- 예: `int`, `float`, `double`, `char`, `bool`, `struct`

```csharp
int a = 10;
int b = a; // 값이 복사됨
b = 20;
Console.WriteLine(a); // 10 (원본 값 유지)
Console.WriteLine(b); // 20
```

### **참조 타입 (Reference Type)**
- 힙(Heap)에 저장됨, 변수는 참조(주소)만 가짐
- 변수 간 복사 시, **주소(참조)가 복사됨 (동일한 객체를 가리킴)**
- 변경하면 원본도 영향을 받음
- 예: `class`, `object`, `string`, `array`

```csharp
class Person { public string Name; }

Person p1 = new Person();
p1.Name = "Alice";

Person p2 = p1; // 참조가 복사됨 (같은 객체를 가리킴)
p2.Name = "Bob";

Console.WriteLine(p1.Name); // Bob (원본도 변경됨)
Console.WriteLine(p2.Name); // Bob
```

---

## **2. Python에서 값과 참조**
Python은 **모든 것이 객체(Object)**이며, 변수는 **객체를 참조(Reference)**합니다.

### **불변 객체 (Immutable)**
- 값을 변경할 수 없음 (새로운 객체를 생성)
- 변수 간 복사 시 **새로운 객체를 생성**
- 예: `int`, `float`, `str`, `tuple`

```python
a = 10
b = a  # 새로운 객체가 생성됨
b = 20
print(a)  # 10 (원본 유지)
print(b)  # 20
```

```python
s1 = "hello"
s2 = s1
s2 = "world"
print(s1)  # "hello" (변경되지 않음)
print(s2)  # "world"
```

### **가변 객체 (Mutable)**
- 내부 값을 변경할 수 있음
- 변수 간 복사 시 **참조만 복사됨 (같은 객체를 가리킴)**
- 예: `list`, `dict`, `set`

```python
lst1 = [1, 2, 3]
lst2 = lst1  # 참조가 복사됨 (같은 리스트를 가리킴)
lst2.append(4)

print(lst1)  # [1, 2, 3, 4] (원본 변경됨)
print(lst2)  # [1, 2, 3, 4]
```

---

## **3. 값과 참조 비교 요약**
| 언어 | 값 타입 (Value Type) | 참조 타입 (Reference Type) |
|------|---------------------|-------------------------|
| C#   | `int`, `float`, `char`, `struct` (스택에 저장, 값 복사) | `class`, `array`, `string` (힙에 저장, 참조 복사) |
| Python | `int`, `float`, `str`, `tuple` (불변, 새로운 객체 할당) | `list`, `dict`, `set` (가변, 참조 복사) |

---

## **4. 값과 참조를 다루는 방법**
### **C#에서 참조를 피하려면 `struct` 사용**
```csharp
struct Point { public int X, Y; }

Point p1 = new Point { X = 1, Y = 2 };
Point p2 = p1; // 값이 복사됨 (독립적)
p2.X = 10;

Console.WriteLine(p1.X); // 1 (원본 유지)
Console.WriteLine(p2.X); // 10
```

### **Python에서 참조를 피하려면 `copy.deepcopy` 사용**
```python
import copy

lst1 = [[1, 2], [3, 4]]
lst2 = copy.deepcopy(lst1)  # 깊은 복사 (새로운 객체 생성)

lst2[0][0] = 99
print(lst1)  # [[1, 2], [3, 4]] (원본 유지)
print(lst2)  # [[99, 2], [3, 4]]
```

---

## **결론**
- **C#은 값 타입과 참조 타입이 명확히 구분됨**
- **Python은 모든 것이 객체지만, 불변(immutable) 객체와 가변(mutable) 객체가 있음**
- **참조를 피하려면 C#은 `struct` 사용, Python은 `copy.deepcopy` 사용**

좋은 질문입니다. Python에서 **모든 객체는 힙(Heap)에 생성되지만, 불변 객체(Immutable Object)와 가변 객체(Mutable Object)를 구분하는 이유**는 **성능, 안정성, 동시성 문제** 때문입니다.  

---

## **1. 불변 객체(Immutable Object)가 필요한 이유**
불변 객체는 **일관성과 안전성**을 보장하기 위해 존재합니다. 만약 모든 객체가 가변 객체라면, 프로그램의 여러 부분에서 동일한 데이터를 공유할 때 **예기치 않은 변경(side effect)이 발생**할 수 있습니다.

### **(1) Hashable → Dictionary, Set의 키로 사용 가능**
불변 객체는 내부 값이 절대 변하지 않기 때문에 **hashable(해시값을 가질 수 있음)** 특성을 가집니다. 이 덕분에 **딕셔너리(dict)의 키나 집합(set)의 요소로 사용**할 수 있습니다.

```python
# 튜플(불변)은 딕셔너리 키로 사용 가능
data = {(1, 2): "좌표값"}
print(data[(1, 2)])  # 좌표값

# 리스트(가변)은 딕셔너리 키로 사용 불가능 (TypeError 발생)
data = {[1, 2]: "좌표값"}  # TypeError: unhashable type: 'list'
```

---

### **(2) 성능 최적화 (Interning, Caching)**
Python은 불변 객체에 대해 **객체 재사용(Interning, Caching)**을 수행합니다.  
즉, 같은 값을 가지는 불변 객체를 **새로 만들지 않고 기존 객체를 재사용**하여 메모리 사용량을 줄이고 성능을 최적화합니다.

```python
a = 100
b = 100
print(a is b)  # True (같은 객체 재사용)

x = "hello"
y = "hello"
print(x is y)  # True (같은 객체 재사용)
```

반면, 가변 객체는 값이 바뀔 수 있으므로 **재사용할 수 없고 매번 새로운 객체를 생성**해야 합니다.

```python
lst1 = [1, 2, 3]
lst2 = [1, 2, 3]
print(lst1 is lst2)  # False (새로운 객체)
```

---

### **(3) 동시성 (Thread-Safety)**
불변 객체는 여러 스레드에서 접근하더라도 **동기화(lock) 없이 안전**하게 사용할 수 있습니다.  
반면, 가변 객체는 여러 스레드에서 접근할 때 **데이터 경쟁(Race Condition)**이 발생할 수 있습니다.

```python
from threading import Thread

global_list = [1, 2, 3]  # 가변 객체

def modify_list():
    global_list.append(4)  # 여러 스레드가 동시에 접근하면 충돌 가능

thread1 = Thread(target=modify_list)
thread2 = Thread(target=modify_list)
thread1.start()
thread2.start()
thread1.join()
thread2.join()

print(global_list)  # 예측 불가능한 결과 발생 가능
```

**불변 객체를 사용하면 이런 문제를 방지할 수 있습니다.**

```python
global_tuple = (1, 2, 3)  # 불변 객체
# 튜플은 변경이 불가능하므로 스레드 충돌 없음
```

---

## **2. 왜 모든 객체를 가변으로 만들지 않았는가?**
모든 객체를 가변으로 만들면 **성능 저하, 데이터 안정성 문제, 동시성 문제**가 발생합니다.  
예를 들어, `int`조차 가변이라면 다음과 같은 문제가 생깁니다.

```python
a = 10
b = a  # 같은 객체를 참조한다고 가정

b += 5  # b의 값이 바뀌면, a도 같이 바뀌는가?
print(a)  # 10이어야 하는데 15가 될 수도 있음 (예측 불가능)
```

즉, 기본 자료형까지 가변으로 만들면 프로그램의 동작이 **비결정적(indeterminate)**이 되어 유지보수가 어려워집니다.

---

## **3. 결론: 불변 vs 가변 객체의 역할**
- **불변 객체 (Immutable)**
  - **값을 안전하게 공유할 때 사용** (e.g., `int`, `str`, `tuple`)
  - **딕셔너리 키, 집합(set) 요소로 사용 가능**
  - **객체 재사용으로 성능 최적화**
  - **스레드 안전(Thread-Safe)**

- **가변 객체 (Mutable)**
  - **내부 값을 수정해야 할 때 사용** (e.g., `list`, `dict`, `set`)
  - **다양한 데이터 조작이 필요할 때 활용**
  - **참조를 공유할 경우 예상치 못한 변경(side effect)이 발생할 수 있음**

👉 **Python이 불변과 가변 객체를 나눈 것은 성능, 안전성, 동시성을 고려한 설계 선택입니다.**

네, 정확합니다.  
Python에서 `a = 100`을 실행하면, `100`이라는 **불변 객체(immutable object)**를 **키(key)로 해서 내부적으로 맵핑**하는 과정이 있습니다.

---

## **1. Python의 메모리 관리: 작은 정수 캐싱 (Small Integer Caching)**
Python에서는 **-5 ~ 256 사이의 정수는 미리 생성해서 캐싱해둡니다.**  
즉, 같은 값을 여러 번 사용할 때 새로운 객체를 만들지 않고 **기존 객체를 재사용**합니다.

```python
a = 100
b = 100

print(a is b)  # True (같은 객체 공유)
```

- `100`이라는 값이 이미 존재하면, `a`와 `b`는 **같은 메모리 주소를 가리키게 됨**  
- 새로운 객체를 만들지 않고, 기존 객체를 **변수 이름에 맵핑**함

이걸 확인하려면 `id()` 함수를 사용하면 됩니다.

```python
print(id(a), id(b))  # 같은 메모리 주소 출력
```

---

## **2. 내부적으로 어떻게 작동하는가?**
Python은 **"Interning"**이라는 기법을 사용하여 **자주 사용하는 값(숫자, 문자열 등)을 딕셔너리(맵)처럼 관리**합니다.  
이 딕셔너리는 Python의 **메모리 풀(Memory Pool) 또는 객체 캐시(Object Cache)** 역할을 합니다.

### **(1) 정수 객체 캐싱**
Python은 -5 ~ 256 범위의 정수를 **미리 만들어서 재사용**합니다.

```python
a = 100  # 이미 캐싱된 100 객체를 참조
b = 100  # 기존 100 객체를 공유 (새 객체를 만들지 않음)

c = 257  # 257은 캐싱 범위를 벗어나므로 새로운 객체를 생성
d = 257  # 새로운 객체를 또 만듦

print(a is b)  # True (같은 객체)
print(c is d)  # False (서로 다른 객체)
```

- `100`은 **미리 저장되어 있으므로, 기존 객체를 재사용** (캐싱)
- `257`은 **캐싱되지 않기 때문에 새로운 객체를 만듦**  

이걸 확인하려면 `sys` 모듈을 사용하면 됩니다.

```python
import sys

print(sys.intern("hello"))  # 문자열도 intern 가능
```

---

### **(2) 문자열 객체 캐싱 (String Interning)**
Python은 **짧고 자주 쓰이는 문자열**도 내부적으로 **맵핑해서 재사용**합니다.

```python
s1 = "hello"
s2 = "hello"

print(s1 is s2)  # True (같은 객체)
```

하지만 **동적으로 생성된 문자열은 기본적으로 캐싱되지 않습니다.**

```python
s3 = "hello world"
s4 = "hello world"

print(s3 is s4)  # False (새로운 객체 생성)
```

이걸 강제로 캐싱하려면 `sys.intern()`을 사용하면 됩니다.

```python
import sys

s5 = sys.intern("hello world")
s6 = sys.intern("hello world")

print(s5 is s6)  # True (같은 객체 공유)
```

---

## **3. 결론: Python은 내부적으로 값을 키로 맵핑하여 객체를 관리한다**
- **Python은 자주 사용하는 값(숫자, 문자열 등)을 내부적으로 맵핑하여 저장**
- **작은 정수(-5 ~ 256)와 일부 문자열을 미리 캐싱해서 객체 재사용**
- **변수를 만들 때마다 새로운 객체를 생성하는 것이 아니라, 기존 객체를 공유할 수도 있음**
- **객체를 캐싱하면 메모리 절약과 성능 최적화가 가능**  

즉, `a = 100`을 실행하면 **100이라는 값을 키로 해서 Python 내부 객체 테이블에서 조회하고, 이미 존재하면 기존 객체를 재사용**하는 방식입니다.






