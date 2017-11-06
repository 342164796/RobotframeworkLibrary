*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取首页
    [Documentation]    首页，返回参数：版本号、标签项信息
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    expect    /model_id    =    0    FrontpageApiMasterViews30_1
    expect    /version    =    3.0    FrontpageApiMasterViews30_1
    expect    /re_num    =    1    FrontpageApiMasterViews30_1

合作方ID下发
    [Documentation]    合作方ID下发，比较venders里面数据
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    expect    /venders/1002/name    reg_match    爱奇艺    FrontpageApiMasterViews30_1
    expect    /venders/1011/name    reg_match    腾讯    FrontpageApiMasterViews30_1

专题背景小海报URL下发
    [Documentation]    专题背景海报URL下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    expect    /topic_image    reg_match    http://api.txvod.hismarttv.com/images/topic    FrontpageApiMasterViews30_1

启动图片下发
    [Documentation]    启动图片下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    expect    /startup_bg/startup_url    reg_match    .*

首页牌照方logo下发
    [Documentation]    首页牌照方logo下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    expect    /startup_bg/license_url    reg_match    .*

搜索页面图片下发
    [Documentation]    搜索页面图片下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    expect    /startup_bg/search_url    reg_match    .*

搜索页面分类条件下发
    [Documentation]    搜索页面分类条件下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    expect    /search_filters    reg_match    .*

master_view内容下发
    [Documentation]    比较master_view内容，不为空就代表可以正常下发数据
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    expect    /masterViews    reg_match    .*

重点业务日志上报接口
    [Documentation]    首页重点日志接口下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30_1
    #Json Struct Compare    FrontpageApiMasterViews30_1
    expect    /file_url    reg_match    .*

首页热播定时刷新
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiMasterViews30update_1
    # Json Struct Compare    FrontpageApiMasterViews30update_1
    expect    /md5    reg_match    .*
    expect    /masterViews/0/index    reg_match    .*
