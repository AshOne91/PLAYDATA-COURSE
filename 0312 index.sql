/*
인덱스
- 테이블의 특정 열(컬럼,속성)에 대해서  검색 속도를 높임 - 목차
    - where, join, order by, group by 실생속도 개선
    - pk는 기본적으로 인덱스 구조가됨
    - 조회 할때 pk를 기준으로 조회하면 속도가 빠르다
*/

explain select * from employees.salaries where salary > 40000
;

-- 인덱스 추가
create index idx_salary on employees.salaries(salary);

explain select * from employees.salaries where salary > 100000;

select 
min( salary) as mininum
,max( salary) as maxinum
from employees.salaries;

explain select * from employees.salaries where salary between 40001 and 70000;
explain select * from employees.salaries force index(idx_salary) where salary > 40000;

select * from employees.employees order by hire_date desc;

create index idx_hire_date on employees.employees(hire_date);
select * from employees.employees force index(idx_hire_date) order by hire_date desc;
select * from employees.employees  order by hire_date desc; -- 0.281 or 0.344

/*
인덱스 사용 시 주의점
너무많은 인덱스 
삽입.삭제.수정 성능 저하
    디스크 공간 증가

카디널리티( Cardinality)
고유값이 적은열 (성별등..)에는 인덱스 효과 가 낮음
    고유값이 많은열에 유리  (pk등)
쿼리
where, join, order by에 사용되는 열 에 추천(recommand)
    인덱스 고유의 값을 회손하는 경우 where upper(name) 등 인덱스 무효화
*/
-- 인덱스 상태 확인
show index from employees.employees;

create index idx_firstname_hiredate on employees.employees(first_name, hire_date);
-- 복합인덱스 순서와 쿼리의 검색 순서가 같아야 효율적이다
-- 서브쿼리 및 다중 조회는 맨처음 실행되는 조회의 결과가 큰데이터에서 검색해서 작은방향으로
-- 즉.. 첫번재 검색 결과가 두번째 검색결과보다 작아야.
select * from employees.employees 
where first_name = 'Parto' and hire_date = '1992-09-27'   -- (firt_name, hire_date)
;

select * from employees.departments; -- 부서테이블

select * from employees.dept_emp;  -- 직원 부서 릴레이션 데이틀

select * from employees.employees;  -- 직원

-- 10001 사람의 부서정보와 기간
select 
ee.emp_no,
ee.first_name,
ee.last_name,
ed.dept_name
from employees.employees ee
inner join employees.dept_emp ede on ee.emp_no = ede.emp_no
    inner join employees.departments ed on ed.dept_no = ede.dept_no 
-- where ee.emp_no = 10001
;    
