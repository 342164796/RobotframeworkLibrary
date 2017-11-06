cd ..

mkdir Library
mkdir TestCase
mkdir TestResult
mkdir Resource

echo "install robot-framework"
pip install -r requirements.txt -i http://pypi.douban.com/simple --trusted-host=pypi.douban.com

git clone http://10.18.207.100:8001/hongxu/api_template.git ApiTemplate
git clone http://10.18.207.100:8001/hongxu/ApiTestLib.git Library\ApiTestLib
git clone http://10.18.207.100:8001/hongxu/RedisLibrary.git Library\RedisLibrary

cd Install


