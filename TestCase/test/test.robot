*** Settings ***
Resource          vodtest.robot

*** Test Cases ***
test1
    ${result}    get    ${media}    subscriberId=8715326&customerId=4810106
    Log    ${result.status_code}
    ${image}    get value from json    ${result.text}    /rows
    Log    ${image}
    should be equal as integers    ${image}    30

test2
    connect to mysql    10.18.207.39    root    mysql    vod
    ${r}    get value from mysql    select title from basic_media where id=1
    #${a}    convert to string    ${r}
    log    ${r}
    should be equal    ${r}    一路夜蒲
    #should be equal    ${a}    1001L
