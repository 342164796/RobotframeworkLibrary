*** Settings ***
Resource          Resource.robot

*** Test Cases ***
优惠活动专区
    [Documentation]    优惠活动专区详情，两种类型：包月送券、登录送券
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PromotionApiCurrent1_1
    Json Struct Compare    PromotionApiCurrent1_1
    expect    /promotions/0/name    reg_match    包月送券    PromotionApiCurrent1_1
    expect    /name    reg_match    活动专区    PromotionApiCurrent1_1

领取登录送优惠
    [Documentation]    在优惠活动专区中，选择登录送优惠券领取
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PromotionCouponApply_2
    Json Struct Compare    PromotionCouponApply_2

领取奇艺七天优惠
    [Documentation]    在奇艺7天优惠活动专区中，选择领取
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PromotionCouponApply_1
    Json Struct Compare    PromotionCouponApply_1

购买前查询可用优惠券
    [Documentation]    购买信封套餐前查询可用优惠券
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PromotionCouponAvailable_1
    Json Struct Compare    PromotionCouponAvailable_1
