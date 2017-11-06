*** Settings ***
Resource          Resource.robot

*** Test Cases ***
电视剧分类筛选条件
    [Documentation]    获取电视剧分类id：2003 的筛选条件
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiFilters2003_1
    Get Actual Response    CategoryApiFilters2003_1
    expect    /filters/0/field_name    reg_match    .*    CategoryApiFilters2003_1

电影分类筛选条件
    [Documentation]    获取电影分类id：2002 的筛选条件
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiFilters2003_1
    path    CategoryApiFilters2003_1    4=2002
    Get Actual Response    CategoryApiFilters2003_1
    expect    /filters/0/field_name    reg_match    .*    CategoryApiFilters2003_1

综艺分类筛选条件
    [Documentation]    获取综艺分类id：2004 的筛选条件
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiFilters2003_1
    path    CategoryApiFilters2003_1    4=2004
    Get Actual Response    CategoryApiFilters2003_1
    expect    /filters/0/field_name    reg_match    .*    CategoryApiFilters2003_1

动漫分类筛选条件
    [Documentation]    获取动漫分类id：2007 的筛选条件
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiFilters2003_1
    path    CategoryApiFilters2003_1    4=2007
    Get Actual Response    CategoryApiFilters2003_1
    expect    /filters/0/field_name    reg_match    .*    CategoryApiFilters2003_1
