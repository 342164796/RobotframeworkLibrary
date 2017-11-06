*** Settings ***
Resource          Resource.robot

*** Test Cases ***
专题内封装专区信息下发
    [Documentation]    对于专题内配置封装专区信息下发进行校验
    [Tags]    urgent,smoke
    Load    ${VOD_DIR}/tecent/
    req    topicvip_1
    expect    /is_new    =    1    topicvip_1
    expect    /total    =    7    topicvip_1
    expect    /medias/0/title    reg_match    企鹅影院    topicvip_1
    expect    /medias/0/package_vip_info/package_vip_id    =    1    topicvip_1
    expect    /medias/0/type_code    =    6006    topicvip_1
    expect    /medias/0/id    =    101101    topicvip_1
    expect    /medias/4/title    reg_match    信封专区    topicvip_1
    expect    /medias/4/package_vip_info/package_vip_id    =    4    topicvip_1
    expect    /medias/4/type_code    =    6006    topicvip_1
    expect    /medias/4/id    =    101105    topicvip_1
