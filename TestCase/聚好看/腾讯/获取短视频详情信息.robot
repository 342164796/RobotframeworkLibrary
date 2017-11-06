*** Settings ***
Resource          Resource.robot

*** Test Cases ***
短视频详情页-腾讯体育集锦
    [Documentation]    体育集锦详情页面信息，id：3
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    ShortMediasDetailpage_1
    Json Struct Compare    ShortMediasDetailpage_1
    expect    /definition    =    21    ShortMediasDetailpage_1
    expect    /id    =    3    ShortMediasDetailpage_1
