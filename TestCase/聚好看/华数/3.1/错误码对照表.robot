*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取错误码对照表
    [Documentation]    获取专题列表，启动应用时获取。
    [Tags]    urgent
    [Template]
    load    ${VOD_DIR}/wasu/
    req    ErrormsgApiErrormap_1
    expect    /errcode/0/id    reg_match    .*    ErrormsgApiErrormap_1
    expect    /errcode/0/description    reg_match    .*    ErrormsgApiErrormap_1
