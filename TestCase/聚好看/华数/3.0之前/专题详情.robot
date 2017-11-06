*** Settings ***
Resource          Resource.robot

*** Test Cases ***
老版本专题详情页
    [Documentation]    获取老版本专题-“无疯狂 不动画”专题详情页，返回参数为专题视频总数
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediasApiTopicDetailpage_1
    Json Struct Compare    MediasApiTopicDetailpage_1
    ${totalstr}    Get Actual Value    MediasApiTopicDetailpage_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    #校验返回值total是否大于0
    expect    ${totalstr}    >    ${0}
    #校验返回值是否是新版本专题
    expect    /is_new    =    0    MediasApiTopicDetailpage_1

新版横向专题详情页
    [Documentation]    获取新版本横向专题-“金基德专题”专题详情页，返回参数为专题视频总数
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediasApiTopicDetailpage_1    topicId=116
    Json Struct Compare    MediasApiTopicDetailpage_1
    ${totalstr}    Get Actual Value    MediasApiTopicDetailpage_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    #校验返回值total是否大于0
    expect    ${totalstr}    >    ${0}
    #校验返回值是否是新版本专题
    expect    /is_new    =    1    MediasApiTopicDetailpage_1
    #校验返回值是否是横向
    expect    /orient    =    0    MediasApiTopicDetailpage_1

新版本纵向专题详情页
    [Documentation]    获取新版本纵向专题-“机械雄霸天下”专题详情页，返回参数为专题视频总数
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediasApiTopicDetailpage_1    topicId=110
    Json Struct Compare    MediasApiTopicDetailpage_1
    ${totalstr}    Get Actual Value    MediasApiTopicDetailpage_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    #校验返回值total是否大于0
    expect    ${totalstr}    >    ${0}
    #校验返回值是否是新版本专题
    expect    /is_new    =    1    MediasApiTopicDetailpage_1
    #校验返回值是否是纵向
    expect    /orient    =    1    MediasApiTopicDetailpage_1

配置各种资源的专题详情页
    [Documentation]    获取新版本专题-“自动化测试专题-勿动”专题详情页,该专题内配置资源有VIP专区
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    MediasApiTopicDetailpage_1    topicId=9999
    Get Actual Response    MediasApiTopicDetailpage_1
    ${totalstr}    Get Actual Value    MediasApiTopicDetailpage_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    #校验返回值total是否大于0
    expect    ${totalstr}    >    ${0}
    #校验返回值是否是新版本专题
    expect    /is_new    =    1    MediasApiTopicDetailpage_1
    #校验返回信息中资源是否正确，其中type_code表示添加资源类型，比如1002是视频、1001是分类列表、1007是分类栏目、5006是专区、1004是应用。
    expect    /medias/0/type_code    =    1002    MediasApiTopicDetailpage_1
    expect    /medias/0/category_id    =    1004    MediasApiTopicDetailpage_1
    expect    /medias/1/type_code    =    1002    MediasApiTopicDetailpage_1
    expect    /medias/1/category_id    =    1001    MediasApiTopicDetailpage_1
    expect    /medias/2/type_code    =    1002    MediasApiTopicDetailpage_1
    expect    /medias/2/category_id    =    1002    MediasApiTopicDetailpage_1
    expect    /medias/3/type_code    =    1001    MediasApiTopicDetailpage_1
    expect    /medias/4/type_code    =    1007    MediasApiTopicDetailpage_1
    expect    /medias/5/type_code    =    5006    MediasApiTopicDetailpage_1
    expect    /medias/6/type_code    =    1004    MediasApiTopicDetailpage_1
