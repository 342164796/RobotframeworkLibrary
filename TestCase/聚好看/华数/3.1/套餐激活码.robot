*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取套餐的已用激活码信息
    [Documentation]    获取套餐对应的激活码信息。
    [Tags]    urgent
    [Template]
    load    ${VOD_DIR}/wasu/
    req    PaymentApiDetailCardInfo_1
    expect    /resultCode    =    1    PaymentApiDetailCardInfo_1
