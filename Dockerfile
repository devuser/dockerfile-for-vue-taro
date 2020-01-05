FROM node:8
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

# 如下代码不适用于提交GitHub
RUN touch /dockerdata/ex_hosts  &&  \
  echo "47.92.84.245\ttencent.net" >> /dockerdata/ex_hosts &&  \
  echo "47.92.84.245\ttencent" >> /dockerdata/ex_hosts &&  \
  echo "47.92.84.245\twww.tencent.net" >> /dockerdata/ex_hosts &&  \
  echo "cat /dockerdata/ex_hosts >> /etc/hosts" >> /dockerdata/update_hosts &&  \
  echo "/etc/init.d/netfs restart" >> /dockerdata/update_hosts    &&  \
  chmod 700 /dockerdata/update_hosts  &&  \
  mkdir -p /var/root  &&  \
  chmod -R 777 /var/root  &&  \
  rm -rf /dockerdata/ex_hosts

RUN  apt-get -y update  \
  &&  apt-get -y install git curl \
  &&  mkdir -p /root/.ssh \
  &&  chmod 700 /root/.ssh


# 如下代码不适用于提交GitHub
COPY authorized_keys /root/.ssh/authorized_keys
COPY id_rsa_github /root/.ssh/id_rsa_github

COPY config /root/.ssh/config
COPY known_hosts /root/.ssh/known_hosts
RUN cd /root/.ssh   &&  \
  chmod 400 *    &&  \
  cd ..   &&  \
  chmod 700 .ssh  &&  \
  git config --global user.name "devuser" &&  \
  git config --global user.email "pythoner@icloud.com"

# # 设成淘宝的
# npm config set registry http://registry.npm.taobao.org/

# yarn config set registry http://registry.npm.taobao.org/

RUN npm i npm@latest -g \
  &&  mkdir -p /usr/local/lib/node_modules/node-sass/vendor \
  &&  chmod 777 /usr/local/lib/node_modules/node-sass/vendor  \
  # &&  cnpm install -g npm  \
  &&  npm install -g cnpm --registry=https://registry.npm.taobao.org \
  &&  cnpm install -g yarn vue@^2.6.11 react@^16.12.0 webpack@^4.41.4 webpack-cli  \
  &&  cnpm install -g babel-core  \
  &&  cnpm install -g now  \
  &&  cnpm install -g webpack-dev-server@latest \
  &&  cnpm install -g webpack-dev-middleware@latest \
  &&  cnpm install -g eslint@^6.7.2  \
  &&  cnpm install -g babel-eslint@^10.0.3 \
  &&  cnpm install -g babel-plugin-minify-dead-code-elimination  \
  &&  cnpm install -g babel-plugin-minify-guarded-expressions  \
  &&  cnpm install -g coffeescript \
  &&  cnpm install -g babel-preset-env@latest \
  &&  cnpm install -g dva-cli \
  &&  cnpm install -g umi@^2.12.7  \
  &&  cnpm install -g browserify  \
  &&  cnpm install -g browserslist@^4.3.4 \
  &&  cnpm install -g ant-design-pro-cli  \
  &&  cnpm install -g async babel-preset-react gulp-cli cheerio \
  &&  cnpm install -g create-react-app cross-env css-loader  \
  &&  cnpm install -g ejs  \
  &&  cnpm install -g ajv@^5.0.0 \
  &&  cnpm install -g ajv-keywords@2.1.1 \
  &&  cnpm install -g eslint-config-ts-standard@latest  \
  &&  cnpm install -g @typescript-eslint/eslint-plugin@latest \
  &&  cnpm install -g eslint-plugin-import@^2.18.0 \
  &&  cnpm install -g eslint-plugin-jsx-a11y@^6.2.3  \
  &&  cnpm install -g eslint-plugin-react@^7.17.0 \
  &&  cnpm install -g eslint-config-airbnb@latest  \
  &&  cnpm install -g eslint-config-standard@latest  \
  &&  cnpm install -g eslint-friendly-formatter@^4.0.1 \
  &&  cnpm install -g eslint-loader@^2.0.0 eslint-plugin-html@latest \
  &&  cnpm install -g eslint-plugin-import@^2.14.0 eslint-plugin-jsx-a11y@^6.1.1  \
  &&  cnpm install -g eslint-plugin-node@latest eslint-plugin-promise@latest \
  &&  cnpm install -g eslint-plugin-standard@^3.1.0 \
  &&  cnpm install -g extract-text-webpack-plugin@3.0.2  \
  &&  cnpm install -g eslint-watch@latest \
  &&  cnpm install -g hexo-cli@latest js-yaml@latest  \
  &&  cnpm install -g load-json-file@latest  \
  &&  cnpm install -g minimatch@^3.0.2 \
  &&  cnpm install -g mocha@latest  \
  &&  cnpm install -g postcss-loader@latest  \
  &&  cnpm install -g rollup@latest sequelize \
  &&  cnpm install -g shelljs style-loader@latest superagent@latest supervisor@latest  \
  &&  cnpm install -g typescript  \
  &&  cnpm install -g sass-loader  \
  &&  cnpm install -g tslint@^5.20.1  \
  &&  cnpm install -g tslint-config-standard@latest  \
  &&  cnpm install -g tslint-react@latest  \
  &&  cnpm install -g prettier \
  &&  cnpm install -g tslint-config-prettier@latest  \
  &&  cnpm install -g tslint-react-recommended@latest  \
  &&  cnpm install -g eslint-config-ts-standard@latest \
  &&  cnpm install -g vue-cli@latest  \
  &&  cnpm install -g @tarojs/cli@^1.3.33 \
  &&  cnpm install -g eslint-plugin-taro@latest \
  &&  cnpm install -g typings  \
  &&  cnpm install -g bower  \
  &&  typings install dt~node --global --save \
  &&  taro update self  \
  &&  apt-get clean

VOLUME ["/data/tencent"]


EXPOSE 9000 8080 8000 3000
CMD [ "node" ]
