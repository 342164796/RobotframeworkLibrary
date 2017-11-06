*** Settings ***
Resource          Resource.robot

*** Test Cases ***
用户提醒下发
    [Documentation]    userprofile接口信息下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    userProfile_1
    Json Struct Compare    userProfile_1
    expect    /definition    reg_match    .*
    expect    /play_error_image    reg_match    .*
    expect    /msg    reg_match    .*
    expect    /no_display_vip    reg_match    .*
