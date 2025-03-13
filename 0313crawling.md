# 정적 크롤링
```
웹페이지 HTML 소스코드를 직접 가져와서 데이터를 추출
정적웹페이지는 서버에서 미리 준비된 html을 브라우저에
전송, javascript로 동적으로 컨텐츠를 생성하지 않음

페이지 눌렀을때 페이지가 주소가 변한다면 정적 크롤링
동적은 url주소는 동일한데 컨텐츠내용만 변경됨

request : html소스 가져오기
BeatifulSoup : 파싱
조건 : 페이지가 로드될때 모든 데이터가 HTML에 포함
프로그램 실행속도 빠름.. 그러나 페이지 로딩속도는 느림

웹페이지의 크롤링 허용여부 : 웹사이트주소/robots.txt
모두허용
User-agent : *
Allow:/
or
User-agent:*
DisAllow:

모두 접근 금지
User-agent:*
DisAllow:/
```

크롬에서 F12눌러 소스보기
태그를 기반으로 추출
```
연습용 html
<h1 id="title">클롤링 연습</h1><div class="top"><ul
class="menu"><li><a href=http://www.sample.co.kr/member/login.html
class="login">로그인 </a></li></ul><ul class="brand"><li><a href="http://www/. 
sample.co.kr/media/>사이트1<li><a href="http://www.sample.co.kr/
academy/">사이트2</a></li></ul></div>' 
```
# 속성을 이용한 파싱
```
attrs : 속성이름과 속성값의 dict형태
find() : 속성을 이용해서 특정 태그 파
```

어떤 태그를 타있는지 헷갈리면 소스보기->Copy->Copy Selector
