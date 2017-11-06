*** Settings ***
Resource          Resource.robot

*** Test Cases ***
企鹅影院-信封套餐详情
    [Documentation]    企鹅影院(信封套餐）付费页面，（包含包年、包月、包季价格及折扣信息）vip_id: "101102"，vender_id: 9999，title: "企鹅影院"
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiVipGetBasicInfo_1
    Json Struct Compare    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    101102    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id 9999 为海信
    expect    /vender_id    =    9999    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型2为信封套餐
    expect    /resourceType    =    2    PaymentApiVipGetBasicInfo_1
    #校验信封套餐资源
    expect    /child_vip_id/0/id    =    101101    PaymentApiVipGetBasicInfo_1

企鹅影院-基本VIP详情
    [Documentation]    企鹅影院-基本VIP付费页面，（包含包年、包月、包季价格及折扣信息）vip_id: "101101"，vender_id: 1011
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiVipGetBasicInfo_1    vipId=101101
    Get Actual Response    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    101101    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id
    expect    /vender_id    =    1011    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentApiVipGetBasicInfo_1
    #校验返回专区在第三方的ID 23 为企鹅影院
    expect    /sourceId    =    23    PaymentApiVipGetBasicInfo_1

信封超级大套餐详情
    [Documentation]    信封超级大套餐付费页面，（包含包年、包月、包季价格及折扣信息）vip_id: "101109"，vender_id:9999
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiVipGetBasicInfo_1    vipId=101109
    Get Actual Response    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    101109    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id
    expect    /vender_id    =    9999    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型2为信封套餐
    expect    /resourceType    =    2    PaymentApiVipGetBasicInfo_1

HBO-基本VIP详情
    [Documentation]    HBO-基本VIP付费页面，（包含包年、包月、包季价格及折扣信息）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiVipGetBasicInfo_1    vipId=101103
    Get Actual Response    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    101103    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id
    expect    /vender_id    =    1011    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentApiVipGetBasicInfo_1
    #校验返回专区在第三方的ID 23 为企鹅影院
    expect    /sourceId    =    24    PaymentApiVipGetBasicInfo_1

体育直播-基本VIP详情
    [Documentation]    体育直播-基本VIP付费页面，（包含包年、包月、包季价格及折扣信息）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiVipGetBasicInfo_1    vipId=101104
    Get Actual Response    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    101104    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id
    expect    /vender_id    =    1011    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentApiVipGetBasicInfo_1
    #校验返回专区在第三方的ID 23 为企鹅影院
    expect    /sourceId    =    25    PaymentApiVipGetBasicInfo_1

优朋专区-基本VIP详情
    [Documentation]    体育直播-基本VIP付费页面，（包含包年、包月、包季价格及折扣信息）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiVipGetBasicInfo_1    vipId=100801
    Get Actual Response    PaymentApiVipGetBasicInfo_1
    #校验返回vipId
    expect    /vip_id    =    100801    PaymentApiVipGetBasicInfo_1
    #校验返回提供商id
    expect    /vender_id    =    1008    PaymentApiVipGetBasicInfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentApiVipGetBasicInfo_1
    #校验返回专区在第三方的ID 1为优朋
    expect    /sourceId    =    1    PaymentApiVipGetBasicInfo_1
