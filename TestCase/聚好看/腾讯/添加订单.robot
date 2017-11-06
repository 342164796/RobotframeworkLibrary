*** Settings ***
Resource          Resource.robot

*** Test Cases ***
添加腾讯订单
    [Documentation]    添加腾讯订单，subscriberId=8584714，customerId=5965376，返回的参数： "fee": "1",
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiOrderAdd_1
    Json Struct Compare    PaymentApiOrderAdd_1
    expect    /fee    =    1    PaymentApiOrderAdd_1
    ${orderId}    Get Actual Value    PaymentApiOrderAdd_1    /orderId
    Connect to Database Using Custom Params    pymysql    database='vod',user='root',password='mysql',host='10.18.207.47',port=3306
    @{orderinfo}    Query    SELECT order_id,fee,startTime,endTime,userid,customer_id \ FROM \ order_info WHERE order_id= '${orderId}'
    expect    /startTime    =    @{orderinfo[0]}[2]    PaymentApiOrderAdd_1
    expect    /endTime    =    @{orderinfo[0]}[3]    PaymentApiOrderAdd_1
    expect    @{orderinfo[0]}[4]    =    8584714
    expect    @{orderinfo[0]}[5]    =    5965376
