*** Settings ***
Resource          Resource.robot

*** Test Cases ***
首页智能推荐栏目
    [Documentation]    首页推荐栏目返回值中，返回提供商和类型参数：vendor: 1011，typeCode: 1002,
    [Tags]    urgent
    load    ${VOD_DIR}/tecent/
    req    FrontpageApiRecomColumns_1
    Json Struct Compare    FrontpageApiRecomColumns_1
    expect    /masterViews/0/index    =    1    FrontpageApiRecomColumns_1
    expect    /masterViews/0/tiles/0/facets/0/vendor    =    1011    FrontpageApiRecomColumns_1
    expect    /masterViews/0/tiles/0/facets/0/typeCode    =    1002    FrontpageApiRecomColumns_1
