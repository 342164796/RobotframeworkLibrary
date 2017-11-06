*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取短视频分类列表
    [Documentation]    获取短视频分类列表
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    ShortMediaApiShortMediasList_2
    Get Actual Response    ShortMediaApiShortMediasList_2
    ${categryId}    Get Actual Value    ShortMediaApiShortMediasList_2    /short_list/0/id
    ${categryId}    Convert To Integer     ${categryId}
    expect     ${categryId}    >    ${1}
    expect     /short_list/0/title    reg_match    .*    ShortMediaApiShortMediasList_2
    expect     /short_list/0/videos/0/id    >    ${1}    ShortMediaApiShortMediasList_2
    expect     /short_list/0/videos/0/title    reg_match    .*    ShortMediaApiShortMediasList_2
