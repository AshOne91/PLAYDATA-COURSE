# Purpose of Using Functions
1. Code Reusability
2. Improved Readability
```python
# 간단한 계산기 만들기
#def 함수명([매개변수]):
#    로직
#    [return 값]
def calculator(a, b, op):
  if op == '+':
    return a + b
  elif op == '-':
    return a - b
  elif op == '*':
    return a * b
  elif op == '/':
    return a / b
  else:
    return None

x, y, op = 10, 5, '+'
print(calculator(x, y, op))

# 주어진 문장을(영어) 모두 소문자로 반환하는 함수
def to_lower(sentence, option)
  if option == 0:
    return sentence.lower()
  elif option == 1:
    return sentence.upper()
  else:
    print( '잘못된 옵션입니다.')
    return sentence

text = "Hello My Python"
to_lower(text, 0)
```
```python
# 사용자로부터 데이터를 입력받아서
# 문자열...중에 특수문자는 제거

# 문자열의 단어를 분리해서.. 단어의 개수를 센다

# 출력은 단어의 개수중에 빈도수가 높은 상위 3개만 출력

# 필요한 라이브러리 install
!pip install konlpy
from konlpy.tag import Okt # 한글 형태소 분석기 import 공구상자에서 도구를 꺼내온다
from collections import Counter  # Corrected import

filepath = 'sample.txt'
with open(filepath, 'r', encoding='utf-8') as f:
  text = f.read()

# 단어 분리하기 Okt를 이용
# Okt 객체 생성 Okt라는 클래스(사용자 정의 데이터 타입)의 변수
okt = Okt()  # Initialize the Okt() object
nouns_text = okt.nouns(text) # 단어분리

# 단어의 빈도수를 계산(dictionary를 이용 또는 라이브러리)
from collections import Counter
count = Counter(nouns_text) # 리스트의 있는 단어들의 빈도수를 계산

print(count.most_common(3))
```
In Python, Counter (from the collections module) is used to count occurrences of elements in an iterable. When printed, it displays elements as keys and their counts as values in a dictionary-like format.
```python
def getData(filepath)
  # 데이터 가져오기(파일로부터)
  with open(filepath, 'r', encoding = 'utf-8') as f:
      text = f.read()
  return text
# 단어(명사) 분리해서 빈도수 계산하기
def preprocessing(text):
  okt = Okt()
  nouns_text = okt.nouns(text)

  from collections import Counter
  count = Counter(nouns_text)
  return count
#  빈도수 상위 n개를 출력
def showTopN(count, n):
  # most_common --> [('문장1', 10),('문장2',5),('문장3',2)]
  # 단어의 길이가 1개인 단어는제외 즉. 길이가 2이상인 단어들만
  for word, _ in count.most_common(n):
    if len(word) < 2:  #문장의 길이가 2 미만 즉 1개일때
      del count[word]  # 집합에서 해당 문자열해당하는 데이터를 삭제
  print(count.most_common(n))
# 1. 데이터 확보
data = getData('temp.txt')
# 2. 데이터 처리(명사추출)
count = preprocessing(data)
# 3. 원하는 top n 만큼 출력
showTopN(count, 30)
```
함수 작성법
기본 형태 매개변수 하나와 리턴값 하나
print(함수명('철수')) --> '안녕 철수'
```python
def greet(name):
    return f'안녕 {name}'

# Example usage
print(greet('철수'))
```
```python
# 함수를 설계할때 사용하는 변수는 argument
# 함수를 호출할때 전달하는 변수를 parameter
# 현장에서는 주로 파라매터라는 단어로 통합

def introduction(name, age):
  return f'이름 : {name} 나이:{age}'
print(intruduction('철수', 20))
print(introduction('영희'))
```
## 기본 매개변수 (Default Argument)

### 설명:
- 기본 매개변수는 **생략이 가능**한 매개변수입니다. 
- **생략 가능한 위치**에서만 사용할 수 있습니다. 즉, **포지셔널 인자** 뒤에만 기본값을 설정할 수 있습니다.

### 기본 매개변수 규칙:
1. **선택적 매개변수** → 인자를 생략할 수 있습니다.
2. **포지셔널 인자 뒤에만** 기본값을 설정할 수 있습니다.

### 예시 코드:

```python
def introduction(name='홍길동', age=10):  # 기본값 설정
    return f'이름: {name} 나이: {age}'

print(introduction())          # 기본값 사용
print(introduction('철수'))     # 기본 나이(10)를 사용
print(introduction('영희', 20)) # 기본값을 모두 덮어씀
```
Positional arguments are matched to parameters in the order they are provided in the function call.

