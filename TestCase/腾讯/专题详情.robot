*** Settings ***
Resource          Resource.robot

*** Test Cases ***
老版本专题详情页面
    [Documentation]    获取老版本专题-动漫 圣诞狂欢专场，返回视频总数
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicDetailpage_1
    Json Struct Compare    MediasApiTopicDetailpage_1
    ${totalstr}    Get Actual Value    MediasApiTopicDetailpage_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}
    expect    /is_new    =    0    MediasApiTopicDetailpage_1

新版横向专题详情页
    [Documentation]    获取新版本横向专题-“聚好看VIP套餐超市”专题详情页，返回参数为专区视频总数
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicDetailpage_1    topicId=118
    ${response}    Get Actual Response    MediasApiTopicDetailpage_1
    #Json Struct Compare    MediasApiTopicDetailpage_1
    ${totalstr}    Get Actual Value    MediasApiTopicDetailpage_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    #校验返回值total是否大于0
    expect    ${totalstr}    >    ${0}
    #校验返回值是否是新版本专题
    expect    /is_new    =    1    MediasApiTopicDetailpage_1
    #校验返回值是否是横向
    expect    /orient    =    0    MediasApiTopicDetailpage_1

新版本纵向专题详情页
    [Documentation]    获取新版本纵向专题-“钢铁侠-一次看个够”专题详情页，返回参数为专区视频总数
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicDetailpage_1    topicId=166
    Json Struct Compare    MediasApiTopicDetailpage_1
    ${totalstr}    Get Actual Value    MediasApiTopicDetailpage_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    #校验返回值total是否大于0
    expect    ${totalstr}    >    ${0}
    #校验返回值是否是新版本专题
    expect    /is_new    =    1    MediasApiTopicDetailpage_1
    #校验返回值是否是纵向
    expect    /orient    =    1    MediasApiTopicDetailpage_1

新专题内推荐指数和描述下发
    [Documentation]    新专题内的推荐指数和描述下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicDetailpage_1    topicId=118
    #Json Struct Compare    MediasApiTopicDetailpage_1
    expect    /rate    reg_match    .*
    expect    /summary    reg_match    .*

老版专题详情页面背景海报下发
    [Documentation]    获取老版本专题背景图
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicDetailpage_1
    Json Struct Compare    MediasApiTopicDetailpage_1
    expect    /background    reg_match    .*    MediasApiTopicDetailpage_1

新版横向专题详情页背景海报下发
    [Documentation]    获取新版本横向专题-“聚好看VIP套餐超市”专题详情页，
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicDetailpage_1    topicId=118
    #Json Struct Compare    MediasApiTopicDetailpage_1    topicId=118
    expect    /background    reg_match    .*    MediasApiTopicDetailpage_1

新版本纵向专题详情页背景海报下发
    [Documentation]    获取新版本纵向专题-“钢铁侠-一次看个够”专题详情页，
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicDetailpage_1    topicId=166
    expect    /background    reg_match    .*    MediasApiTopicDetailpage_1
