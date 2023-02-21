FROM node:alpine as team_a

WORKDIR /var/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=team_a /var/app/build /usr/share/ngnix/html