# 가변 매개변수
- 매개변수의 갯수가 정해지지 않음
```python
def sum_number(lists)
  return sum(lists)

sample_lists = [100]

print(sum_number(sample_lists))
```
What are variable-length parameters (Var-args) in Python?
In Python, variable-length parameters allow you to pass a variable number of arguments to a function. There are two types of variable-length parameters:
*args (Non-keyword arguments) -> tuple
**kwargs (Keyword arguments) -> dictionary
```python
def print_details(name, *hobbies, **additional_info):
    print(f'Name: {name}')
    print(f'Hobbies: {", ".join(hobbies)}')
    for key, value in additional_info.items():
        print(f'{key}: {value}')

# Passing positional and keyword arguments
print_details('Chulsoo', 'Reading', 'Swimming', age=25, city='Seoul')
```
Explanation:
*hobbies collects the positional arguments ('Reading', 'Swimming').
**additional_info collects the keyword arguments (age=25, city='Seoul').
The function prints both the positional and keyword arguments.

# What are Packing and Unpacking in Python?
packing
패킹해서 받겠다.
```python
def pack_values(*args):
    return args  # 'args' will be a tuple containing all passed values

# Packing values into a tuple
packed = pack_values(1, 2, 3, 4)
print(packed)  # Output: (1, 2, 3, 4)
```
unpacking
풀어서 전달하겠다.
```python
def greet(name, age):
    return f'Hello, {name}! You are {age} years old.'

# Packing arguments into a tuple
args = ('Chulsoo', 25)

# Unpacking the tuple when calling the function
print(greet(*args))  # Output: Hello, Chulsoo! You are 25 years old.
```
```python
def sample_fun1(*args): # 여러개의 전달값을 한개의 매개변수로 받음
  for arg in args:
    print(f'전달한 매개변수는: [arg]', end = ' ' )

sample_fun1( 10, '안녕하세요')

# 한개의 전달값을 여러개의 매개변수로 받음 - unpacking
def sample1_fun2_unpack(a,b,c,d):
  print(a, b, c, d)

send_data = 10, 20, '안녕하세요', 40
sample1_fun2_unpack(*send_data)
```
Is it possible to use packing and unpacking simultaneously in Python?
```python
def greet(name, age, city):
    return f'Hello, {name}! You are {age} years old and live in {city}.'

# Packing arguments into a tuple
args = ('Chulsoo', 25, 'Seoul')

# Unpacking the tuple when calling the function
print(greet(*args))  # Output: Hello, Chulsoo! You are 25 years old and live in Seoul.
```
keyword variable parameters
```python
def show_person_details(name, age, **additional_info):
    print(f'Name: {name}')
    print(f'Age: {age}')
    for key, value in additional_info.items():
        print(f'{key}: {value}')

# Calling the function with variable keyword arguments
show_person_details('John', 30, city='New York', job='Engineer', hobby='Cycling')
```
```python
# 함수설계할때  *args  라고 하면 함수를 호출하는 쪽에서는 값을 나열하면 된다.
# 데이터전달형태 :  1,2,3,4,5,6

# 함수설계할때  **kwargs  라고 하면 함수를 호출하는 쪽에서는 값을 나열하면 된다.
# 데이터전달형태 :  name='홍길동', age=20

# def introduction(name = '홍길동', age = 10):  # positional argument
def introduction(**kwargs):  # keyward variable argument
  return f"이름 : { kwargs['name']} /  나이:{kwargs['age'] }"

introduction(name='홍길동', age=20)

# unpacking을 좀더 많이 사용..  ***
def introduction(name = '홍길동', age = 10):  # positional argument
  return f"이름 : {name} 나이:{age}"

send_data = {'name':'홍길동', 'age':20}
introduction(**send_data)
```
# 여러개의 값을 반환하기
```python
# 값을 전달받아서 총합과 평균을 반환
def sum_avg(lists):
  return sum(lists), sum(lists)/len(lists)

import random
data = random.sample(range(1,101), 10)  # 1 ~ 100
print(f'data : {data}')
total, avg = sum_avg(data)
print(f'총합 : {total}, 평균 : {avg}')
```
다음은 요청하신 내용을 정리하고 첨삭하여 마크다운 형식으로 작성한 것입니다:

