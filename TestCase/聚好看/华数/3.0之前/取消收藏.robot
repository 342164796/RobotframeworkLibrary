*** Settings ***
Resource          Resource.robot

*** Test Cases ***
取消收藏
    [Documentation]    实际操作在终端自己控制，仅向系统端发送消息，该接口3.0后终端不再请求
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    UsercenterApiCollectDelete_1
    Json Struct Compare    UsercenterApiCollectDelete_1
    expect    /success    =    True    UsercenterApiCollectDelete_1
