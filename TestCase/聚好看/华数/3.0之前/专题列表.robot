*** Settings ***
Resource          Resource.robot
Library           HttpLibrary.HTTP

*** Test Cases ***
专题列表接口
    [Documentation]    专题列表接口。
    [Tags]    urgent
    [Template]
    load    ${VOD_DIR}/wasu/
    req    MediasApiTopicTopicdist_1
    Json Struct Compare    MediasApiTopicTopicdist_1
    ${totalstr}    Get Actual Value    MediasApiTopicTopicdist_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{count}    Query    SELECT COUNT(*) \FROM\ new_topic WHERE deleted = 0 and add_type in (0,2)
    expect    @{count[0]}    =    ${totalstr}
