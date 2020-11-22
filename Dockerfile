FROM node:alpine
WORKDIR '/app/'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#will expose the proper port in prod environment on AWS EBS. Not relevant for local deploy.
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
