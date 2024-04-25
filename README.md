# 문화커넥터

'멀티캠퍼스_문화커넥터_포트폴리오_김진경(1).pptx' 참고

### 프로젝트 기간 

2023.12.15 ~ 2024.1.30 

### 프로젝트 소개 

국내 여행 정보를 제공하는 웹페이지 

### 프로젝트 내용 및 핵심 기능

1. 대상: 국내 여행을 목적으로 관련 여행 정보를 얻고자 하는 모든 사용자

2. 기획 의도: 최근 증가한 국내여행 수요가 증가했으며, 국내 여행을 하고자 하는 사람들은 대부분 인터넷을 통해 관련 정보를 얻으려는 경향이 있다. 
              이에 따라 국내여행 정보를 제공하는 웹 사이트를 제작하기로 하였다.

3. 핵심 기능: 문화 테마, 음식점, 레저, 공연 등의 여행 정보, 커뮤니티, 여행지도 기능 제공 

    

### 사용언어 및 기술 

JAVA 17, MYSQL, MYBATIS, CSS, JAVASCRIPT, LOMBOK, SPRING FRAMEWORK, BOOTSTRAP, JQUERY, TOMCAT, ECLIPSE 등


### OPEN API 

카카오맵 API, 카카오 API, TOUR API 등

### 프로젝트 내 역할  

프론트/백엔드/DB

### 프로젝트 내 구현 기능

1. '문화 테마' 페이지 및 상세페이지 프론트/백엔드 기능 구현(지역별 검색 기능, 검색어 기반 검색, 페이징 기능),

2. 체크박스 검색 기능

3. 카카오맵 api를 이용한 주소지 위치 표시 기능, 카카오 api를 이용한 공유 기능, 카카오 로그인 기능

4. 마이페이지(북마크 기능) 구현


작성 코드:

java/com/multi/mvc/culture/controller/CultureController.java

java/com/multi/mvc/culture/model/mapper/CultureMapper.java

java/com/multi/mvc/culture/model/service/Service/CultureService.java

java/com/multi/mvc/culture/model/vo/Culture.java

java/com/multi/mvc/kakao/service/KakaoService.java

resources/mappers/culture/culture-mappers.xml

webapp/WEB-INF/views/culture/cultureList.jsp

webapp/WEB-INF/views/culture/cultureDetail.jsp

webapp/WEB-INF/views/member/wishList.jsp


### 프로젝트 리뷰 

제가 맡았던 부분은 문화 테마 정보를 제공하는 페이지입니다. 

1. Tour api에서 받아온 데이터를 사용하여, 문화 페이지 내에서 지역별, 검색어 기반 검색이 가능하게 했습니다. 이 과정에서 검색 기능을 어떻게 만드는지 경험할 수 있었습니다. 기본 데이터의 구조 및 상태를 파악한 후 실제 존재하는 데이터를 기반으로 검색 기능을 만들어야 하는 것을 깨달았습니다. 예를 들어 지역별 검색 기능을 만들려면 실제 데이터에 지역 정보가 있어야 합니다. 
                    
2. 체크박스 기능 중, 체크박스를 다중으로 선택하는 기능을 만들기 위해서는 여러 개의 parameter를 받는 객체를 생성하여 프론트 화면에서 다중 선택할 때 서버로 넘어가는 여러 개의 파라미터를 해당 객체로 전달해야 하는 것을 알게 되었습니다. 예를 들어 CultrueParam.java의 types와 typeList 변수를 활용하여 이 기능을 만들 수 있습니다.

3. 프론트 화면에 페이징 기능을 만들었습니다. CultureParam.java, PageInfo.java 에서 화면에 보여줄 페이지 개수와 목록 개수 등을 설정하여 controller에서 특정 숫자를 전달하면 원하는 페이징 설정을 할 수 있습니다.

4. 문화 테마 상세페이지에서 하트 모양을 누르면 북마크 기능이 동작하며, 마이페이지에서 북마크한 문화 테마 정보를 확인할 수 있습니다. mapper에서 회원 테이블과 문화 테마 테이블을 조인합니다. 그리고 로그인한 유저의 데이터에 특정 문화 테마 데이터의 'contentId' 값이 존재하는지 확인하여 만약 존재한다면 해당 데이터를 프론트 화면에 전달합니다.

5. 카카오맵 api를 활용하여 문화 테마 상세페이지 내 해당 정보 주소지를 카카오맵에 표시합니다. 문화 테마 데이터 중 주소 값을 프론트로 전달하여 이 값을 카카오맵에서 제공하는 자바스크립트 코드에 적용합니다. 이를 통해 특정 문화 테마 정보의 상세페이지 클릭 시 각 주소지를 맞게 카카오맵에 표시할 수 있습니다.

6. 카카오 api를 활용하여 공유하기 기능을 사용할 수 있습니다. 카카오 디벨로퍼스 홈페이지에서 개발하고 있는 웹 주소를 등록하고 카카오에서 제공하는 자바스크립트 코드를 사용하여 상세페이지의 정보를 카카오톡에 공유할 수 있습니다.

프로젝트를 통해 느낀점 :

Tour api를 사용하여 여행 정보를 파싱할 때, DB 구조를 어떻게 생성할지에 대한 고민이 있었습니다. 사용하는 데이터 구조가 계층을 가지고 있어서, 하나의 데이터 링크를 파싱하는 것이 아닌 여러 개의 데이터 링크를 원하는 조건을 설정하여 파싱해야 했습니다. 예를 들어 제가 담당했던 문화 테마 데이터는 
문화 테마라는 카테고리에 사진 정보, 관광 정보, 관광지 정보 등의 여러 데이터 테이블이 있었습니다. 이 여러 테이블의 데이터를 하나의 테이블로 파싱해야 하는 작업이 필요했습니다.  같이 프로젝트를 진행한 조원분이 API 파싱 부분을 맡아 이를 해결했는데, 전체 테이블 중 공통된 테이블을 부모 클래스로 작성하고 나머지를 각자의 클래스로 생성하여 상속 관계를 이용해 데이터 파싱을 성공했습니다. 또, 마이페이지 북마크 기능을 만드는 과정에서 회원 테이블과 문화테마 테이블을 조인해야 했는데, 처음에는 각 두 개의 테이블에 서로 참조하는 데이터가 있어야 한다고 생각하여 이 문제를 어떻게 해결해야 할지 고민했습니다. 하지만 두 테이블에서 공유하는 데이터가 없더라도 두 개의 테이블을 연결하는 역할을 하는 새로운 테이블을 생성하여 각각 조인하면 원하는 기능을 구현할 수 있음을 알게 되었습니다. 이처럼 처음에는 어떻게 해결할지 어려움이 있었으나 해결하고자 노력하면 대부분 문제를 모두 해결할 수 있다는 점을 깨달았습니다. 

처음 프로젝트를 기획할 때, 프론트 페이지의 디자인을 구상하는 데 어려움이 있었습니다. 하지만 같이 프로젝트를 진행한 팀원분들과의 소통을 통해 프론트 디자인과 백엔드 및 다른 부분으로 역할을 분담하여 문제를 해결할 수 있었습니다. 

처음 기획했던 만큼 대부분의 기능을 구현할 수 있어서 기뻤습니다. 다만 완료한 기능에서 생각하지 못했던 오류가 발생하여 이를 못 고치고 프로젝트를 마무리 해야했습니다. 프로젝트를 하면서 항상 시간이 부족하다고 느끼는데, 어떻게 하면 시간을 효율적으로 사용할 수 있을까에 대해 고민하는 기간이였습니다.  
