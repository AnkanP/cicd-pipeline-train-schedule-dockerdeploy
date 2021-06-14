FROM node:carbon
WORKDIR /home/cloud_user/agent_workspace
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]
