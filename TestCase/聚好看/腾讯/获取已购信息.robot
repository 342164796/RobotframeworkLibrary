*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取已购信息
    [Documentation]    获取用户已购信息：subscriberId=8585503,customerId=5964745,该用户无有效购买信息。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiOrderGetResources_1
    Json Struct Compare    PaymentApiOrderGetResources_1
    expect    /total    =    6    PaymentApiOrderGetResources_1

新接口获取已购信息
    [Documentation]    获取用户已购信息：subscriberId=8585503,customerId=5964745,该用户无有效购买信息。
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiOrderGetResources_new
    Json Struct Compare    PaymentApiOrderGetResources_new
    expect    /total    =    5    PaymentApiOrderGetResources_new
