*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取首页热播推荐
    [Documentation]    热播推荐，返回参数有题目和标签项
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30update_1
    expect    /refresh_interval    =    1800    FrontpageApiMasterViews30update_1
    expect    /masterViews/0/index    reg_match    2    FrontpageApiMasterViews30update_1
    expect    /masterViews/0/title    reg_match    热播推荐    FrontpageApiMasterViews30update_1
    expect    /masterViews/0/navigationId    =    2004    FrontpageApiMasterViews30update_1
