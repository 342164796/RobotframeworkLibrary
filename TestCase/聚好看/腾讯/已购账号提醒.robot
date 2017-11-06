*** Settings ***
Resource          Resource.robot

*** Test Cases ***
支付订单接口
    [Documentation]    已购账号提醒，subscriberId=8584714,customerId=5965376,显示5条orderID，第一条订单
    ...    resourceid：101104
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiOrderGetAllTrades_1
    Json Struct Compare    PaymentApiOrderGetAllTrades_1
    expect    /count    =    5    PaymentApiOrderGetAllTrades_1
    expect    /trades/0/orderId    reg_match    HIVOD08d0b75acb3214568215904203    PaymentApiOrderGetAllTrades_1
    expect    /trades/0/resourceId    =    101104    PaymentApiOrderGetAllTrades_1
    expect    /trades/0/resourceName    reg_match    直播    PaymentApiOrderGetAllTrades_1
    expect    /trades/0/desc    reg_match    季包    PaymentApiOrderGetAllTrades_1
    [Teardown]
