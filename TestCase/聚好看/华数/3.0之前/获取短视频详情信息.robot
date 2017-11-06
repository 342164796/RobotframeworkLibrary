*** Settings ***
Resource          Resource.robot

*** Test Cases ***
文字类型短视频详情页
    [Documentation]    文字类型短视频--体育集锦详情页面信息，id：3
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    ShortMediaApiShortMediasDetailpage_1
    Json Struct Compare    ShortMediaApiShortMediasDetailpage_1
    expect    /id    =    3    ShortMediaApiShortMediasDetailpage_1
    expect    /videos/0/title    reg_match    .*    ShortMediaApiShortMediasDetailpage_1
    expect    /relateShortMeidas/0/title    reg_match    .*    ShortMediaApiShortMediasDetailpage_1
    expect    /type    =    0    ShortMediaApiShortMediasDetailpage_1

海报类型短视频详情页
    [Documentation]    海报类型短视频--预告片集锦详情页面信息，id：3
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    ShortMediaApiShortMediasDetailpage_1    id=5
    Json Struct Compare    ShortMediaApiShortMediasDetailpage_1
    expect    /id    =    5    ShortMediaApiShortMediasDetailpage_1
    expect    /videos/0/title    reg_match    .*    ShortMediaApiShortMediasDetailpage_1
    expect    /relateShortMeidas/0/title    reg_match    .*    ShortMediaApiShortMediasDetailpage_1
    expect    /type    =    1    ShortMediaApiShortMediasDetailpage_1
