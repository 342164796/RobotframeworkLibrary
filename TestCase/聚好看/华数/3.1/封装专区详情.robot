*** Settings ***
Resource          Resource.robot

*** Test Cases ***
华数-支付到华数
    [Documentation]    华数VIP-支付到华数 封装专区详情页面，vip_id: "100202"，该封装专区使用基本专区价格。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentPackageVipinfo_1    packageVipId=3
    Get Actual Response    PaymentPackageVipinfo_1
    #校验返回vipId
    expect    /vip_id    =    100202    PaymentPackageVipinfo_1
    #校验返回提供商id 1002
    expect    /vender_id    =    1015    PaymentPackageVipinfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentPackageVipinfo_1
    expect    /fee_detail/0/price/pay_platform/0    =    1015    PaymentPackageVipinfo_1
    ${priceId}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/priceId
    ${days}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/days
    ${price}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/price
    ${desc}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/desc
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{count}    Query    SELECT COUNT(*) \ FROM \ price_info p WHERE p.id = '${priceId}' \ AND p.deleted =0 \ AND p.price = '${price}' \ AND p.days = '${days}' \ \
    expect    @{count[0]}[0]    =    1

爱奇艺-支付到华数
    [Documentation]    爱奇艺VIP-支付到华数 封装专区详情页面，vip_id: "100201"，该封装专区使用基本专区价格。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentPackageVipinfo_1
    Get Actual Response    PaymentPackageVipinfo_1
    #校验返回vipId
    expect    /vip_id    =    100201    PaymentPackageVipinfo_1
    #校验返回提供商id 1002
    expect    /vender_id    =    1002    PaymentPackageVipinfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentPackageVipinfo_1
    expect    /fee_detail/0/price/pay_platform/0    =    1015    PaymentPackageVipinfo_1
    ${priceId}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/priceId
    ${days}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/days
    ${price}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/price
    ${desc}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/desc
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{count}    Query    SELECT COUNT(*) \ FROM \ price_info p WHERE p.id = '${priceId}' \ AND p.deleted =0 \ AND p.price = '${price}' \ AND p.days = '${days}' \ \
    expect    @{count[0]}[0]    =    1

爱奇艺-支付到海信
    [Documentation]    信封专区-支付到华数 封装专区详情页面，vip_id: "100201"，该封装专区使用基本专区价格。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentPackageVipinfo_1    packageVipId=5
    Get Actual Response    PaymentPackageVipinfo_1
    #校验返回vipId
    expect    /vip_id    =    100201    PaymentPackageVipinfo_1
    #校验返回提供商id 1002
    expect    /vender_id    =    1002    PaymentPackageVipinfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    1    PaymentPackageVipinfo_1
    expect    /point_card/card_parent_remind    reg_match    .*    PaymentPackageVipinfo_1
    ${priceId}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/priceId
    ${days}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/days
    ${price}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/price
    ${desc}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/desc
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{count}    Query    SELECT COUNT(*) \ FROM \ price_info p WHERE p.id = '${priceId}' \ AND p.deleted =0 \ AND p.price = '${price}' \ \
    expect    @{count[0]}[0]    =    1

信封专区-支付到海信
    [Documentation]    爱奇艺VIP-支付到海信 封装专区详情页面，vip_id: "100206"，该封装专区使用基本专区价格。
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentPackageVipinfo_1    packageVipId=2
    Get Actual Response    PaymentPackageVipinfo_1
    #校验返回vipId
    expect    /vip_id    =    100206    PaymentPackageVipinfo_1
    #校验返回提供商id 1002
    expect    /vender_id    =    9999    PaymentPackageVipinfo_1
    #校验返回专区类型1为基本VIP
    expect    /resourceType    =    2    PaymentPackageVipinfo_1
    expect    /point_card/card_parent_remind    reg_match    .*    PaymentPackageVipinfo_1
    ${priceId}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/priceId
    ${days}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/days
    ${price}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/price
    ${desc}    get actual value    PaymentPackageVipinfo_1    /fee_detail/0/price/desc
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{count}    Query    SELECT COUNT(*) \ FROM \ price_info p WHERE p.id = '${priceId}' \ AND p.deleted =0 \ AND p.price = '${price}' \ \
    expect    @{count[0]}[0]    =    1
