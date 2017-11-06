*** Settings ***
Resource          Resource.robot

*** Test Cases ***
电影-相关推荐
    [Documentation]    获取电影的相关推荐信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    RecomApiGetRelatedMedia_1
    Json Struct Compare    RecomApiGetRelatedMedia_1
    ${totalstr}    Get Actual Value    RecomApiGetRelatedMedia_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${5}

电视剧-相关推荐
    [Documentation]    获取电视剧的相关推荐信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    RecomApiGetRelatedMedia_1    media=1955116
    Json Struct Compare    RecomApiGetRelatedMedia_1
    ${totalstr}    Get Actual Value    RecomApiGetRelatedMedia_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${5}
    ${mediaId_0}    Get Actual Value    RecomApiGetRelatedMedia_1    /medias/0/id
    ${mediaId_0}    Convert to Integer    ${mediaId_0}
    expect    ${mediaId_0}    >    ${0}
