FROM node/vuetaro
MAINTAINER devuser "pythoner@icloud.com"
RUN npm install -g eslint@^4.15.0  \
  &&  npm install -g yarn vue@^2.6.4 react@^16.8.1 webpack@^4.29.3 webpack-cli  \
  &&  npm install -g typescript@^3.3.3  \
  &&  npm install -g @tarojs/cli@^1.2.12  \
  &&  npm install -g babel-eslint@^8.2.3 \
  &&  npm install -g umi@^2.4.4  \
  &&  npm install -g @tarojs/cli@^1.2.12  \
  &&  npm install -g eslint-plugin-taro@latest \
  &&  taro update self  \
  &&  apt-get clean

VOLUME ["/data/boyosoft"]


EXPOSE 9000 8080 8000 3000
CMD [ "node" ]
