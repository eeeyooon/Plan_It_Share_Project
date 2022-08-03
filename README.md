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
<br>
<br>

## 🖥 주요 개발 내용
<br>

### JSP & 서블릿 - MVC 패턴
“Hello Movie! -영화커뮤니티” 프로젝트를 겪고 나니 훨씬 능숙하게 MVC 패턴의 개발을 할 수 있었습니다. 익숙해지면서 화면과 비지니스 로직을 분리한 MVC 패턴의 장점을 훨씬 더 체감할 수 있었습니다. 기능별 확실히 분리되니 효율적으로 일정 관리를 할 수 있었고, 한 기능에서 이슈가 발생해도 수월하게 찾을 수 있었습니다. 다른 팀원들이 MVC 패턴이 익숙치 않아 어려움을 겪을 때 많은 도움을 줄 수 있어서 굉장히 뿌듯했고, 조금 더 성장했다는 걸 느낄 수 있었습니다.

### Ajax를 사용한 ‘일정 등록’
사이트의 주요기능인 ‘일정등록’의 구현을 위해 Ajax를 사용하였습니다. 사용자가 여행 기간을 입력했을 때 예를 들어 2박 3일인 경우 총 3일의 일정이 필요합니다. 그리고 각 일자별로 장소를 추가할 수 있는데, 사용자가 날짜를 입력했을 때 즉각적으로 3일의 일정 목록이 만들어져야 했습니다. 또한 사용자가 지역분류(주요도시, 행정구역)을 선택하면 해당 분류에 따라 지역 목록이 출력되어야 하고, 또 그 목록해서 여행지를 선택했을 때 해당 여행지의 장소 목록이 출력되어야 했습니다. 그리고 해당 여행지의 장소 목록 역시 장소 분류 - 장소 카테고리 - 해당 카테고리의 장소 목록과 같이 연속적이고 즉각적인 동작이 굉장히 많았기 때문에 Ajax를 사용할 수 밖에 없었습니다. 하단의 구현 화면을 참고하시면 이해에 도움이 될 것입니다.

1. 여행일자 별로 일정을 등록할 수 있는 리스트를 여행일수만큼 추가하기
2. 사용자가 선택한 장소 분류에 따라 해당 장소분류의 카테고리가 출력되고, 사용자가 선택한 카테고리에 따라 해당 하는 장소 목록이 출력됨.
3. 메인 화면에서 스페이스를 누를 시 사용자의 스페이스 리스트가 왼쪽에서 오른쪽으로 노출됩니다.

<br>
<br>

### API 활용
1. OpenWeatherAPI : 사용자가 여행지를 선택하면 해당 여행지의 날씨를 표시해줌.
2. Kakao Map API : 사용자가 일정을 등록하면 해당 일정의 여행지 지도를 출력하고, 사용자가 등록한 일정을 마커로 표시함. 또한 같은 여행일자의 장소끼리 같은 색의 선으로 연결함.
3. 다음 우편번호 API : 관리자가 여행장소를 등록 및 수정할 때 지역을 검색하면 해당 지역의 주소를 가져옴.


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

![지도](https://user-images.githubusercontent.com/102462534/182503219-98620170-105a-465a-8a5f-3757e9122ea3.gif)

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

### 💬 성장 경험
<br>

### 익숙치 않은 Ajax
위에서도 언급했듯이 주요 기능인 ‘일정등록’을 구현하기 위해선 Ajax의 사용이 불가피했습니다. 지난 프로젝트 때 Ajax로 댓글 CRUD를 구현한 것 외에는 자주 써보지 않아서 구현 초반엔 어려움을 많이 겪기도 했습니다. 하지만 일정 등록 페이지 안에서 일어나는 연속적이고 즉각적인 행동들은 구조상 비슷하여 개발 진행을 하면서 금방 익숙하게 사용할 수 있었습니다. Ajax는 여전히 어렵게 느껴지지만 Ajax가 필수적으로 필요하는 경우도 많고, 또한 Ajax를 사용하는 것이 사용자 입장에서 더 자연스럽고 익숙하기 때문에 더 연습을 할 계획입니다.

### 완성도 있는 웹 사이트 구현
“Plan it share” 프로젝트에 앞서 “Hello Movie!” 영화 커뮤니티 프로젝트를 진행하였지만, Hello Moive!는 커뮤니티 기능이 중심인 조금 단순한 사이트였습니다. 플래닛쉐어(Plan it share)는 여행 장소 정보 조회 및 검색, 리뷰 및 평점 등록, 여행 일정 등록, 여행 일정 조회 및 공유 등 다양하고 유기적인 기능들로 더 완성도 있는 웹 사이트였습니다.  개발자로서 하나의 서비스를 구현한 경험은 굉장히 뿌듯하고 즐거운 경험이었습니다.

<br>
