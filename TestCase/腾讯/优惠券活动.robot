*** Settings ***
Resource          Resource.robot

*** Test Cases ***
优惠券活动列表页下发
    load    ${VOD_DIR}/tecent/
    req    promotion_1
    Json Struct Compare    promotion_1
    expect    /promotions    reg_match    .*
    expect    /image_url    reg_match    .*
    expect    /name    reg_match    .*

登录送券接口下发
    [Documentation]    判断能否领成功，正常状态时不能领成功的
    [Tags]    Medium
    load    ${VOD_DIR}/tecent/
    req    couponApplayLogin_1
    Json Struct Compare    couponApplayLogin_1
    expect    /resultCode    reg_match    .*
    expect    /description    reg_match    .*
