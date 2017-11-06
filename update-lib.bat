rem cd ApiTemplate
rem git pull

rem cd ..

rem cd Library\ApiTestLib
rem git pull

rem echo %~f0
echo "update install lib"
git pull

echo "update robot lib"
pip install -r requirements.txt -v -i http://pypi.douban.com/simple --trusted-host=pypi.douban.com

echo "update ApiTestLib"
cd .\Library\ApiTestLib
git pull
cd ..\..\

echo "update RedisLibrary"
cd .\Library\RedisLibrary
git pull
cd ..\..\

echo "update ApiTemplate"
cd .\ApiTemplate
git pull
