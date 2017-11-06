*** Settings ***
Resource          Resource.robot

*** Test Cases ***
冒泡提醒
    [Documentation]    获取冒泡提醒以及其他信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiUserprofile
    expect    /msg/0    reg_match    .*    PaymentApiUserprofile
    ${definition}    Get Actual Value    PaymentApiUserprofile    /definition
    expect     ${definition}    >    ${0}
    ${no_speed}    Get Actual Value    PaymentApiUserprofile    /no_speed
    expect     ${no_speed}    >=    ${0}
    expect    /play_error_image    reg_match    .*    PaymentApiUserprofile
