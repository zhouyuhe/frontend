FROM node:alpine as builder
WORKDIR './app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## from statement start at each block
FROM nginx
## copy from the other builder
COPY --from=builder /app/build /usr/share/nginx/html