*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取已购信息
    [Documentation]    获取用户已购信息（包含专区和单片），参数：deviceid ,subscriberid,customerid
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiOrderGetResources_1    devid=861003009000001000000710e70600e2    subscriberId=8588738    customerId=5959315
    Json Struct Compare    PaymentApiOrderGetResources_1
    ${totalstr}    Get Actual Value    PaymentApiOrderGetResources_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}

消费记录-已购产品
    [Documentation]    消费记录 3.0版本后不再使用
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiOrderGetAllTrades_1
    Json Struct Compare    PaymentApiOrderGetAllTrades_1
    expect    /count    =    1    PaymentApiOrderGetAllTrades_1
