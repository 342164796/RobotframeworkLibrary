*** Settings ***
Resource          Resource.robot

*** Test Cases ***
企鹅封装专区
    [Documentation]    校验企鹅封装专区接口信息下发
    [Tags]    urgent,smoke
    Load    ${VOD_DIR}/tecent/
    req    packagevip_1
    expect    /success    =    True    packagevip_1
    expect    /resourceType    =    1    packagevip_1
    expect    /title    reg_match    企鹅影院    packagevip_1
    expect    /sourceId    =    23    packagevip_1
    expect    /vender_id    =    1011    packagevip_1
    expect    /package_vip_id    =    1    packagevip_1
    expect    /vip_id    =    101101    packagevip_1

HBO封装专区
    [Documentation]    HBO封装专区信息下发
    [Tags]    urgent,smoke
    Load    ${VOD_DIR}/tecent/
    req    packagevip_1    packageVipId=2
    expect    /success    =    True    packagevip_1
    expect    /resourceType    =    1    packagevip_1
    expect    /title    reg_match    hbo    packagevip_1
    expect    /sourceId    =    24    packagevip_1
    expect    /vender_id    =    1011    packagevip_1
    expect    /package_vip_id    =    2    packagevip_1
    expect    /vip_id    =    101103    packagevip_1

体育直播封装专区
    [Documentation]    体育直播封装专区接口下发
    [Tags]    urgent,smoke
    Load    ${VOD_DIR}/tecent/
    req    packagevip_1    packageVipId=3
    expect    /success    =    True    packagevip_1
    expect    /resourceType    =    1    packagevip_1
    expect    /title    reg_match    直播    packagevip_1
    expect    /sourceId    =    25    packagevip_1
    expect    /vender_id    =    1011    packagevip_1
    expect    /package_vip_id    =    3    packagevip_1
    expect    /vip_id    =    101104    packagevip_1

优朋封装专区
    [Documentation]    优朋封装专区信息下发
    [Tags]    urgent,smoke
    Load    ${VOD_DIR}/tecent/
    req    packagevip_1    packageVipId=5
    expect    /success    =    True    packagevip_1
    expect    /resourceType    =    1    packagevip_1
    expect    /title    reg_match    优朋专区    packagevip_1
    expect    /sourceId    =    1    packagevip_1
    expect    /vender_id    =    1008    packagevip_1
    expect    /package_vip_id    =    5    packagevip_1
    expect    /vip_id    =    100801    packagevip_1

信封封装专区
    [Documentation]    信封封装专区信息下发
    [Tags]    urgent,smoke
    Load    ${VOD_DIR}/tecent/
    req    packagevip_1    packageVipId=4
    expect    /success    =    True    packagevip_1
    expect    /resourceType    =    2    packagevip_1
    expect    /title    reg_match    信封专区    packagevip_1
    expect    /sourceId    =    \    packagevip_1
    expect    /vender_id    =    9999    packagevip_1
    expect    /package_vip_id    =    4    packagevip_1
    expect    /vip_id    =    101105    packagevip_1
    expect    /child_vip_id/0/id    =    101101    packagevip_1
    expect    /child_vip_id/1/id    =    101103    packagevip_1
    expect    /child_vip_id/2/id    =    101104    packagevip_1
