*** Settings ***
Resource          Resource.robot

*** Variables ***
${searchkey}      LYB

*** Test Cases ***
搜索热词
    [Documentation]    获取搜索热词,首字母：LYB,显示匹配结果
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    SearchApiHotwords_1    search_key=${searchkey}
    Get Actual Response    SearchApiHotwords_1
    ${totalstr}    Get Actual Value    SearchApiHotwords_1    /total
    #${totalstr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${0}
    expect    /words/0/hot_words    equal    ${searchkey}    SearchApiHotwords_1

默认搜索热词
    [Documentation]    显示默认搜索热词，电视剧2个，电影2个，综艺2个，动漫2个
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    SearchApiHotwords_1
    Json Struct Compare    SearchApiHotwords_1
    # SELECT h.id,h.hot_words FROM hotwords h WHERE EXISTS( SELECT * FROM basic_media bm WHERE bm.available>0 AND bm.vender_online >0 AND bm.id = h.media_id) AND h.category_id =1004ORDER BY h.search_index DESC LIMIT 1
    Expect    /words/0/category_id    equal    1001    SearchApiHotwords_1
    Expect    /words/1/category_id    equal    1001    SearchApiHotwords_1
    Expect    /words/2/category_id    equal    1004    SearchApiHotwords_1
    Expect    /words/3/category_id    equal    1004    SearchApiHotwords_1
    Expect    /words/4/category_id    equal    1002    SearchApiHotwords_1
    Expect    /words/5/category_id    equal    1002    SearchApiHotwords_1
    Expect    /words/6/category_id    equal    1005    SearchApiHotwords_1
    Expect    /words/7/category_id    equal    1005    SearchApiHotwords_1
    ${totalstr}    Get Actual Value    SearchApiHotwords_1    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${7}

根据首字母进行搜索
    [Documentation]    根据首字母进行搜索LYB,有相匹配的结果
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    SearchApiGetResult_1    search_key=${searchkey}
    Json Struct Compare    SearchApiGetResult_1
    ${total}    Get Actual Value    SearchApiGetResult_1    /total
    Expect    ${total}    >    ${0}
    Expect    /search_key    equal    ${searchkey}    SearchApiGetResult_1

根据热词搜索
    [Documentation]    根据热词进行搜索
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    SearchApiGetResult_2
    ${resonse}    Get Actual Response    SearchApiGetResult_2
    Json Struct Compare    SearchApiGetResult_2
    ${totalstr}    Get Actual Value    SearchApiGetResult_2    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${2}

根据首字母+筛选搜索
    [Documentation]    根据首字母+筛选进行搜索 ，筛选条件为电影
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    SearchApiGetResult_3
    ${resonse}    Get Actual Response    SearchApiGetResult_3
    Json Struct Compare    SearchApiGetResult_3
    ${totalstr}    Get Actual Value    SearchApiGetResult_3    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${2}

根据热词+筛选搜索
    [Documentation]    根据热词+筛选进行搜索 ，筛选条件为电影
    [Tags]    urgent
    load    ${VOD_DIR}/wasu/
    req    SearchApiGetResult_4
    ${resonse}    Get Actual Response    SearchApiGetResult_4
    Json Struct Compare    SearchApiGetResult_4
    ${totalstr}    Get Actual Value    SearchApiGetResult_4    /total
    ${totalr}    Convert to Integer    ${totalstr}
    expect    ${totalstr}    >    ${2}
