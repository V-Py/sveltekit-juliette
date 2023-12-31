FROM node:20.10-alpine AS sk-build
WORKDIR /usr/src/app

ARG tz=Europe/Stockholm  # Use lowercase variable name

COPY . /usr/src/app
RUN apk --no-cache add curl tzdata
RUN cp /usr/share/zoneinfo/$tz /etc/localtime && echo $tz > /etc/timezone
RUN npm install
RUN npm run build

FROM node:20.10-alpine
WORKDIR /usr/src/app

ARG tz=Europe/Stockholm  # Use lowercase variable name
RUN apk --no-cache add curl tzdata
RUN cp /usr/share/zoneinfo/$tz /etc/localtime && echo $tz > /etc/timezone

COPY --from=sk-build /usr/src/app/package.json /usr/src/app/package.json
COPY --from=sk-build /usr/src/app/package-lock.json /usr/src/app/package-lock.json

COPY --from=sk-build /usr/src/app/build /usr/src/app/build

EXPOSE 3000
CMD ["node", "build/index.js"]
