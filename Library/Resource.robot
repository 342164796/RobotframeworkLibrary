*** Settings ***
Library           ApiTestLib.har
Library           ApiTestLib.basicservice
Library           DatabaseLibrary
Library           HttpLibrary.HTTP
Library           XML

*** Variables ***
# 模板路径
${TEM_DIR}        F:/ApiTest_install/ApiTemplate
${SHOPPING_DIR}    ${TEM_DIR}/shopping
${APPSTORE_DIR}    ${TEM_DIR}/appstore
${BASIC_DIR}      ${TEM_DIR}/basic
${EDU_DIR}        ${TEM_DIR}/edu
${MOBILE_DIR}     ${TEM_DIR}/mobile
${PLAY_DIR}       ${TEM_DIR}/play
${VOD_DIR}        ${TEM_DIR}/vod
# 数据库
${HITV_ORA_DB}    'hitv','hitv2009','(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.18.207.59)(PORT=1521)))(CONNECT_DATA=(SID=hitv)))'
${CAOPR_ORA_DB}    'caopr','caopr2009','(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.18.207.59)(PORT=1521)))(CONNECT_DATA=(SID=hitv)))'
${CACHEDB_ORA_DB}    'cachedb','cachedb','(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=10.18.207.59)(PORT=1521)))(CONNECT_DATA=(SID=hitv)))'
${SHOPPING_MY_DB}    database='shopping', user='root', password='hitv', host='10.18.207.83', port=3306
${LOG_MY_DB}      database='logpolicy',user='hitv',password='hitv',host='10.18.201.146',port=3306
${WASU_VOD_MY_DB}    database='vod',user='root',password='mysql',host='10.18.207.39',port=3306
${TECENT_VOD_MY_DB}    database='vod',user='root',password='mysql',host='10.18.207.47',port=3306
