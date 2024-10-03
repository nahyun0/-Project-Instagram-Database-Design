# Project-Instagram-Database-Design

과정 ) 
1. ER다이어그램 (데이터베이스 생성 전의 설계도, 논리적인 구조를 표현) 을 그립니다. (사용할 엔티티와 관계를 생각해 그린다)
- User, post, image, hasting , follow 엔티티 생성 

2. 정규화 과정을 통해서 테이블을 분해한다. (3nf, 4nf사용함)
   
 3nf ( 3NF a->b->c의 경우 a->b , b->c 로 나누는 것이다. (" 이행 함수 종속을 제거") USer -> User 와 USer_info table로 분해 ) 
 user_id는 email을 결정하고 email은 user의 정보 결정 ( password, profile_image등을 결정한다) 
 id을 알아도 정보를 수정하기 위해서는 email 인증을 거쳐야 하기 때문에 이러한 방식을 사용

 4nf(다치종속을 제거) :　처음에는 follower_id와 following_id를 모두 포함한 follow 테이블 하나를 생성했다. 한명의 아이디당 한명의 팔로워와 팔로잉을 가지는 것이 아니라 여러명의 팔로워와 팔로잉을 가질 수 있는 다치 종속 
 의 관계이기 때문에 이를 제거했다. (다치종속은 밑에 예시있음)

3. 스키마를 그린다. (데이터베이스의 실제 구현 표현)
4. 쿼리를 준비하고 올바르게 작동하는지 테스트한다. 
5. JDBC로 자바와 SQL 데이터베이스를 연결한다. 
6. API 을 통해서 프론트엔드(reat 사용) 와 데이터를 연결한다. 
( 백엔에서 데베 연결-> 프엔에서 백엔 연결 )

*ER design 
![image](https://github.com/user-attachments/assets/f20eb28e-370d-46f3-982d-d3375fec41c5)

2-> Normalization Process 
정규화 는 중복성을 줄이고 무결성을 높이는 과정 

3/3.5NF)
USer -> User 와 USer_info table로 분해 한다. 
user_id는 email을 결정하고 email은 user의 정보 ( password, profile_image등을 결정한다) 그러므로 3NF을 사용해 table을 분해한다. 
3NF a->b->c의 경우 a->b , b->c 로 나누는 것이다. (" 이행 함수 종속을 제거")
id을 알아도 정보를 수정하기 위해서는 email 인증을 거쳐야 하기 때문에 이러한 방식을 사용한다. 
![image](https://github.com/user-attachments/assets/056cc129-f41d-42e7-8cb9-855f0594747d)


4NF) 
follow -> follower 와 follwing 테이블로 분해 한다. 

4NF는 다치 종속을 없앤다 . 예를 들어 하나의 user_id에 하나의 follower_id와 following_id만 있는 것이 아니라 여러명의 팔로워와 팔로잉 하는 사람이 존재한다. 
ex) user_id     / follower    / following
       a             b              c
                     c              d  이런식으로 a라고 해서 follower에 b만 즉,한명만 존재하는 것은 아니다. 우리는 이럴 때 4nf을 이용해 테이블을 분해.
![image](https://github.com/user-attachments/assets/d65ee046-fa3b-45d8-a486-0676bc1ef6e9)

3-> 스키마 그리기 

![image](https://github.com/user-attachments/assets/e3bf0dc1-3ced-4f51-9a4d-6d3e46c2de5a)

