*** Settings ***
Resource          Resource.robot

*** Test Cases ***
广告信息下发
    [Documentation]    广告接口信息下发。
    [Tags]    High
    Load    ${VOD_DIR}/tecent/
    req    advert_1
    expect    /advert_list/0/appversion    =    244    advert_1
    expect    /advert_list/0/app_package_name    =    com.hisense.hitv.shopping    advert_1
    expect    /advert_list/0/is_goto    =    1    advert_1
    expect    /advert_list/0/goto_params    reg_match    .*    advert_1
