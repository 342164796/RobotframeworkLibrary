*** Settings ***
Resource          Resource.robot

*** Test Cases ***
已购帐号提醒
    [Documentation]    已购帐号提醒：输入参数deiviceid：861003009000023000000701bdd42435
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    PaymentApiDevidTrades
    Json Struct Compare    PaymentApiDevidTrades
    ${endtime}    Get Actual Value    PaymentApiDevidTrades    /ord_list/0/endTime
    ${endtime}    Convert to Integer    ${endtime}
    expect    ${endtime}    >    ${0}
