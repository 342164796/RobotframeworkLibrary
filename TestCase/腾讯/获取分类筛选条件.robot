*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取电视剧分类筛选条件
    [Documentation]    获取电视剧分类筛选条件 categoryid=2002
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    CategoryApiFilters2002_1
    Json Struct Compare    CategoryApiFilters2002_1
    expect    /filters/0/field_name    reg_match    country    CategoryApiFilters2002_1
    expect    /filters/0/name    reg_match    国家    CategoryApiFilters2002_1

获取免费电影分类筛选条件
    [Documentation]    获取免费电影分类筛选条件 categoryid=3011
    [Tags]    urgent
    [Setup]
    load    ${VOD_DIR}/tecent/
    req    CategoryApiFilters3011_1
    Json Struct Compare    CategoryApiFilters3011_1
    expect    /filters/0/field_name    reg_match    .*    CategoryApiFilters3011_1
    expect    /filters/0/name    reg_match    类型    CategoryApiFilters3011_1
