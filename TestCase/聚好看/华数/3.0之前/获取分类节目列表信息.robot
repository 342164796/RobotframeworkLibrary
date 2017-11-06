*** Settings ***
Resource          Resource.robot

*** Test Cases ***
电视剧分类节目列表
    [Documentation]    获取电视剧分类id：2003的节目列表，显示视频总数。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiSearch2003_1
    Get Actual Response    CategoryApiSearch2003_1
    ${totalstr}    Get Actual Value    CategoryApiSearch2003_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}
    expect    /medias/0/category    reg_match    电视剧    CategoryApiSearch2003_1
    #支持分页查询
    req    CategoryApiSearch2003_1    start=30
    Get Actual Response    CategoryApiSearch2003_1
    ${totalstr_1}    Get Actual Value    CategoryApiSearch2003_1    /total
    ${totalr_1}    Convert to Integer    ${totalstr_1}
    expect    ${totalstr}    =    ${totalr_1}
    expect    /medias/0/category    reg_match    电视剧    CategoryApiSearch2003_1

电影分类节目列表
    [Documentation]    获取电影分类id：2002的节目列表，显示视频总数。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiSearch2003_1
    path    CategoryApiSearch2003_1    4=2002
    Get Actual Response    CategoryApiSearch2003_1
    ${totalstr}    Get Actual Value    CategoryApiSearch2003_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}
    expect    /medias/0/category    reg_match    电影    CategoryApiSearch2003_1
    #支持分页查询
    req    CategoryApiSearch2003_1    start=30
    path    CategoryApiSearch2003_1    4=2002
    Get Actual Response    CategoryApiSearch2003_1
    ${totalstr_1}    Get Actual Value    CategoryApiSearch2003_1    /total
    ${totalr_1}    Convert to Integer    ${totalstr_1}
    expect    ${totalstr}    =    ${totalr_1}
    expect    /medias/0/category    reg_match    电影    CategoryApiSearch2003_1

综艺分类节目列表
    [Documentation]    获取综艺分类id：2004的节目列表，显示视频总数。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiSearch2003_1
    path    CategoryApiSearch2003_1    4=2004
    Get Actual Response    CategoryApiSearch2003_1
    ${totalstr}    Get Actual Value    CategoryApiSearch2003_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}
    #支持分页查询
    req    CategoryApiSearch2003_1    start=30
    path    CategoryApiSearch2003_1    4=2004
    Get Actual Response    CategoryApiSearch2003_1
    ${totalstr_1}    Get Actual Value    CategoryApiSearch2003_1    /total
    ${totalr_1}    Convert to Integer    ${totalstr_1}
    expect    ${totalstr}    =    ${totalr_1}

动漫分类节目列表
    [Documentation]    获取综艺分类id：2004的节目列表，显示视频总数。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiSearch2003_1
    path    CategoryApiSearch2003_1    4=2007
    Get Actual Response    CategoryApiSearch2003_1
    ${totalstr}    Get Actual Value    CategoryApiSearch2003_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}
    ${categoy}    Get Actual Value    CategoryApiSearch2003_1    /medias/0/category
    Should Contain    {幼儿,动漫}    ${categoy}
    #支持分页查询
    req    CategoryApiSearch2003_1    start=30
    path    CategoryApiSearch2003_1    4=2007
    Get Actual Response    CategoryApiSearch2003_1
    ${totalstr_1}    Get Actual Value    CategoryApiSearch2003_1    /total
    ${totalr_1}    Convert to Integer    ${totalstr_1}
    expect    ${totalstr}    =    ${totalr_1}
    ${categoy}    Get Actual Value    CategoryApiSearch2003_1    /medias/0/category
    Should Contain    {幼儿,动漫}    ${categoy}

电视剧-内地筛选
    [Documentation]    获取电影按照地区-大陆内地筛选的节目列表，显示视频总数。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryFilterApiSearch_1
    Get Actual Response    CategoryFilterApiSearch_1
    ${totalstr}    Get Actual Value    CategoryFilterApiSearch_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}
    expect    /medias/0/category    reg_match    电视剧    CategoryFilterApiSearch_1
    #支持分页查询
    req    CategoryFilterApiSearch_1    start=30
    Get Actual Response    CategoryFilterApiSearch_1
    ${totalstr_1}    Get Actual Value    CategoryFilterApiSearch_1    /total
    ${totalr_1}    Convert to Integer    ${totalstr_1}
    expect    ${totalstr}    =    ${totalr_1}
    expect    /medias/0/category    reg_match    电视剧    CategoryFilterApiSearch_1

电影-内地筛选
    [Documentation]    获取电视剧按照地区-大陆内地筛选的节目列表，显示视频总数。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryFilterApiSearch_1
    path    CategoryFilterApiSearch_1    4=2002
    Get Actual Response    CategoryFilterApiSearch_1
    ${totalstr}    Get Actual Value    CategoryFilterApiSearch_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}
    expect    /medias/0/category    reg_match    电影    CategoryFilterApiSearch_1
    #支持分页查询
    req    CategoryFilterApiSearch_1    start=30
    path    CategoryFilterApiSearch_1    4=2002
    Get Actual Response    CategoryFilterApiSearch_1
    ${totalstr_1}    Get Actual Value    CategoryFilterApiSearch_1    /total
    ${totalr_1}    Convert to Integer    ${totalstr_1}
    expect    ${totalstr}    =    ${totalr_1}
    expect    /medias/0/category    reg_match    电影    CategoryFilterApiSearch_1
