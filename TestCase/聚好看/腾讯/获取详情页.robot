*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取电影详情页
    [Documentation]    电影详情页中，参数有题目、类型、标签项（id: "11011943131",category: "电影",title: "狗年"）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiMedia11011943131_1
    Json Struct Compare    MediasApiMedia11011943131_1
    expect    /category    reg_match    电影    MediasApiMedia11011943131_1
    expect    /id    =    11011943131    MediasApiMedia11011943131_1
    expect    /title    reg_match    狗年    MediasApiMedia11011943131_1

电视剧详情页
    [Documentation]    电影详情页中，参数有题目、类型、标签项
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiMedia11011943131_1
    Path    MediasApiMedia11011943131_1    4=11011920112
    Json Struct Compare    MediasApiMedia11011943131_1
    expect    /category    reg_match    电视剧    MediasApiMedia11011943131_1
    expect    /id    =    11011920112    MediasApiMedia11011943131_1
    expect    /title    reg_match    琅琊榜    MediasApiMedia11011943131_1

综艺详情页
    [Documentation]    电影详情页中，参数有题目、类型、标签项
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiMedia11011943131_1
    Path    MediasApiMedia11011943131_1    4=11011917985
    Json Struct Compare    MediasApiMedia11011943131_1
    expect    /category    reg_match    综艺    MediasApiMedia11011943131_1
    expect    /id    =    11011917985    MediasApiMedia11011943131_1
    expect    /title    reg_match    奔跑吧兄弟    MediasApiMedia11011943131_1

动漫详情页
    [Documentation]    电影详情页中，参数有题目、类型、标签项
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiMedia11011943131_1
    Path    MediasApiMedia11011943131_1    4=11011962698
    Json Struct Compare    MediasApiMedia11011943131_1
    expect    /category    reg_match    幼儿    MediasApiMedia11011943131_1
    expect    /id    =    11011962698    MediasApiMedia11011943131_1
    expect    /title    reg_match    熊出没之过年    MediasApiMedia11011943131_1
