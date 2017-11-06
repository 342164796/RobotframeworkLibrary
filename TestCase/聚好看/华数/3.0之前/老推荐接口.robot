*** Settings ***
Resource          Resource.robot

*** Test Cases ***
热播榜接口
    [Documentation]    在搜索时，无法根据搜索首字母搜索到数据时，自动补充，猜你喜欢显示数据。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    mediasApiTopMediaFromSearch_1
    Json Struct Compare    mediasApiTopMediaFromSearch_1
    ${totalstr}    Get Actual Value    mediasApiTopMediaFromSearch_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${10}

猜你喜欢
    [Documentation]    本接口3.0后终端不再调用。
    Create HTTP Context    api.wasuvod.hismarttv.com
    GET    /recom/api/getGuess?uuid=0&mac=c8:16:bd:2b:02:4f&devid=861003009000022000000602bd2b024f&tz=8&start=0&rows=14&version=00.002.002
    ${response}    Get Response Body
    ${media_0_title}    Get Json Value    ${response}    /medias/0/title
    ${media_0_id}    Get Json Value    ${response}    /medias/0/id
    expect    ${media_0_title}    reg_match    .*
    expect    ${media_0_id}    >    ${0}

大家都在看
    [Documentation]    本接口3.0后终端不再调用。
    Create HTTP Context    api.wasuvod.hismarttv.com
    GET    /stat/api/allwatching?tz=8&start=0&rows=70&uuid=8391610&mac=c8:16:bd:2b:02:43&devid=861003009000022000000602bd2b0243&version=00.102.005&subscriberId=8391610&has_fee=1&customerId=5798075
    ${response}    Get Response Body
    ${media_0_title}    Get Json Value    ${response}    /medias/0/title
    ${media_0_id}    Get Json Value    ${response}    /medias/0/id
    expect    ${media_0_title}    reg_match    .*
    expect    ${media_0_id}    >    ${0}

七日更新
    [Documentation]    本接口3.0后终端不再调用。
    Create HTTP Context    api.wasuvod.hismarttv.com
    GET    /medias/api/new7days?category_id=-1&start=0&rows=35&uuid=8391610&mac=c8:16:bd:2b:02:43&devid=861003009000022000000602bd2b0243&version=00.102.005&subscriberId=8391610&has_fee=1&customerId=5798075
    ${response}    Get Response Body
    ${media_0_title}    Get Json Value    ${response}    /medias/0/title
    ${media_0_id}    Get Json Value    ${response}    /medias/0/id
    expect    ${media_0_title}    reg_match    .*
    expect    ${media_0_id}    >    ${0}
