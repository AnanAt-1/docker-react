# Multi-Steps Build Process
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
copy --from=builder /app/build /usr/share/nginx/html
# In order to build the docker image
# RUN: sudo build .
# In order ro start the nginx container:
# RUN: sudo docker run -p 8080:80 <docker_image id>
