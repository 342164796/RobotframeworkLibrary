*** Settings ***
Resource          Resource.robot

*** Test Cases ***
短视频分类信息下发
    [Documentation]    新增短视频分类接口，校验接口内部分字段。
    [Tags]    Urgent
    Load    ${VOD_DIR}/tecent/
    req    shortMediacategory
    expect    /short_list/0/title    reg_match    优朋幼儿    shortMediacategory
    expect    /short_list/0/id    =    4    shortMediacategory
    expect    /short_list/1/id    =    1    shortMediacategory
    expect    /short_list/1/title    reg_match    腾讯真人秀集锦    shortMediacategory
