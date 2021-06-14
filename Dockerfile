FROM node:carbon
WORKDIR /home/cloud_user/docker_workdir
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]
