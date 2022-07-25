# Plan It Share ✈

![4조 ppt 메인](https://user-images.githubusercontent.com/102462534/180437507-2b57d67d-81fe-45cb-a57a-de5a25c38d27.png)
<br>




<br>

#### 💡 프로젝트 주제 : 여행지 추천 및 일정 공유 사이트 
#### 📆 프로젝트 구현기간 : 2022-07-11 ~ 2022-07-22
#### :white_check_mark: 프로젝트 목적  
: 여행하고자하는 지역의 숙소, 관광명소, 음식점의 리뷰와 평점을 확인할 수 있어 이용자가 일정을 계획하는데 도움을 주고자 하였고, 자신의 여행 일정을 만든 뒤 다른 사람들과 일정을 공유할 수 있는 사이트를 구현하고자 함.

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


<br>
<br>

---------

### :sunflower: 주요 기능 구현 화면
> 여행 장소 목록 조회
<br>

![인기제주숙소목록](https://user-images.githubusercontent.com/102462534/180640581-9b298fe4-cb78-4d64-96b9-0b019bb795f7.png)

<br>
<br>

> 여행장소 정보 조회,  리뷰 및 평점 등록
<br>

![숙소상세보기](https://user-images.githubusercontent.com/102462534/180640623-e113e4f4-7674-4f92-a7b8-59e1ca196f47.png)
![댓글](https://user-images.githubusercontent.com/102462534/180640624-5f7aa3c3-054b-4469-bcb4-1f450e3d6cf0.png)

<br>
<br>

> 여행 일정 등록 **(본인이 구현한 파트)**

날짜, 지역 선택 및 일정 제목과 내용 작성  |   여행 장소 추가
:-------------------------:|:-------------------------:
![일정등록1](https://user-images.githubusercontent.com/102462534/180640717-a4ad7a7d-fc93-4337-8f42-7c61e5ea8948.gif) | ![일정등록2](https://user-images.githubusercontent.com/102462534/180640719-2528247f-4895-4058-a362-f8f341943ee1.gif)


<br><br>

> 일정 상세보기, 친구와 일정 공유하기
<br>

![일정상세(일정 정보)](https://user-images.githubusercontent.com/102462534/180640843-462d740d-afd6-4f78-8865-c12fffd2a573.png)
<br>

![일정상세(일차별 장소)](https://user-images.githubusercontent.com/102462534/180640844-4ecf57cd-71fd-4321-8c77-868cfc5bae0f.png)

<br>
<br>

- 마이페이지에서 일정 초대 승인 및 거절

<br>
<br>

![일정초대목록](https://user-images.githubusercontent.com/102462534/180640906-2b0604c6-4252-4496-a56e-6aa4fbc9532d.png)

<br>
<br>

> 지도 API로 일정 경로 확인
<br>

![일정(지도)](https://user-images.githubusercontent.com/102462534/180640850-c18dab1f-563b-43a3-ae35-17eaf5de7b2f.png)

<br>
<br>

--------------

### ✨ 그외 본인이 구현한 파트

> 회원가입, 로그인, 아이디/비밀번호 찾기
<br>

회원가입/로그인            |  아이디/비밀번호 찾기
:-------------------------:|:-------------------------:
![회원가입](https://user-images.githubusercontent.com/102462534/180640971-0912d0f0-8cfa-4134-b62f-99924015e5b8.gif)  | ![아이디비번찾기](https://user-images.githubusercontent.com/102462534/180640965-441f4e7c-f4af-4668-8e2f-f3c0ef6aa3b9.gif)

<br>
<br>


> 탈퇴하기, 관리자 로그인
<br>

탈퇴하기            |  관리자 로그인
:-------------------------:|:-------------------------:
![탈퇴하기](https://user-images.githubusercontent.com/102462534/180641200-147f2458-657d-4114-ab6d-ad64ea80dd2b.gif) | ![관리자로그인](https://user-images.githubusercontent.com/102462534/180641205-f5cb9cf3-03c4-4707-9c49-9561ada1ee1f.gif)

<br>
<br>


> 작성 리뷰, 댓글 조회 및 삭제
<br>
<br>

작성 리뷰, 댓글 조회 및 선택삭제   |  전체 삭제
:-------------------------:|:-------------------------:
![작성리뷰댓글삭제](https://user-images.githubusercontent.com/102462534/180641240-cac44cba-e22e-4e0a-b389-13c40852d8fa.gif) | ![전체삭제](https://user-images.githubusercontent.com/102462534/180641243-95147ba8-184f-4c47-8c6f-f2ab94ca8062.gif)

<br>


------------

### 💬 프로젝트 후기

DB 상태가 동일하지 못해 취합 후 테스트를 할때 추가로 더미데이터 작업을 하느라 시간이 많이 걸렸다. 구현을 들어가기 전 팀원 모두 같은 더미데이터를 나눠 가지고 시작했으면 더욱 편하고 빠르게 테스트를 했을 것 같다. 또한 dao의 변수 명을 미리 통일하지 못했던 점, 매핑 경로를 미리 통일하지 못했던 점, 동일한 서브메뉴를 사용하는 경우 미리 include로 빼놓지 못했던 점 등으로 인해 취합하는데 어려움을 겪었다. Github과 같은 형상관리 툴의 중요성과 필요성을 몸소 깨달았다. 일정 등록을 구현할 때 익숙하지 않은 Ajax의 사용이 많아 어려웠지만 계속 사용하다 보니 익숙해지고 활용을 더욱 잘 할 수 있게 되었다. 지도로 단순히 경로를 확인하는 것뿐만 아니라 직접 지도에서 장소를 선택하면 그 장소를 자동으로 일정에 등록시켜주는 기능 등 다양한 기능들을 생각해보았는데 시간 여건 상 구현하지 못해 아쉬웠다. 지도 API를 더욱 활용할 수 있는 기능들을 따로 추가 구현해보고 싶다. 


