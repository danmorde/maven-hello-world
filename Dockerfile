# Dockerfile
FROM openjdk:8

ARG CONTAINER_ID
ARG REPO_URL

ENV Container_Url "$REPO_URL/../../../_apis/resources/Containers/$CONTAINER_ID?itemPath=drop%2Fmy-app%2Ftarget%2Fmy-app-1.0-SNAPSHOT.jar"

RUN echo $Container_Url

RUN mkdir -p /usr/share/my-app \ 
  && cd /usr/share/my-app \
  && curl -o app.jar.gz -u danmorde2@outlook.com:ehecs7nc67hqlla4runysdjdxogilqe6gdqiwg5l5z73suljcz2q $Container_Url \
  && gunzip app.jar.gz

# run application with this command line 
RUN java -jar /usr/share/my-app/app.jar > /tmp/prog.log \
    && echo $(cat /tmp/prog.log)
