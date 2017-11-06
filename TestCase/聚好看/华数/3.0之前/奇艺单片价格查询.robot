*** Settings ***
Resource          Resource.robot

*** Test Cases ***
奇艺单片超凡蜘蛛侠价格
    [Documentation]    奇艺单片超凡蜘蛛侠价格，参数：resourceType=0&resourceId=1556167
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiPriceGetInfo_1
    Json Struct Compare    PaymentApiPriceGetInfo_1
    expect    /fee_detail/0/price/media_hour    =    48    PaymentApiPriceGetInfo_1

奇异单片价格-随机
    [Documentation]    查询数据库后，获取最新一个奇艺单片的价格
    [Tags]    urgent
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{priceinfo}    Query    SELECT bm.id,p.price,p.days ,p.vender_product_id FROM basic_media bm ,price_info p WHERE bm.id = p.resourceId \ AND p.deleted = 0 AND p.resourceType =0 \ AND bm.available =2 AND bm.vender_online =2 AND NOT EXISTS (SELECT * FROM vip_resource_info v WHERE v.resourceId= bm.id AND v.deleted = 0 AND v.vip_id = 100201) ORDER BY id DESC LIMIT 1;
    load    ${VOD_DIR}/wasu/
    req    PaymentApiPriceGetInfo_1    resourceId=@{priceinfo[0]}[0]
    Get Actual Response    PaymentApiPriceGetInfo_1
    expect    /fee_detail/0/price/media_hour    =    48    PaymentApiPriceGetInfo_1
    expect    /fee_detail/0/price/price    =    @{priceinfo[0]}[1]    PaymentApiPriceGetInfo_1
    ${venderproductid}    Get Actual Value    PaymentApiPriceGetInfo_1    /fee_detail/0/price/vender_product_id
    Should Contain    ${venderproductid}    @{priceinfo[0]}[3]
