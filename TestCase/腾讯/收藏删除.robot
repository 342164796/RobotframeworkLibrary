*** Settings ***
Resource          Resource.robot

*** Test Cases ***
取消收藏
    [Documentation]    实际操作为终端自己记录，此接口仅发送消息。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    UsercenterApiCollectDelete_1
    Json Struct Compare    UsercenterApiCollectDelete_1
    expect    /success    =    True    UsercenterApiCollectDelete_1
