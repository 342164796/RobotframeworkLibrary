*** Settings ***
Resource          Resource.robot
Library           HttpLibrary.HTTP

*** Test Cases ***
新UI首页
    [Documentation]    获取新UI首页-以栏目形式展现
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    FrontpageApiMasterViews32_1    version=99.999.999
    Path    FrontpageApiMasterViews32_1    3=master_views3_999
    expect    /model_id    =    999    FrontpageApiMasterViews32_1
    expect    /re_num    =    5    FrontpageApiMasterViews32_1
    expect    /masterViews/0/navigationId    =    2004    FrontpageApiMasterViews32_1

旧UI首页
    [Documentation]    获取老首页-按照模板展现
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    FrontpageApiMasterViews32_1    version=00.000.000
    Path    FrontpageApiMasterViews32_1    3=master_views
    expect    /masterViews/0/title    =    首页    FrontpageApiMasterViews32_1
    expect    /masterViews/0/tiles/0/index    =    1    FrontpageApiMasterViews32_1
    expect    /masterViews/0/tiles/1/index    =    2    FrontpageApiMasterViews32_1

lanucher访问
    [Documentation]    lanucher访问聚好看华数环境老首页数据展现
    Create HTTP Context    api.wasuvod.hismarttv.com
    HttpLibrary.HTTP.GET    /frontpage/api/launcher?featurecode=861003009000023000000604&partnercode=vod
    ${response}    Get Response Body
    Json Value Should Equal    ${response}    /objectInfos/0/posNum    "1"

新UI首页定时刷新
    [Documentation]    获取新UI首页定时刷新
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    FrontpageApiMasterViewsUpdate
    path    FrontpageApiMasterViewsUpdate    4=master_views3_999_HISENSE_update
    expect    /md5    reg_match    .*    FrontpageApiMasterViewsUpdate
    expect    /masterViews/0/navigationId    =    2004    FrontpageApiMasterViewsUpdate
    expect    /refresh_interval    =    3600    FrontpageApiMasterViewsUpdate
    expect    /masterViews/0/index    =    1    FrontpageApiMasterViewsUpdate
    expect    /masterViews/0/tiles/0/facets/0/typeCode    =    1004    FrontpageApiMasterViewsUpdate
