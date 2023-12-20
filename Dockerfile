# build environment
FROM node:20.10-alpine as build

WORKDIR /app

COPY package*.json ./
COPY . .
RUN npm install
RUN npm run build

# production environment
FROM nginx:alpine

# RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/dist/angular-k8s-multi-env/browser /usr/share/nginx/html

# RUN apt-get install bash
COPY --from=build /app/nginx/nginx.conf /etc/nginx/
COPY --from=build /app/nginx/default.conf /etc/nginx/conf.d/


EXPOSE 80

CMD [ "nginx","-g", "daemon off;"]