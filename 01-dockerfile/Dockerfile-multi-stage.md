
# layer 1
FROM node as prod 
ENV NODE_ENV=production
COPY
RUN
COPY
CMD ['node','./bin/www']
# layer 2
FROM prod as dev
ENV NODE_ENV=development
# CMD ['nodemon','./bin/www','--inspect=0.0.0.0:9229']
CMD ['../node_modules/nodemon/bin/nodemon.js','./bin/www','--inspect=0.0.0.0:9229']

# layer 3
FROM dev as test
ENV NODE_ENV=ci
# solution for CI. image is built if tests are passed
# CMD ['npm','test']
RUN npm test


# Build dev image from dev stage
docker build -t myapp .
# Build prod image w/ tag prod from prod stage
docker build -t myapp:prod --target prod .
# w/o tini it doesn't work ctrl+C 
docker build -t myapp:prod --target prod . && docker run myapp:prod
# --init to inject tini for dev
docker build -t myapp:dev --target dev . && docker run --init -p 80:3000 myapp:dev

# --init to inject tini for test
docker build -t myapp:test --target test . && docker run --init myapp:test