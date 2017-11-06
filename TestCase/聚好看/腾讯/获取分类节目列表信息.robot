*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取免费电影分类节目列表
    [Documentation]    获取免费电影分类 id：3001的节目列表
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch3011_1
    Json Struct Compare    CategoryApiSearch3011_1
    expect    /medias/0/definition    =    31    CategoryApiSearch3011_1
    ${totalstr}    Get Actual Value    CategoryApiSearch3011_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${100}
    expect    /medias/0/category    reg_match    电影    CategoryApiSearch3011_1

获取二级栏目节目列表
    [Documentation]    获取二级栏目 id：11的节目列表
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch_11
    Json Struct Compare    CategoryApiSearch_11
    ${totalstr}    Get Actual Value    CategoryApiSearch_11    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}

获取电影分类节目列表
    [Documentation]    获取免费电影分类 id：2001的节目列表
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch3011_1
    Path    CategoryApiSearch3011_1    4=2001
    Json Struct Compare    CategoryApiSearch3011_1
    #expect    /medias/0/definition    =    31    CategoryApiSearch3011_1
    ${totalstr}    Get Actual Value    CategoryApiSearch3011_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${100}
    expect    /medias/0/category    reg_match    电影    CategoryApiSearch3011_1

获取电视剧分类节目列表
    [Documentation]    获取电视剧分类 id：2002的节目列表
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch3011_1
    Path    CategoryApiSearch3011_1    4=2002
    Json Struct Compare    CategoryApiSearch3011_1
    #expect    /medias/0/definition    =    31    CategoryApiSearch3011_1
    ${totalstr}    Get Actual Value    CategoryApiSearch3011_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${100}
    expect    /medias/0/category    reg_match    电视剧    CategoryApiSearch3011_1

获取综艺分类节目列表
    [Documentation]    获取综艺分类 id：2003的节目列表
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch3011_1
    Path    CategoryApiSearch3011_1    4=2003
    Json Struct Compare    CategoryApiSearch3011_1
    #expect    /medias/0/definition    =    31    CategoryApiSearch3011_1
    ${totalstr}    Get Actual Value    CategoryApiSearch3011_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${100}
    # expect    /medias/0/category    reg_match    电视剧    CategoryApiSearch3011_1

获取动漫分类节目列表
    [Documentation]    获取综艺分类 id：2004的节目列表
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch3011_1
    Path    CategoryApiSearch3011_1    4=2004
    Json Struct Compare    CategoryApiSearch3011_1
    #expect    /medias/0/definition    =    31    CategoryApiSearch3011_1
    ${totalstr}    Get Actual Value    CategoryApiSearch3011_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${100}

获取企鹅影院分类节目列表
    [Documentation]    获取综艺分类 id：2004的节目列表
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch3011_1
    Path    CategoryApiSearch3011_1    4=101101
    Json Struct Compare    CategoryApiSearch3011_1
    #expect    /medias/0/definition    =    31    CategoryApiSearch3011_1
    ${totalstr}    Get Actual Value    CategoryApiSearch3011_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${100}

获取HBO分类节目列表
    [Documentation]    获取HBO分类节目列表 VIPID=100801
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch3009_1
    Path    CategoryApiSearch3009_1
    Json Struct Compare    CategoryApiSearch3009_1
    ${totalstr}    Get Actual Value    CategoryApiSearch3009_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${10}

获取优朋专区分类节目列表
    [Documentation]    获取优朋专区分类节目列表 VIPID=3009
    load    ${VOD_DIR}/tecent/
    req    CategoryApiSearch3009_1    vipId=100801
    Json Struct Compare    CategoryApiSearch3009_1
    ${totalstr}    Get Actual Value    CategoryApiSearch3009_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${10}

获取七日更新列表页
    [Documentation]    七日更新
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    7daysUpdate
    Json Struct Compare    7daysUpdate
    ${totalstr}    Get Actual Value    7daysUpdate    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}
