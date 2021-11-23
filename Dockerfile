# First phase
# tag this phase with name
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# inside container: /app/build <--- all the stuff we care about

# Second phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html