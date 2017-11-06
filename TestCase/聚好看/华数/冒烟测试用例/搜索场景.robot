*** Settings ***
Resource          Resource.robot

*** Test Cases ***
搜索场景1
    [Documentation]    先查询默认热词，然后根据热词搜索，在搜索结果中选择第一个节目，进入详情页
    [Tags]    urgent smoke
    load    ${VOD_DIR}/wasu/
    #查询默认热词
    req    SearchApiHotwords_1
    Get Actual Response    SearchApiHotwords_1
    ${hotwords_1}    Get Actual value    SearchApiHotwords_1    /words/0/hot_words
    ${categoryId_1}    Get Actual value    SearchApiHotwords_1    /words/0/category_id
    ${hotId_1}    Get Actual value    SearchApiHotwords_1    /words/1/hot_id
    #根据第一个默认热词进行搜索
    req    SearchApiGetResult_2    hot_id= ${hotId_1}    title=${hotwords_1}
    ${resonse}    Get Actual Response    SearchApiGetResult_2
    ${totalstr}    Get Actual Value    SearchApiGetResult_2    /total
    ${mediaId_0}    Get Actual Value    SearchApiGetResult_2    /medias/0/id
    ${mediaTitle_0}    Get Actual Value    SearchApiGetResult_2    /medias/0/title
    ${searchResultCategoryId}    Get Actual Value    SearchApiGetResult_2    /medias/0/category_id
    expect    ${categoryId_1}    =    ${searchResultCategoryId}
    #根据查询结果，获取第一个搜索结果的节目详情信息
    req    MediasApiMedia1674263_1
    path    MediasApiMedia1674263_1    4=${mediaId_0}
    expect    /title    =    ${mediaTitle_0}    MediasApiMedia1674263_1
    expect    /category_id    =    ${categoryId_1}    MediasApiMedia1674263_1
    expect    /id    =    ${mediaId_0}    MediasApiMedia1674263_1

搜索场景2
    [Documentation]    先根据首页查询默认热词，然后根据热词搜索，在搜索结果中选择第一个节目，进入详情页
    [Tags]    urgent smoke
    load    ${VOD_DIR}/wasu/
    #根据首字母查询热词
    req    SearchApiHotwords_1    search_key=MGDZ
    Get Actual Response    SearchApiHotwords_1
    ${hotwords_1}    Get Actual value    SearchApiHotwords_1    /words/1/hot_words
    ${categoryId_1}    Get Actual value    SearchApiHotwords_1    /words/1/category_id
    ${hotId_1}    Get Actual value    SearchApiHotwords_1    /words/1/hot_id
    #根据第一个默认热词进行搜索
    req    SearchApiGetResult_2    hot_id= ${hotId_1}    title=${hotwords_1}
    ${resonse}    Get Actual Response    SearchApiGetResult_2
    Get Actual Response    SearchApiGetResult_2
    ${totalstr}    Get Actual Value    SearchApiGetResult_2    /total
    ${mediaId_0}    Get Actual Value    SearchApiGetResult_2    /medias/0/id
    ${mediaTitle_0}    Get Actual Value    SearchApiGetResult_2    /medias/0/title
    ${searchResultCategoryId}    Get Actual Value    SearchApiGetResult_2    /medias/0/category_id
    expect    ${categoryId_1}    =    ${searchResultCategoryId}
    #根据查询结果，获取第一个搜索结果的节目详情信息
    req    MediasApiMedia1674263_1
    path    MediasApiMedia1674263_1    4=${mediaId_0}
    Get Actual Response    MediasApiMedia1674263_1
    expect    /title    =    ${mediaTitle_0}    MediasApiMedia1674263_1
    expect    /category_id    =    ${categoryId_1}    MediasApiMedia1674263_1
    expect    /id    =    ${mediaId_0}    MediasApiMedia1674263_1
