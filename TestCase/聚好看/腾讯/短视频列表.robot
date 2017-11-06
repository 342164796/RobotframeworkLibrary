*** Settings ***
Resource          Resource.robot

*** Test Cases ***
短视频列表
    [Documentation]    获取短视频列表，返回参数为视频总数
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    ShortMediasList_1
    Json Struct Compare    ShortMediasList_1
    ${totalstr}    Get Actual Value    ShortMediasList_1    /count
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}

短视频列表海报名称下发
    [Documentation]    获取短视频列表，返回参数为视频总数
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    ShortMediasList_1
    expect    /rows/0/image_icon_url    reg_match    .*
    expect    /rows/0/title    reg_match    .*
