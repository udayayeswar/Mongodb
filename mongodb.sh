#!/bin/bash

 #only works on centos8 aarch64


#install mongodb
curl -s https://raw.githubusercontent.com/ChaitanyaChandra/DevOps/main/2.ANSIBLE/roles/mongodb/files/mongo.repo > /etc/yum.repos.d/mongodb-org-6.0.repo
dnf --disablerepo=AppStream install -y mongodb-org
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
systemctl restart mongod
adduser spec

curl -sL https://rpm.nodesource.com/setup_16.x | bash -

if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi

yum install nodejs -y
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi


yum install git -y
if [$? -eq  0];then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi

cd /home/spec/
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi

git clone https://github.com/udayayeswar/app.git
if [$? -eq  0];then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi
cd app/
cat package.sh | bash
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi


#db_user=udaya
#db_pass=udaya123
#
#echo Environment="MONGO_ENDPOINT=mongodb+srv://$db_user:$db_pass@cluster0.nggvzyx.mongodb.net/login-app-db?retryWrites=true&w=majority" >> files/spec.service
#if [$? -eq  0]; then
#  echo status = SUCCESS
# else
#   echo status = FAILURE
#  fi
cp files/spec.service /etc/systemd/system/
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi
systemctl start spec
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi

sudo yum install epel-release -y
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi
sudo yum install nginx -y
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi

yes | cp -rf files/nginx.conf /etc/nginx/nginx.conf
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi
yes | cp -rf files/nodejs.conf /etc/nginx/conf.d/nodejs.conf
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi
setenforce 0
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi
systemctl restart nginx
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi
# node .js > node.logs 2>&1 &
# ps -ef | grep "index.js" > run.log