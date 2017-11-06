*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取专题列表
    [Documentation]    获取专题列表。3.1版本专题列表中，过滤掉专题资源中包含VIP专区的专题，请求参数添加add_type=1。
    [Tags]    urgent
    [Template]
    load    ${VOD_DIR}/wasu/
    req    MediasApiTopicTopicdist_2
    Json Struct Compare    MediasApiTopicTopicdist_2
    ${totalstr}    Get Actual Value    MediasApiTopicTopicdist_2    /total
    ${totalr}    Convert to Integer    ${totalstr}
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{count}    Query    SELECT COUNT(*) \FROM\ new_topic WHERE deleted = 0 and add_type in (0,1)
    expect    @{count[0]}    =    ${totalstr}
    #${x}    Evaluate    ${totalr}-1
    #expect    ${x}    =    90
