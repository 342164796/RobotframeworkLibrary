*** Settings ***
Resource          Resource.robot

*** Test Cases ***
电视剧-琅琊榜详情页信息
    [Documentation]    电视剧琅琊榜详情页，类型：电视剧，名称：琅琊榜
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediasApiMedia1674263_1
    Json Struct Compare    MediasApiMedia1674263_1
    expect    /title    reg_match    琅琊榜    MediasApiMedia1674263_1
    expect    /category    reg_match    电视剧    MediasApiMedia1674263_1

电影-木乃伊2详情页信息
    [Documentation]    电影-木乃伊2
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediasApiMedia1674263_1
    path    MediasApiMedia1674263_1    4=1334366
    expect    /title    reg_match    木乃伊2    MediasApiMedia1674263_1
    expect    /category    reg_match    电影    MediasApiMedia1674263_1

综艺-欢乐喜剧人详情页信息
    [Documentation]    综艺-欢乐喜剧人详情页信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediasApiMedia1674263_1
    path    MediasApiMedia1674263_1    4=1373563
    expect    /title    reg_match    欢乐喜剧人    MediasApiMedia1674263_1
    expect    /category    reg_match    综艺    MediasApiMedia1674263_1

动漫-高斯奥特曼详情页信息
    [Documentation]    动漫-高斯奥特曼详情页信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediasApiMedia1674263_1
    path    MediasApiMedia1674263_1    4=411045
    expect    /title    reg_match    高斯奥特曼    MediasApiMedia1674263_1
    expect    /category    reg_match    动漫    MediasApiMedia1674263_1
