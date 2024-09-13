# 1. Start with the base image of Node.js
FROM node:14

# 2. Set the working directory inside the container
WORKDIR /usr/src/app

# 3. Copy package.json files to install dependencies
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of the application files
COPY . .

# 6. Build the React application for production
RUN npm run build

# 7. Install serve to run the app
RUN npm install -g serve

# 8. Expose port 80
EXPOSE 80

# 9. Command to run the app using serve on port 80
CMD ["serve", "-s", "build", "-l", "80"]

