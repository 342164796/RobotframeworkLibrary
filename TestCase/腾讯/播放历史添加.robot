*** Settings ***
Resource          Resource.robot

*** Test Cases ***
播放历史添加
    [Documentation]    播放历史添加在终端自己控制，仅向系统端发送消息，kernel接收后发送消息到智能推荐。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    UsercenterApiHistoryAdd_1
    Json Struct Compare    UsercenterApiHistoryAdd_1
    expect    /success    =    True    UsercenterApiHistoryAdd_1
