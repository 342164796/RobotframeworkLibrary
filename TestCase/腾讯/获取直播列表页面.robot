*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取按照时间筛选的体育直播栏目列表
    [Documentation]    获取按照时间筛选的体育直播栏目列表：一周体育直播。
    ...    注意：如果在聚好看console中配置的起止时间已过，此用例可能失败
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiLivelist_1
    Json Struct Compare    PaymentApiLivelist_1
    expect    /vipinfo/vip_id    =    101104    PaymentApiLivelist_1
    expect    /vipinfo/resourceType    =    1    PaymentApiLivelist_1
    expect    /vipinfo/vender_id    =    1011    PaymentApiLivelist_1
    expect    /vipinfo/sourceId    =    25    PaymentApiLivelist_1

获取按照分类筛选的体育直播栏目列表
    [Documentation]    获取按照分类筛选的体育直播栏目列表：NBA赛事直播。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiLivelist_1    liveId=1
    Get Actual Response    PaymentApiLivelist_1
    expect    /vipinfo/vip_id    =    101104    PaymentApiLivelist_1
    expect    /vipinfo/resourceType    =    1    PaymentApiLivelist_1
    expect    /vipinfo/vender_id    =    1011    PaymentApiLivelist_1
    expect    /vipinfo/sourceId    =    25    PaymentApiLivelist_1

按照配置资源的体育直播栏目列表
    [Documentation]    获取按照分类筛选的体育直播栏目列表：猴年春晚。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiLivelist_1    liveId=5
    Get Actual Response    PaymentApiLivelist_1
    expect    /vipinfo/vip_id    =    101104    PaymentApiLivelist_1
    expect    /vipinfo/resourceType    =    1    PaymentApiLivelist_1
    expect    /vipinfo/vender_id    =    1011    PaymentApiLivelist_1
    expect    /vipinfo/sourceId    =    25    PaymentApiLivelist_1
