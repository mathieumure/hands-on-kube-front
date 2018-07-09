FROM node:8-alpine AS builder

WORKDIR /app

# Install dependencies
COPY . .
RUN rm -rf node_modules
RUN yarn install
RUN yarn cache clean

RUN yarn build


# ---


# runner container
#  - nginx, to serve static built Vue app

# Use an official nginx image
FROM nginx:stable-alpine

# COPY dist from builder container to nginx html dir
COPY --from=builder /app/dist /usr/share/nginx/html

#COPY config/nginx.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80