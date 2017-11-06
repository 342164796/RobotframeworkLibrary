*** Settings ***
Resource          Resource.robot

*** Test Cases ***
添加华数vip订单
    [Documentation]    添加华数VIP订单
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiOrderAdd_1    customerId=5967241
    Json Struct Compare    PaymentApiOrderAdd_1
    ${orderId}    Get Actual Value    PaymentApiOrderAdd_1    /orderId
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{orderinfo}    Query    SELECT order_id,fee,startTime,endTime,userid,customer_id ,resourceType \ FROM \ order_info WHERE order_id= '${orderId}'
    expect    /startTime    =    @{orderinfo[0]}[2]    PaymentApiOrderAdd_1
    expect    /endTime    =    @{orderinfo[0]}[3]    PaymentApiOrderAdd_1
    expect    @{orderinfo[0]}[4]    =    5967241
    expect    @{orderinfo[0]}[5]    =    5967241
    expect    @{orderinfo[0]}[6]    =    1

添加爱奇艺专区订单
    [Documentation]    添加爱奇艺包月订单
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiOrderAdd_2
    Get Actual Response    PaymentApiOrderAdd_2
    ${orderId}    Get Actual Value    PaymentApiOrderAdd_2    /orderId
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{orderinfo}    Query    SELECT order_id,fee,startTime,endTime,userid,customer_id ,resourceType \ FROM \ order_info WHERE order_id= '${orderId}'
    expect    /startTime    =    @{orderinfo[0]}[2]    PaymentApiOrderAdd_2
    expect    /endTime    =    @{orderinfo[0]}[3]    PaymentApiOrderAdd_2
    expect    @{orderinfo[0]}[4]    =    8706383
    expect    @{orderinfo[0]}[5]    =    5810106
    expect    @{orderinfo[0]}[6]    =    1

添加信封套餐订单
    [Documentation]    添加信封套餐订单
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiOrderAdd_3    customerId=5967241
    Get Actual Response    PaymentApiOrderAdd_3
    ${orderId}    Get Actual Value    PaymentApiOrderAdd_3    /orderId
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{orderinfo}    Query    SELECT order_id,fee,startTime,endTime,userid,customer_id ,resourceType \ FROM \ order_info WHERE order_id= '${orderId}'
    expect    /startTime    =    @{orderinfo[0]}[2]    PaymentApiOrderAdd_3
    expect    /endTime    =    @{orderinfo[0]}[3]    PaymentApiOrderAdd_3
    expect    @{orderinfo[0]}[4]    =    8706383
    expect    @{orderinfo[0]}[5]    =    5967241
    expect    @{orderinfo[0]}[6]    =    2

添加奇艺单点订单
    [Documentation]    添加奇艺单点订单
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{fee}    Query    SELECT price \ FROM \ price_info \ WHERE id = 1099
    ${fee_0}    Convert to Integer    @{fee[0]}
    req    PaymentApiOrderAdd_4    fee=${fee_0}
    Get Actual Response    PaymentApiOrderAdd_4
    ${orderId}    Get Actual Value    PaymentApiOrderAdd_4    /orderId
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{orderinfo}    Query    SELECT order_id,fee,startTime,endTime,userid,customer_id ,resourceType \ FROM \ order_info WHERE order_id= '${orderId}'
    expect    /startTime    =    @{orderinfo[0]}[2]    PaymentApiOrderAdd_4
    expect    /endTime    =    @{orderinfo[0]}[3]    PaymentApiOrderAdd_4
    expect    @{orderinfo[0]}[4]    =    8706383
    expect    @{orderinfo[0]}[5]    =    5810106
    expect    @{orderinfo[0]}[6]    =    0
