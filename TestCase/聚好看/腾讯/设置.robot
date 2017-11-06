*** Settings ***
Resource          Resource.robot

*** Test Cases ***
播放器错提示下发
    [Tags]    High
    Load    ${VOD_DIR}/tecent/
    req    errormap_1
    expect    /errcode    reg_match    .*

用户反馈
    [Tags]    High
    Load    ${VOD_DIR}/tecent/
    req    feedback_1
    expect    /feedbacklist    reg_match    .*
