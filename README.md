# [Team 3] 여행지 정보 게시판

## 목차
- [프로젝트 소개](#프로젝트-소개)
- [팀 구성 및 역할](#팀-구성-및-역할)
- [벤치마킹](#벤치마킹)
- [개발 환경](#개발-환경)
- [ERD](#erd)
- [주요 기능](#주요-기능)
- [개발 일정](#개발-일정)

---

## 프로젝트 소개
### 주제
- **여행지 정보 게시판 홈페이지**
- 여행 정보를 공유하고 새로운 여행지를 소개하며 사용자 경험을 통해 여행 활성화를 도모합니다.

### 기획 의도
- 국내 여행 활성화 및 정보 공유를 통한 커뮤니티 조성.

---

## 팀 구성 및 역할
| 이름       | 역할      | 주요 담당                 |
|------------|-----------|--------------------------|
| **전은기** | 팀장      | 지역 게시판              |
| **이재원** | 에이스    | 메인, 검색, 자유게시판   |
| **안병현** | 팀원      | 커뮤니티 게시판          |
| **최세현** | 팀원      | 테마 게시판              |

---

## 벤치마킹
### 벤치마킹 대상 사이트
1. **대한민국 구석구석**
   - **장점**: 방대한 여행 정보, 공신력 있는 출처 제공
   - **단점**: 사용자 간 정보 공유 기능 부족
2. **네이버 블로그**
   - **장점**: 높은 접근성 및 커뮤니케이션 기능
   - **단점**: 상업성 리뷰 존재, 악성 댓글 등 개인적 의견 포함

---

## 개발 환경
### Back-End
![JDBC](https://img.shields.io/badge/JDBC-007396?style=for-the-badge&logo=Java&logoColor=white)
![Lombok](https://img.shields.io/badge/Lombok-FFA500?style=for-the-badge&logo=Java&logoColor=white)
![ApacheTomcat](https://img.shields.io/badge/ApacheTomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white)

### Front-End
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)
![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white)

### API Tools
![Ajax](https://img.shields.io/badge/Ajax-FF007F?style=for-the-badge&logo=Ajax&logoColor=white)
![JSON](https://img.shields.io/badge/JSON-000000?style=for-the-badge&logo=JSON&logoColor=white)
![Gson](https://img.shields.io/badge/Gson-FFCA28?style=for-the-badge&logo=Google&logoColor=white)
![KakaoMap API](https://img.shields.io/badge/KakaoMap%20API-FFCD00?style=for-the-badge&logo=Kakao&logoColor=black)

### Tools
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white)
![Sourcetree](https://img.shields.io/badge/Sourcetree-0052CC?style=for-the-badge&logo=Sourcetree&logoColor=white)
![ERD Cloud](https://img.shields.io/badge/ERD%20Cloud-00C4B3?style=for-the-badge&logo=Database&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/VisualStudioCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white)
![Eclipse](https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white)

### OS
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=Windows&logoColor=white)

---

## ERD
![ERD](https://github.com/user-attachments/assets/a50edbb8-e4c0-46ad-97be-a7bcc063bb9f)

---

## 주요 기능

### 1. 메인 및 검색
| 메인 페이지 | 검색 페이지 |
|-------------|-------------|
| ![메인 페이지](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page26_1.jpg) | ![검색 페이지](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page27_1.jpg) |

| 검색 결과 페이지 | 로그인 화면 |
|------------------|-------------|
| ![검색 결과 페이지](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page28_1.jpg) | ![로그인 화면](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page29_1.jpg) |

### 2. 회원 관리
| 회원가입 | 아이디 찾기 |
|----------|-------------|
| ![회원가입](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page30_1.jpg) | ![아이디 찾기](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page31_1.jpg) |

| 비밀번호 변경 | 회원탈퇴 |
|---------------|----------|
| ![비밀번호 변경](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page32_1.jpg) | ![회원탈퇴](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page33_1.jpg) |

### 3. 내 정보 관리
| 내 정보 조회 | 내 게시글 및 댓글 조회 |
|--------------|-------------------------|
| ![내 정보 조회](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page34_1.jpg) | ![내 게시글 및 댓글 조회](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page35_1.jpg) |

### 4. 테마 게시판
| 테마 게시판 조회 | 테마 게시판 작성 |
|-------------------|-------------------|
| ![테마 게시판 조회](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page37_1.jpg) | ![테마 게시판 작성](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page38_1.jpg) |


### 5. 지역 게시판
| 지역 게시판 조회 | 지역 게시판 작성 |
|-------------------|-------------------|
| ![지역 게시판 조회](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page39_1.jpg) | ![지역 게시판 작성](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page42_1.jpg) |


### 6. 커뮤니티 게시판
| 커뮤니티 게시판 조회 | 커뮤니티 게시판 작성 |
|-----------------------|-----------------------|
| ![커뮤니티 게시판 조회](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page44_1.jpg) | ![커뮤니티 게시판 작성](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page46_1.jpg) |


### 7. 자유 게시판
| 자유 게시판 작성 | 자유 게시판 댓글 |
|-------------------|-------------------|
| ![자유 게시판 작성](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page49_1.jpg) | ![자유 게시판 댓글](https://raw.githubusercontent.com/team-lucky7/semiProject/main/StoryBoard/page51_1.jpg)  |

---

## 개발 일정
- **총 개발 기간**: 2024.06.07 ~ 2024.07.30
- **프론트엔드 개발**: 6.08 ~ 6.28
- **백엔드 개발**: 6.29 ~ 7.29
- **테스트 및 배포**: 7.29 ~ 7.30
