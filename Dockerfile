FROM node:8.11
MAINTAINER devuser "pythoner@icloud.com"

RUN mkdir /dockerdata
WORKDIR /dockerdata
#
#
#
# COPY dot-zshrc /dockerdata/dot-zshrc
# ADD dot-oh-my-zsh.tar.gz /dockerdata/.oh-my-zsh
# RUN cp -rf /dockerdata/.oh-my-zsh /root
# RUN touch /root/.zshrc  \
#   && cp -rf /dockerdata/dot-zshrc /root/.zshrc  \
#   && rm -rf /dockerdata/dot-zshrc  \
#   && rm -rf /dockerdata/.oh-my-zsh

RUN eval "echo \"export TZ='Asia/Shanghai'\" >> /root/.profile" &&  \
  eval "echo \"export TS='`date -d today +"%-Y%-m%-d%k%M%S"`'\" >> /root/.profile"  &&  \
  eval "echo \"export VERSION=`date -d today +"v2.4.0.%-Y%-m%-d%-k%M%S"`\" >> /root/.profile" &&  \
  ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&  \
  echo "Permit to access the special folder"  &&  \
  mkdir -p /usr/local/lib/node_modules  &&  \
  chmod -R 777  /usr/local/lib/node_modules
  #   &&  \
  # touch /dockerdata/ex_hosts  &&  \
  # echo "47.92.84.245\tboyosoft.net" >> /dockerdata/ex_hosts &&  \
  # echo "47.92.84.245\tboyosoft" >> /dockerdata/ex_hosts &&  \
  # echo "47.92.84.245\twww.boyosoft.net" >> /dockerdata/ex_hosts &&  \
  # echo "cat /dockerdata/ex_hosts >> /etc/hosts" >> /dockerdata/update_hosts &&  \
  # echo "/etc/init.d/netfs restart" >> /dockerdata/update_hosts    &&  \
  # chmod 700 /dockerdata/update_hosts  &&  \

  # mkdir -p /var/root  &&  \
  # chmod -R 777 /var/root  &&  \
  # rm -rf /dockerdata/ex_hosts

RUN  apt-get -y update  \
  &&  apt-get -y install git curl \
  &&  mkdir -p /root/.ssh \
  &&  chmod 700 /root/.ssh


# COPY authorized_keys /root/.ssh/authorized_keys
# COPY id_rsa_github /root/.ssh/id_rsa_github
#
# COPY config /root/.ssh/config
# COPY known_hosts /root/.ssh/known_hosts
# RUN cd /root/.ssh   &&  \
#   chmod 400 *    &&  \
#   cd ..   &&  \
#   chmod 700 .ssh  &&  \
#   git config --global user.name "devuser" &&  \
#   git config --global user.email "pythoner@icloud.com"

# # 设成淘宝的
# npm config set registry http://registry.npm.taobao.org/

# yarn config set registry http://registry.npm.taobao.org/

RUN npm i npm@latest -g \
  &&  npm install -g npm  \
  &&  npm install -g yarn vue@^2.6.4 react@^16.8.1 webpack@^4.29.3 webpack-cli  \
  &&  npm install -g babel-core  \
  &&  npm install -g webpack-dev-server@latest \
  &&  npm install -g webpack-dev-middleware@latest \
  &&  npm install -g eslint@^4.15.0  \
  &&  mkdir -p /usr/local/lib/node_modules/node-sass/vendor \
  &&  chmod 777 /usr/local/lib/node_modules/node-sass/vendor  \
  &&  npm install -g babel-eslint@^8.2.3 \
  &&  npm install -g babel-plugin-minify-dead-code-elimination  \
  &&  npm install -g babel-plugin-minify-guarded-expressions  \
  &&  npm install -g coffeescript \
  &&  npm install -g babel-preset-env@latest \
  &&  npm install -g dva-cli \
  &&  npm install -g umi@^2.4.4  \
  &&  npm install -g browserify  \
  &&  npm install -g browserslist@^4.3.4 \
  &&  npm install -g ant-design-pro-cli  \
  &&  npm install -g async babel-preset-react gulp-cli cheerio \
  &&  npm install -g coffeescript  \
  &&  npm install -g create-react-app cross-env css-loader  \
  &&  npm install -g ejs  \
  &&  npm install -g ajv@^5.0.0 \
  &&  npm install -g ajv-keywords@2.1.1 \
  &&  npm install -g eslint-config-ts-standard@latest  \
  &&  npm install -g @typescript-eslint/eslint-plugin@latest \
  &&  npm install -g eslint-config-airbnb@latest  \
  &&  npm install -g eslint-config-standard@latest  \
  &&  npm install -g eslint-friendly-formatter@^4.0.1 \
  &&  npm install -g eslint-loader@^2.0.0 eslint-plugin-html@latest \
  &&  npm install -g eslint-plugin-import@^2.14.0 eslint-plugin-jsx-a11y@^6.1.1  \
  &&  npm install -g eslint-plugin-node@latest eslint-plugin-promise@latest \
  &&  npm install -g eslint-plugin-react@^7.12.3 eslint-plugin-standard@^3.1.0 \
  &&  npm install -g extract-text-webpack-plugin@3.0.2  \
  &&  npm install -g eslint-watch@latest \
  &&  npm install -g hexo-cli@latest js-yaml@latest  \
  &&  npm install -g load-json-file@latest  \
  &&  npm install -g minimatch@^3.0.2 \
  &&  npm install -g mocha@latest  \
  &&  npm install -g postcss-loader@latest  \
  &&  npm install -g rollup@latest sequelize \
  &&  npm install -g shelljs style-loader@latest superagent@latest supervisor@latest  \
  &&  npm install -g typescript@^3.3.3  \
  &&  npm install -g tslint@^5.12.1  \
  &&  npm install -g tslint-config-standard@latest  \
  &&  npm install -g tslint-react@latest  \
  &&  npm install -g tslint-config-prettier@latest  \
  &&  npm install -g tslint-react-recommended@latest  \
  &&  npm install -g eslint-config-ts-standard@latest \
  &&  npm install -g vue-cli@latest  \
  &&  npm install -g @tarojs/cli@^1.2.12  \
  &&  npm install -g eslint-plugin-taro@latest \
  &&  taro update self  \
  &&  apt-get clean

VOLUME ["/data/boyosoft"]


EXPOSE 9000 8080 8000 3000
CMD [ "node" ]
