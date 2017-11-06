*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取剧集广告列表
    [Documentation]    获取剧集广告列表
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    AppadvertApiAdlist_1
    Get Actual Response    AppadvertApiAdlist_1
    ${appversion}    Get Actual Value    AppadvertApiAdlist_1    /advert_list/0/appversion
    ${is_goto}    Get Actual Value    AppadvertApiAdlist_1    /advert_list/0/is_goto
    ${duration}    Get Actual Value    AppadvertApiAdlist_1    /advert_list/0/duration
    ${app_package_name}    Get Actual Value    AppadvertApiAdlist_1    /advert_list/0/app_package_name
    Connect to Database Using Custom Params    pymysql    ${WASU_VOD_MY_DB}
    @{count}    Query    SELECT COUNT(*) \ FROM \ app_advert p WHERE p.appversion = '${appversion}' \ \ AND p.deleted =0 \ AND p.is_goto = '${is_goto}' \ \ AND \ p.duration = '${duration}' \ \ AND \ p.app_package_name='${app_package_name}'
    expect    @{count[0]}[0]    =    1
