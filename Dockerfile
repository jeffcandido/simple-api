FROM node:20.11.1-alpine3.18 AS build

USER root
RUN mkdir -p /usr/src/build
WORKDIR /usr/src/build
COPY ./src ./src
COPY ["babel.config.js", "package.json", "package-lock.json*", "tsconfig.json", "/usr/src/build/"]

RUN npm install --quiet typescript@5.3.3 -g
RUN npm install  --development --silent
RUN npm cache verify
RUN npm run clean-build
RUN npm install
RUN npm run build

RUN mkdir -p /usr/src/simple-api/src
COPY ["package.json", "package-lock.json*", "/usr/src/simple-api/"]
RUN cp -r ./dist/src/* /usr/src/simple-api/src

FROM node:20.11.1-alpine3.18
ENV NODE_ENV production
WORKDIR /usr/src/simple-api

COPY --from=build /usr/src/simple-api $WORKDIR
RUN npm ci --only=production

RUN npm install --quiet pm2@5.3.1 -g

RUN chown -R node:node /usr/src/simple-api

USER 1000

CMD ["pm2-runtime", "src/app.js", "&&", "pm2", "save"]
