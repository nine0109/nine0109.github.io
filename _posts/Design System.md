~~Sketch, Figma, adobeXD와 같은 어플리케이션 저작도구는 Main Object를 디자인 후 Instance를 여러 Case로  복제해서 사용한다. 작업 도구가 발달하기 이전에는 GUI는 주요 키 스크린만을 디자인했으나, 지금은 전체 화면 흐름을 디자인하고 있다. 더욱이 어러한 개발을 가능하게 하는 것은 Atomic design 과 Semantic naming을 사용한 Design system의 사용이다. 
이러한 구조와 체계를 갖춘 개발 방법 기획에서 개발한 Design system을 스위칭할 수도 있다. 하지만 스위칭을 위해 사전에 서로 얼라인을 맞추고 그 틀에서 작업하는것 보다 GUI는 GUI로 새로 시스템을 만드는 일이 더 많다. 

~~텍스트 기반의 프로젝트로 기획단계에서 개발 제약조건(Constraints)으로 정해진 Requiremnets 따르며 스케치 GUI와 설계 문서를 하나로 했다. ~~~~

## Figma Variable

다국어 지원을 위해 Text style와 Figma variable을 사용해언어별 최적화를 했다. Variable에서 Pro사용자는 최대 3개의 Mode를 사용할 수 있다. 
다국어 지원을 위해 Text style와 KO, EN, CN 3개의 Variable Mode를 사용해언어별 최적화를 했다.

![[LG전자_MH21Y_OLED_RemoteControl_Ver.1.30_KO_EN_CN_000125.png]]


Mode에는 상속 개념이 있다. 영역을 특정 Mode로 정의 후 아이템을 모드 위에 올려 놓으면 동영상과 같이 모드를 상속받아 언어가 변경된다.

![](assets/images/LG전자_MH21Y_OLED_RemoteControl_Ver.1.30_KO_EN_CN_000119%201.mp4)
(사전 정의된 모드에 따라 아이템의 언어 변경)

## Figma Plugin: Variables2Sheets 

Figma 에서는 Variables을 Export하는 기능을 제공하고 있지 않다. 일반 사용자가 열람할 수 있는 형식으로 Data Sharing을 제공해서 고객과 직접 소통한다면 수동입력(Manual Input)에 따른 오류와 손실을 제거해 업무 효율성을 극대화 할 수 있다. Figma Plugin에서 V
 Variable을 Export할 수 있는 플러그인을 검새 봤으나 시트 형태를 제공하지 않았아며, JOSN 또한, (ㅇㅇㅇ)


![](assets/images/LG전자_MH21Y_OLED_RemoteControl_Ver.1.30_KO_EN_CN_mov_000136-converted.mp4 )


Variables2Sheets 플러그인을 개발했다. Variables2Sheets는 Figma의 Variable을 Export하거나 임포트하는 플러그인이다.

Figma Variables을 클립보드에 복사 후 시트에 (Ctrl+V; Command+V)로 붙여 넣기하면 Figma Variables를 붙여 넣을 수 있다. 이후 편집한 시트를 다시 Ctrl+C로 클립 보드에 복사 후  Figma Variables의 Paste 탭에 붙여 넣으면 시트에 편집한 Variable을 Figma로 넣을 수 있다. 
(다르게 말하면 시트와 Figma 사이를 Ctrl+C &  Ctrl+V로 데이터를 넣고 빼고 하는 것이다. )

Export한 Figma 데이터를 엑셀 등의 파일로 고객사에 전달 후 고객사에 편집한 다국어 스트링 문서를 임포트하면 한번에 문서 전체를 고객사에서 수정한 스트링으로 업데이트 할 수 있다.  👍

Figma Variables은 CSV와 JSON 파일로 Export 하거나 Import 할 수도 있다.

동영상

동영상 예시의 경우 편집한 데이터를 Import 후 Figma Variable은 업데이트 되었으나, 많은 데이터 변경으로 화면에 업데이트에 조금 시간이 걸리는 것을 볼 수 있다. 

 UX 문서와 GUI를 일원한 것 뿐만 아니라 3가지 언어의 인터랙션을 한 화면에 표현 해 열람하는 사람의 모국어를 기준으로 다른 언어에서의 상태를 판단하고 이해할 수 있게 했다. 이를 통해 언어별 글자 수 길이와 크기 등을 더 쉽게 가늠하고 어떤 차이가 발생할 수 있는지를 알 수 있었다.
 ![[LG전자_MH21Y_OLED_RemoteControl_Ver.1.30_KO_EN_CN_mov_000140.png| 언어별 글자 크기와 글자를 비교하며 흐름을 열람]]
 

 

Text style은 H1~H4와 Body로 정의하였으며, 이는 이후 Glyphs Find&Replace에서의 분류로 사용했다.







**Phase1** 24년 상반기에 Figma Components를 구조화한 디자인 시스템을 사용해 한국어로 UX와 GUI를 하나의 문서로 만들고, Export 관리를 통해 설계에서 디자인 자원관리를 하나로 통합다. 이후 파일 포맷 변경과 도트작업으로 이미지 품질을 개선다.

Variable 

**Phase2** 25년 상반기에 영어, 중국어를 지원하는 다국어 프로젝트를 진행했습니다. Assets 파일명을 유지하면서 변경된 언어로 자원을 전달하는 것이 주요 목표였습니다. 다국어 지원 시에도 인터랙션 흐름은 모두 동일하나, 언어 길이의 특성에 따라 스크롤 양이 달라지게 됩니다. 또한 글자 크기가 달라질 수 있습니다.

Phase 1에서 개발한 문서를 활용해 한국어, 영어, 중국어를 한 화면에 정의함으로써 검수 시 맥락 파악에 도움을 주고자 했습니다. 또한 이 작업은 다국어 지원을 위한 UX Sketch 작업에도 큰 도움이 되었습니다.

AI를 활용하여 마치 여러 부분에서 개발팀에 도움을 받아 작업한 것과 같은 효과를 얻을 수 있었습니다. Figma의 Variable을 Export & Import할 수 있는 플러그인을 개발해 스트링 문서를 일원화했으며, PNG에서 BMP로 변환 시 품질을 개선했습니다. 이후 도트 작업 시 이미지를 찾고 변경하는 도구와 작업에 필요한 전용 기능들을 개발해 사용했는데, 이는 마치 개발팀과 실시간으로 협업하는 기분이 들게 했습니다.
