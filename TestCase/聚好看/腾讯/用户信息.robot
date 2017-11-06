*** Settings ***
Resource          Resource.robot

*** Test Cases ***
用户信息下发
    [Tags]    smoke
    Load    ${VOD_DIR}/tecent/
    req    userProfile_1
    expect    /play_error_image    reg_match    .*    userProfile_1
    expect    /member_vipid_list/0/vender_id    =    100801    userProfile_1
    expect     /member_vipid_list/1/vender_id    =    101101    userProfile_1
    expect    /play_error_image    =    http://10.18.207.39/images/shouhou.jpg    userProfile_1
