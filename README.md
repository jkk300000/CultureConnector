# 문화커넥터
프로젝트 기간: 2023.12.15 ~ 2024.1.30 

프로젝트 소개: 국내여행 정보를 제공하는 웹페이지 

프로젝트 내용 및 핵심기능:

    1. 대상: 국내여행을 목적으로 관련 여행 정보를 얻고자 하는 모든 사용자

    2. 기획의도: 최근 증가한 국내여행 수요가 증가했으며, 국내 여행을 하고자 하는 사람들은 대부분 인터넷을 통해 관련 정보를 얻으려는 경향이 있다. 이에 따라 국내여행 정보를 제공하는 웹 사이트를 제작하기로 결정하였다.

    3. 핵심 기능: 문화테마, 음식점, 레져, 공연 등의 여행 정보, 커뮤니티, 여행지도 기능 제공 

사용언어 및 기술: JAVA 17, MYSQL, MYBATIS, CSS, JAVASCRIPT, LOMBOK, SPRING FRAMEWORK, BOOTSTRAP, JQUERY, TOMCAT, ECLIPSE 등

프로젝트 내 역할: 
                  프론트/백엔드/DB

프로젝트 내 구현 기능:
                  1.'문화테마' 페이지 및 상세페이지 프론트/백엔드 기능 구현, 
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
                    
                    resources/webapp/WEB-INF/views/culture/cultureList.jsp
                    
                    resources/webapp/WEB-INF/views/culture/cultureDetail.jsp
                    
                    resources/webapp/WEB-INF/views/member/wishList.jsp
