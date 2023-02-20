adduser spec

curl -sL https://rpm.nodesource.com/setup_16.x | bash -
yum install nodejs -y
yum install git -y
cd /home/spec/
git clone https://github.com/udayayeswar/Mongodb.git
cd app/
cat package.sh | bash
db_user=udaya
db_pass=udaya123
echo Environment="MONGO_ENDPOINT=mongodb+srv://$db_user:$db_pass@cluster0.nggvzyx.mongodb.net/login-app-db?retryWrites=true&w=majority" >> files/spec.service
cp files/spec.service /etc/systemd/system/
systemctl start spec
sudo yum install epel-release -y
sudo yum install nginx -y
yes | cp -rf files/nginx.conf /etc/nginx/nginx.conf
yes | cp -rf files/nodejs.conf /etc/nginx/conf.d/nodejs.conf
setenforce 0

systemctl restart nginx
# node .js > node.logs 2>&1 &
# ps -ef | grep "index.js" > run.log
