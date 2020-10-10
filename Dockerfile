# build stage
FROM node:lts-alpine AS build-stage
WORKDIR /<app-name>
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN npm prune --production

# production stage
FROM nginx:stable-alpine AS production-stage
COPY --from=build-stage /<app-name>/dist /usr/share/nginx/html
COPY --from=build-stage /<app-name>/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
