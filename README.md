# Plan It Share ✈

![4조 ppt 메인](https://user-images.githubusercontent.com/102462534/180437507-2b57d67d-81fe-45cb-a57a-de5a25c38d27.png)
<br>




<br>

#### 💡 프로젝트 주제 : 여행지 추천 및 일정 공유 사이트 
#### 📆 프로젝트 구현기간 : 2022-07-11 ~ 2022-07-12
#### :white_check_mark: 프로젝트 목적 : 여행하고자하는 지역의 숙소, 관광명소, 음식점의 리뷰와 평점을 확인할 수 있어 이용자가 일정을 계획하는데 도움을 주고자 하였고, 자신의 여행 일정을 만든 뒤 다른 사람들과 일정을 공유할 수 있는 사이트를 구현하고자 함.

<br>
- 이 프로젝트는 여행지 추천 및 일정 공유 사이트를 구현한 웹 사이트 프로젝트입니다.  <br>
- 프로젝트의 참여인원은 강지윤, 안수아, 백서영, 박채은입니다. <br>
- 자세한 요구 분석 내용은 Git에서 관리되는 문서를 통해 확인할 수 있습니다. <br>   


-------

<br>

#### 기술 스택
<img alt="" src ="https://img.shields.io/badge/html5-E34F26.svg?&style=for-the-badge&logo=html5&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/css3-1572B6.svg?&style=for-the-badge&logo=css3&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/JavaScript-F7DF1E.svg?&style=for-the-badge&logo=JavaScript&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/java-2F2625.svg?&style=for-the-badge&logo=coffeescript&logoColor=white"/>
<img alt="" src ="https://img.shields.io/badge/oracle-F80000.svg?&style=for-the-badge&logo=oracle&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/Bootstrap-7952B3.svg?&style=for-the-badge&logo=Bootstrap&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/jquery-0769AD.svg?&style=for-the-badge&logo=jquery&logoColor=white"/>


#### 개발환경
<img alt="" src ="https://img.shields.io/badge/windows-0078D6.svg?&style=for-the-badge&logo=windows&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/VSCode-007ACC.svg?&style=for-the-badge&logo=Visual Studio Code&logoColor=white"/> <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/>


<br>

#### 💻 API
- Kakao Maps API
- OpenWeather API

#### :books: Library
- HighCharts
- cos
- jstl
- lombok
- ojdbc

<br>

---------
### ☁ ERD 구조

![여행사이트 ERD (흰배경)](https://user-images.githubusercontent.com/102462534/180436935-d16af4cb-36b8-42da-974a-409139e4e184.png)

<br>

---------

### :sunflower: 주요 기능  
1. 여행 장소 정보 조회, 리뷰 및 평점 등록
2. 여행 일정 등록 및 지도 API로 일정 경로 확인
3. 여행 일정 공유

--------

### 👩🏻‍💻 역할

|이름|역할|
|-|:-|
|강지윤 🎈|**[메인]** 회원가입 및 로그인, 관리자 로그인, 아이디 찾기, 비밀번호 찾기, 탈퇴하기 <br> **[마이 페이지]** 작성 리뷰 조회 및 삭제, 작성 댓글 조회 및 삭제 <br> **[여행일정]** 여행 일정 등록|
|안수아|**[지역 게시판]** 음식점 목록 조회 및 검색, 음식점 상세페이지(리뷰, 관심등록) <br> **[관리자 페이지]** 여행 장소 관리(조회, 등록, 수정 및 삭제) <br> **[여행일정]** 여행 일정 등록, 일정 상세보기 및 삭제(댓글, 관심등록, 사용자 초대)|
|박채은|**[지역게시판]** 관광명소 목록 조회 및 검색, 관광명소 상세 페이지(리뷰 및 관심 등록) <br> **[관리자페이지]** 통계 조회, 회원 관리 <br> **[여행일정]** 일정 지도 보기|
|백서영|**[메인]** 메인 페이지 <br> **[지역 게시판]** 숙소 목록 조회 및 검색, 숙소 상세 페이지 (리뷰 및 관심 등록) <br> **[마이 페이지]** 내 정보 관리(내 정보 조회 및 수정), 일정 초대 목록|
|변창현|**[지역 게시판]** 지역 일정 목록 조회 <br> **[마이 페이지]** 관심 장소, 관심 일정, 내 일정 조회|
|김시현|**[여행지]** 메인 페이지 <br> **[지역 게시판]** 메인 페이지 <br>**[관리자 페이지]** 추천 여행지 관리(등록 및 삭제), 금칙어 관리(금칙어 및 금칙어 게시물 조회)|

