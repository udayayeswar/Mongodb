adduser spec

curl -sL https://rpm.nodesource.com/setup_16.x | bash -
echo status = $?

yum install nodejs -y
echo status = $?

yum install git -y
echo status = $?

cd /home/spec/
echo status = $?
git clone https://github.com/ChaitanyaChandra/app.git
echo status = $?
cd app/
cat package.sh | bash
echo status = $?

db_user=udaya
db_pass=udaya123

echo Environment="MONGO_ENDPOINT=mongodb+srv://$db_user:$db_pass@cluster0.nggvzyx.mongodb.net/login-app-db?retryWrites=true&w=majority" >> files/spec.service
echo status = $?
cp files/spec.service /etc/systemd/system/
echo status = $?
systemctl start spec
echo status = $?

sudo yum install epel-release -y
echo status = $?
sudo yum install nginx -y
echo status = $?

yes | cp -rf files/nginx.conf /etc/nginx/nginx.conf
echo status = $?
yes | cp -rf files/nodejs.conf /etc/nginx/conf.d/nodejs.conf
echo status = $?
setenforce 0
echo status = $?
systemctl restart nginx
echo status = $?
# node .js > node.logs 2>&1 &
# ps -ef | grep "index.js" > run.log
