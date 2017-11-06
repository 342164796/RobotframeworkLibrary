*** Settings ***
Resource          Resource.robot

*** Test Cases ***
华数VIP专区信息
    [Documentation]    华数VIP专区信息，返回结果包含类型和名称等
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiVipGetBasicInfo_1
    Get Actual Response    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    100202    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id
    expect    /vender_id    =    1015    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentApiVipGetBasicInfo_1

爱奇艺专区信息
    [Documentation]    爱奇艺专区详情页面，（包含包年、包月、包季价格及折扣信息）vip_id: "100201"
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiVipGetBasicInfo_1    vipId=100201
    Get Actual Response    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    100201    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id 1002
    expect    /vender_id    =    1002    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentApiVipGetBasicInfo_1

信封套餐专区信息
    [Documentation]    信封套餐专区详情页面，（包含包年、包月、包季价格及折扣信息）vip_id: "100206"
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiVipGetBasicInfo_1    vipId=100206
    Get Actual Response    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    100206    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id 1002
    expect    /vender_id    =    9999    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型1为信封套餐
    expect    /resourceType    =    2    PaymentApiVipGetBasicInfo_1
    expect    /child_vip_id/0/id    =    100201    PaymentApiVipGetBasicInfo_1
    expect    /child_vip_id/1/id    =    100202    PaymentApiVipGetBasicInfo_1
