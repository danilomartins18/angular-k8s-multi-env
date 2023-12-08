# build environment
FROM node:20.10-alpine as build

WORKDIR /app

COPY package*.json ./
COPY . .
RUN npm install
RUN npm run build

# production environment
FROM nginx:alpine

# RUN apt-get install bash
COPY nginx/default.conf /etc/nginx/conf.d/.
COPY nginx/gzip.conf /etc/nginx/conf.d/.
COPY nginx/nginx.conf /etc/nginx/

# RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/dist/angular-k8s-multi-env/browser /usr/share/nginx/html

EXPOSE 80

CMD [ "nginx","-g", "daemon off;"]