```markdown
# 함수 사용법 정리

## 1. 함수의 정의 및 사용 방법
함수는 특정 작업을 수행하는 코드 블록입니다. 함수는 `def` 키워드를 사용하여 정의하고, 필요할 때 호출하여 사용할 수 있습니다.

```python
def greeting(name):
    return f"안녕, {name}!"

print(greeting("철수"))  # 출력: 안녕, 철수!
```

## 2. 매개변수의 정의 및 종류

### 2-1. Positional Argument (기본 사용법)
- **정해진 갯수**와 **정해진 위치**에서 값을 전달받습니다.
- 호출할 때 매개변수 이름 대신 순서대로 값을 전달해야 하며, 순서를 바꾸면 오류가 발생할 수 있습니다.

```python
def greet(name, age):
    return f"이름: {name}, 나이: {age}"

print(greet("철수", 20))  # 출력: 이름: 철수, 나이: 20
```

- `매개변수 이름=값` 형식으로 호출하면 **순서를 바꿔서 호출할 수 있습니다.**

```python
print(greet(age=20, name="철수"))  # 출력: 이름: 철수, 나이: 20
```

### 2-2. Default Argument (기본값을 가진 매개변수)
- 매개변수에 기본값이 정해져 있는 경우, 호출할 때 해당 매개변수의 값을 생략하면 기본값을 사용합니다.
- 기본값을 가진 매개변수는 **positional argument 뒤에** 위치해야 합니다.

```python
def greet(name, age=10):
    return f"이름: {name}, 나이: {age}"

print(greet("철수"))  # 출력: 이름: 철수, 나이: 10
print(greet("영희", 25))  # 출력: 이름: 영희, 나이: 25
```

### 2-3. 가변 매개변수 (Variable Arguments)
- **`*args`**를 사용하면 전달하는 매개변수들이 **튜플** 형태로 묶여서 전달됩니다. 
- **packing**: 여러 값을 하나로 묶어 처리하는 방식입니다.

```python
def add_numbers(*args):
    return sum(args)

print(add_numbers(1, 2, 3, 4))  # 출력: 10
```

- **Unpacking**: 매개변수를 미리 튜플로 묶어서 전달할 때 `*`를 붙여 전달합니다.

```python
numbers = (1, 2, 3, 4)
print(add_numbers(*numbers))  # 출력: 10
```

### 2-4. 키워드 가변 매개변수 (Keyword Variable Arguments)
- **`**kwargs`**를 사용하면 전달하는 매개변수들이 **딕셔너리** 형태로 묶여서 전달됩니다.
- 키워드 매개변수를 사용할 때 주로 사용됩니다.

```python
def display_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

display_info(name="철수", age=20, city="서울")
# 출력:
# name: 철수
# age: 20
# city: 서울
```

## 3. 결론
- 함수의 매개변수는 **Positional Argument**, **Default Argument**, **가변 매개변수(`*args`)**, **키워드 가변 매개변수(`**kwargs`)** 등 여러 가지 종류가 있으며, 이를 적절하게 활용하면 코드의 유연성과 가독성을 높일 수 있습니다.
```

### 설명:
- **1. 함수 정의 및 사용법**: 간단한 함수 정의 예시와 사용법을 설명합니다.
- **2. 매개변수 종류**: 각 종류의 매개변수(포지셔널, 기본값, 가변, 키워드 가변 매개변수)를 설명하고 예시를 추가했습니다.
- **정리**: 함수를 설계할 때 매개변수의 역할과 사용법을 명확히 이해하는 것이 중요합니다.
```
재귀함수
파일탐색
```python
import os

def find_file(directory, target_filename):
    """Recursively searches for a file in the given directory."""
    for entry in os.scandir(directory):
        if entry.is_file() and entry.name == target_filename:
            print(f"Found: {entry.path}")
        elif entry.is_dir():
            find_file(entry.path, target_filename)  # Recursive call

# Example usage
find_file("/path/to/search", "target.txt")
```
## 람다함수
In Python, lambda functions (also called anonymous functions) are concise, one-line functions that do not require a def keyword. They are particularly useful for short, throwaway functions used in places where defining a full function is unnecessary.
```python
file_lists = ['data.txt', 'music.mp3']
def findExtention(filepath):
  return filepath.split('.')[-1]

list(map(findExtention, file_lists))
```
```python
# lambda filepath: filepath.split('.')[-1]
list(map(lambda filepath: filepath.split('.')[0], file_lists))
```
```python
myFun = lambda filepath: filepath.split('.')[0]
print(myFun("abc.test"))
```






 
