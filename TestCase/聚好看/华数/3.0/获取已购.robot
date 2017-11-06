*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取已购信息
    [Documentation]    获取用户已购信息 3.0 版本新增参数
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiOrderGetResource3.0_1
    Json Struct Compare    PaymentApiOrderGetResource3.0_1
    ${totalstr}    Get Actual Value    PaymentApiOrderGetResource3.0_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${1}
