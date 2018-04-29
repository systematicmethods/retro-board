FROM node:9.11

LABEL maintainer="peter@systematicmethods.com"

RUN groupadd -g 1010 appuser && \
    useradd -rm -u 1010 -g appuser appuser

USER appuser

WORKDIR /home/appuser

ADD . .
RUN yarn \
  && npm run build

EXPOSE 8080

CMD [ "npm", "start" ]
