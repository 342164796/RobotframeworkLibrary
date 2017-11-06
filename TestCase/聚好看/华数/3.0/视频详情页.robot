*** Settings ***
Resource          Resource.robot

*** Test Cases ***
电视剧琅-琊榜详情页信息
    [Documentation]    电视剧-琅琊榜详情页，类型：电视剧，名称：琅琊榜
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediaApiMedia3.0_1
    Get Actual Response    MediaApiMedia3.0_1
    expect    /title    reg_match    琅琊榜    MediaApiMedia3.0_1
    expect    /category    reg_match    电视剧    MediaApiMedia3.0_1
    ${series_1}    Get Actual Value    MediaApiMedia3.0_1    /videos/0/series
    expect    ${series_1}    >    ${0}
    req    MediaApiMedia3.0_1
    path    MediaApiMedia3.0_1    4=1674263_0_2
    Get Actual Response    MediaApiMedia3.0_1
    ${series_31}    Get Actual Value    MediaApiMedia3.0_1    /videos/0/series
    expect    ${series_31}    >    ${0}

电影-木乃伊2详情页信息
    [Documentation]    电影-木乃伊2
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediaApiMedia3.0_1
    path    MediaApiMedia3.0_1    4=1334366_0_1
    expect    /title    reg_match    木乃伊2    MediaApiMedia3.0_1
    expect    /category    reg_match    电影    MediaApiMedia3.0_1

综艺-欢乐喜剧人详情页信息
    [Documentation]    综艺-欢乐喜剧人详情页信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediaApiMedia3.0_1
    path    MediaApiMedia3.0_1    4=1373563_0_1
    expect    /title    reg_match    欢乐喜剧人    MediaApiMedia3.0_1
    expect    /category    reg_match    综艺    MediaApiMedia3.0_1

动漫-高斯奥特曼详情页信息
    [Documentation]    动漫-高斯奥特曼详情页信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediaApiMedia3.0_1
    path    MediaApiMedia3.0_1    4=411045_0_1
    expect    /title    reg_match    高斯奥特曼    MediaApiMedia3.0_1
    expect    /category    reg_match    动漫    MediaApiMedia3.0_1
