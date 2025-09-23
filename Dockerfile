FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


FROM httpd:2.4-alpine AS runtime

WORKDIR /usr/local/apache2/htdocs/

COPY --from=build /app/dist/ .

ARG SERVER_NAME=localhost
RUN echo "ServerName ${SERVER_NAME}" >> /usr/local/apache2/conf/httpd.conf

EXPOSE 80
CMD ["httpd-foreground"]