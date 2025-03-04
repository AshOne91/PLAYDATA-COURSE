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

 
