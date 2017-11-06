*** Settings ***
Resource          Resource.robot

*** Test Cases ***
获取电视剧分类栏目信息
    [Documentation]    电视剧分类栏目信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiColumnFilters1002020100_1
    Path    CategoryApiColumnFilters1002020100_1    5=1_0_100
    Get Actual Response    CategoryApiColumnFilters1002020100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /total
    ${totalrow}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /masterViews/0/total
    expect    ${totalstr}    >    ${3}
    expect    /masterViews/0/index    =    1    CategoryApiColumnFilters1002020100_1
    expect    ${totalrow}    >    ${0}

获取电影分类栏目信息
    [Documentation]    电影分类栏目信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiColumnFilters1002020100_1
    Path    CategoryApiColumnFilters1002020100_1    5=3_0_100
    Get Actual Response    CategoryApiColumnFilters1002020100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /total
    ${totalrow}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /masterViews/0/total
    expect    ${totalstr}    >    ${3}
    expect    /masterViews/0/index    =    1    CategoryApiColumnFilters1002020100_1
    expect    ${totalrow}    >    ${0}

获取综艺分类栏目信息
    [Documentation]    综艺分类栏目信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiColumnFilters1002020100_1
    Path    CategoryApiColumnFilters1002020100_1    5=4_0_100
    Get Actual Response    CategoryApiColumnFilters1002020100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /total
    ${totalrow}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /masterViews/0/total
    expect    ${totalstr}    >    ${3}
    expect    /masterViews/0/index    =    1    CategoryApiColumnFilters1002020100_1
    expect    ${totalrow}    >    ${0}

爱奇艺VIP专区获取分类栏目信息
    [Documentation]    爱奇艺VIP专区获取分类栏目信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiColumnFilters1002020100_1
    Path    CategoryApiColumnFilters1002020100_1    5=100201_0_100
    Get Actual Response    CategoryApiColumnFilters1002020100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /total
    ${totalrow}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /masterViews/0/total
    expect    ${totalstr}    >    ${3}
    expect    /masterViews/0/index    =    1    CategoryApiColumnFilters1002020100_1
    expect    ${totalrow}    >    ${0}
    expect    /filter_id    =    100201    CategoryApiColumnFilters1002020100_1

华数专区获取分类栏目信息
    [Documentation]    华数VIP专区获取分类栏目信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiColumnFilters1002020100_1
    Path    CategoryApiColumnFilters1002020100_1    5=100202_0_100
    Get Actual Response    CategoryApiColumnFilters1002020100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /total
    ${totalrow}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /masterViews/0/total
    expect    ${totalstr}    >    ${3}
    expect    /masterViews/0/index    =    1    CategoryApiColumnFilters1002020100_1
    expect    ${totalrow}    >    ${0}

信封套餐专区获取分类栏目信息
    [Documentation]    爱奇艺VIP专区获取分类栏目信息
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    CategoryApiColumnFilters1002020100_1
    Path    CategoryApiColumnFilters1002020100_1    5=100206_0_100
    Get Actual Response    CategoryApiColumnFilters1002020100_1
    ${totalstr}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /total
    ${totalrow}    Get Actual Value    CategoryApiColumnFilters1002020100_1    /masterViews/0/total
    expect    ${totalstr}    >    ${3}
    expect    /masterViews/0/index    =    1    CategoryApiColumnFilters1002020100_1
    expect    ${totalrow}    >    ${0}
