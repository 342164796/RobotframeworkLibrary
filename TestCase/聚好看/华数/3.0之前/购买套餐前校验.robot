*** Settings ***
Resource          Resource.robot

*** Test Cases ***
购买套餐前校验-现在已无效
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiOrderCheckOrder_1
    Json Struct Compare    PaymentApiOrderCheckOrder_1
    expect    /isOrder    =    0    PaymentApiOrderCheckOrder_1
