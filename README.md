# 🎞️ POKI
<img width="1920" alt="POKI_Cover" src="https://github.com/TeamPoki/Poki-iOS/assets/117909631/37665232-dac8-4873-aacc-850f7b0ea4e3">

>내가 찍은 인생네컷 사진을 저장하고, 인생네컷 찍을때 포즈잡기 어려울때 도와주는 포토위키 포키! 

>소중한 사람과 찍은 네컷사진 추억을 한번에 저장해보세요.

[앱스토어에서 다운 받기](https://apps.apple.com/kr/app/%ED%8F%AC%ED%82%A4-%EC%9D%B8%EC%83%9D%EB%84%A4%EC%BB%B7-%EC%B6%94%EC%96%B5-%EC%95%A8%EB%B2%94/id6471406389)


## 📱 App Version
| 날짜 | 버전 |
|:--|:--|
| 23.11.06 | `v1.0.0` |
| 23.11.08 | `v1.0.1` |
| 23.11.13 | `v1.0.2` |
| 23.11.16 | `v1.0.3` |

## 담당 역할

### 로그인 
![Simulator Screen Recording - iPhone 14 Pro - 2024-02-06 at 01 37 46](https://github.com/playhong16/Poki-iOS/assets/119715960/aaea2dc2-a3c4-4f4a-bc99-587a85e32175)

- 이메일 및 비밀번호가 일치하지 않은 경우 경고창을 띄워 사용자에게 알립니다.
- 사용자가 비밀번호를 어떻게 입력했는지 확인할 수 있도록 버튼을 제공합니다.
- 로그아웃 후에 사용자가 이메일을 다시 입력하지 않을 수 있도록 이메일 자동 저장 기능을 제공합니다.
- 키보드의 `return` 버튼을 눌렀을 때, 사용자가 다음 입력 창으로 이동할 수 있습니다.
- Firebase의 Authentication 사용하여 이메일 및 비밀번호를 비교하여 검증하고 로그인합니다.

### 회원가입
![Simulator Screen Recording - iPhone 14 Pro - 2024-02-06 at 01 28 14](https://github.com/playhong16/Poki-iOS/assets/119715960/551fe5bc-6aac-407e-bde8-8a307dd5e67c)

- 정규 표현식을 사용하여 사용자가 각 항목 별로 유효한 값을 입력했는지 검증합니다.
- 사용자가 입력한 값이 정상인지 비정상인지를 알리기 위해 입력 창 하단에 텍스트를 사용하여 문구와 컬러를 통해 사용자에게 강조합니다.
- 모든 항목에서 입력받은 문자열이 유효하고 서비스 이용 약관 동의를 하는 경우 `가입하기` 버튼이 활성화 됩니다.
- 키보드의 `return` 버튼을 눌렀을 때, 사용자가 다음 입력 창으로 이동할 수 있습니다.
- 사용자가 비밀번호를 어떻게 입력했는지 확인할 수 있도록 버튼을 제공합니다.
- 회원가입 완료 시 알림창을 통해, 가입이 완료된 것을 사용자에게 알립니다.
  
### 포즈 추천
![Simulator Screen Recording - iPhone 14 Pro - 2024-02-06 at 01 42 41](https://github.com/playhong16/Poki-iOS/assets/119715960/38a2cb28-ac6a-4f56-8060-eb7a5ffafcf0)

- 인원 수 별 포즈 이미지를 랜덤으로 제공합니다.
- `새로고침` 버튼을 누르면, 랜덤으로 다른 이미지를 제공합니다.
- 별 버튼을 눌러, 원하는 포즈를 저장할 수 있습니다.

## 트러블 슈팅
### Kingfisher 라이브러리 적용 과정
[내용 보기](https://playhong16.notion.site/Kingfisher-f5931643088d4773887e084aee9fa022?pvs=4)

### Firestore 문서 ID를 인덱스로 부여하기
[내용 보기](https://playhong16.notion.site/Firestore-ID-7960ab806bd34fab8bded3d5024fb53e?pvs=4)

### Firestore에서 swift 커스텀 타입 사용하기
[내용 보기](https://playhong16.notion.site/Firestore-swift-ec433f8cb0bd46a787f70e0cdf39168f?pvs=4)

### Firestore 관련 메서드 수정 후 테스트 계획서
[내용 보기](https://playhong16.notion.site/Firestore-c6d03921ca4b4605a35a23bc8277d78b?pvs=4)
