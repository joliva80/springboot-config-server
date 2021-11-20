FROM azul/zulu-openjdk:17
EXPOSE 8888
RUN mkdir -p -v /Users/joan/Workspace/config
RUN mkdir -p -v /Users/joan/Workspace/config/.git
COPY ./target/config/* /Users/joan/Workspace/config
COPY ./target/config/.git/* /Users/joan/Workspace/config/.git
WORKDIR /tmp
ADD ./target/springboot-config-service-0.0.1-SNAPSHOT.jar /config-server.jar
ENTRYPOINT ["java","-jar","/config-server.jar"]
