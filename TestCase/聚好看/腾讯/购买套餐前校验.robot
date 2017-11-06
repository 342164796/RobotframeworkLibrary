*** Settings ***
Resource          Resource.robot

*** Test Cases ***
购买套餐前校验（现在已无效）
    [Documentation]    购买套餐前校验（现在已无效）
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    PaymentApiCouponAvailable5965376_1
    Json Struct Compare    PaymentApiCouponAvailable5965376_1
