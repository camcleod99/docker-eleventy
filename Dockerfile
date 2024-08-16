FROM node:18
WORKDIR /usr/src/app
# Copy package.json image-side before executing run
COPY package*.json ./
RUN npm install -g @11ty/eleventy && npm install
# Copy non npm-critical files
COPY ./src ./src
COPY .eleventy.js ./
EXPOSE 8080
CMD ["npx", "eleventy", "--serve", "--port=8080"]
