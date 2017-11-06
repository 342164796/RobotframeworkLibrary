*** Settings ***
Resource          Resource.robot

*** Test Cases ***
短视频列表
    [Documentation]    获取短视频列表，返回参数为视频总数
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    ShortMediaApiShortMediasList_1
    Json Struct Compare    ShortMediaApiShortMediasList_1
    ${totalstr}    Get Actual Value    ShortMediaApiShortMediasList_1    /count
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}
