*** Settings ***
Resource          Resource.robot

*** Test Cases ***
根据首字母进行搜索
    [Documentation]    根据首字母进行搜索:若首字母是NO，则搜索结果为0。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    SearchApiGetResult_1    search_key=NNNNNNN
    Json Struct Compare    SearchApiGetResult_1
    expect    /total    =    0    SearchApiGetResult_1

搜索热词
    [Documentation]    获取搜索热词,首字母：LYB，有显示结果
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    SearchApiHotwords_1    search_key=LYB
    Get Actual Response    SearchApiHotwords_1
    ${totalstr}    Get Actual Value    SearchApiHotwords_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${2}

默认搜索热词
    [Documentation]    显示默认搜索热词，电视剧2个，电影2个，综艺2个，动漫2个
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    SearchApiHotwords_1
    Json Struct Compare    SearchApiHotwords_1
    Expect    /words/0/category_id    equal    1001    SearchApiHotwords_1
    Expect    /words/1/category_id    equal    1001    SearchApiHotwords_1
    Expect    /words/2/category_id    equal    1004    SearchApiHotwords_1
    Expect    /words/3/category_id    equal    1004    SearchApiHotwords_1
    Expect    /words/4/category_id    equal    1002    SearchApiHotwords_1
    Expect    /words/5/category_id    equal    1002    SearchApiHotwords_1
    Expect    /words/6/category_id    equal    1005    SearchApiHotwords_1
    Expect    /words/7/category_id    equal    1005    SearchApiHotwords_1
    ${totalstr}    Get Actual Value    SearchApiHotwords_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${6}

根据热词搜索
    [Documentation]    根据首字母进行搜索:若首字母是NO，则搜索结果为0。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    SearchApiGetResult_2    title=aiqingsousuo
    Json Struct Compare    SearchApiGetResult_2
    #    ${resonse}    Get Actual Response    SearchApiGetResult_2
    # ${totalstr}    Get Actual Value    SearchApiGetResult_2    /total
    #    ${totalr}    Convert to Integer    ${totalstr}
    # expect    ${totalstr}    >    ${2}
