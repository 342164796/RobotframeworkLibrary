*** Settings ***
Resource          Resource.robot

*** Test Cases ***
专题列表接口
    [Documentation]    专题列表接口。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicTopicdist_1
    Json Struct Compare    MediasApiTopicTopicdist_1
    ${totalstr}    Get Actual Value    MediasApiTopicTopicdist_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${10}

专题列表内海报名称下发
    [Documentation]    专题列表内海报专题名称下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicTopicdist_1
    Json Struct Compare    MediasApiTopicTopicdist_1
    expect    /total    >    ${10}
    expect    /topicName    reg_match    .*
    expect    /pics    reg_match    .*

专题列表接口第二页
    [Documentation]    专题列表接口。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicTopicdist_1    start=31    rows=60
    Json Struct Compare    MediasApiTopicTopicdist_1
    ${totalstr}    Get Actual Value    MediasApiTopicTopicdist_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${10}

专题列表第二页内海报名称下发
    [Documentation]    专题列表内海报专题名称下发
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    MediasApiTopicTopicdist_1    start=31    rows=60
    Json Struct Compare    MediasApiTopicTopicdist_1
    expect    /total    >    ${10}
    expect    /topicName    reg_match    .*
    expect    /pics    reg_match    .*
