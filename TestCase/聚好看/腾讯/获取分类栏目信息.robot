*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取电影分类栏目页面
    [Documentation]    电影分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Json Struct Compare    CategoryApiColumnFilters30040100_1
    expect    /filter_id    =    2001    CategoryApiColumnFilters30040100_1
    expect    /title    reg_match    电影    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${5}

获取电视剧分类栏目页面
    [Documentation]    电视剧分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Path    CategoryApiColumnFilters30040100_1    5=3001_0_100
    Json Struct Compare    CategoryApiColumnFilters30040100_1
    expect    /filter_id    =    2002    CategoryApiColumnFilters30040100_1
    expect    /title    reg_match    电视剧    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${5}

获取综艺分类栏目页面
    [Documentation]    综艺分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Path    CategoryApiColumnFilters30040100_1    5=3005_0_100
    Get Actual Response    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${5}

获取动漫分类栏目页面
    [Documentation]    动漫分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Path    CategoryApiColumnFilters30040100_1    5=3006_0_100
    Get Actual Response    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${5}

获取纪录片分类栏目页面
    [Documentation]    动漫分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Path    CategoryApiColumnFilters30040100_1    5=3007_0_100
    Get Actual Response    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}

获取企鹅套餐分类栏目页面
    [Documentation]    动漫分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Path    CategoryApiColumnFilters30040100_1    5=101101_0_100
    Get Actual Response    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}

获取HBO分类栏目页面
    [Documentation]    动漫分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Path    CategoryApiColumnFilters30040100_1    5=101103_0_100
    Get Actual Response    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}

获取优朋专区分类栏目页面
    [Documentation]    动漫分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Path    CategoryApiColumnFilters30040100_1    5=100801_0_100
    Get Actual Response    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}

获取信封套餐分类栏目页面
    [Documentation]    动漫分类栏目,参数有题目、视频总数、标签信息（filter_id: 2001title: "电影"）
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    CategoryApiColumnFilters30040100_1
    Path    CategoryApiColumnFilters30040100_1    5=101109_0_100
    Get Actual Response    CategoryApiColumnFilters30040100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters30040100_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}
