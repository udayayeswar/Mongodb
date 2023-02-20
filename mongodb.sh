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

git clone https://github.com/udayayeswar/Mongodb.git
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


db_user=udaya
db_pass=udaya123

echo Environment="MONGO_ENDPOINT=mongodb+srv://$db_user:$db_pass@cluster0.nggvzyx.mongodb.net/login-app-db?retryWrites=true&w=majority" >> files/spec.service
if [$? -eq  0]; then
  echo status = SUCCESS
 else
   echo status = FAILURE
  fi
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
