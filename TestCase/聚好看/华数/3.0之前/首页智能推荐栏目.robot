*** Settings ***
Resource          Resource.robot

*** Test Cases ***
首页智能推荐栏目
    [Documentation]    首页推荐栏目返回第一项：标签参数，index：18
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    FrontpageApiRecomcoulumns_1    version=99.999.999    model_id=999
    Get Actual Response    FrontpageApiRecomcoulumns_1
    ${first_index}    Get Actual Value    FrontpageApiRecomcoulumns_1    /masterViews/0/index
    ${first_index}    Convert to Integer    ${first_index}
    expect    ${first_index}    >    ${0}
    expect    /masterViews/0/index    =    18    FrontpageApiRecomcoulumns_1
    expect    /masterViews/1/index    =    19    FrontpageApiRecomcoulumns_1
    expect    /masterViews/2/index    =    20    FrontpageApiRecomcoulumns_1
    expect    /masterViews/3/index    =    21    FrontpageApiRecomcoulumns_1
    expect    /masterViews/4/index    =    22    FrontpageApiRecomcoulumns_1
    expect    /masterViews/5/index    =    23    FrontpageApiRecomcoulumns_1
