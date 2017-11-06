*** Settings ***
Resource          Resource.robot

*** Test Cases ***
收藏添加
    [Documentation]    实际添加收藏为终端自己记录，此接口仅发送消息。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    UsercenterApiCollectAdd_1
    Json Struct Compare    UsercenterApiCollectAdd_1
    expect    /success    =    True    UsercenterApiCollectAdd_1
