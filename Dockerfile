FROM azul/zulu-openjdk:17
VOLUME /tmp
EXPOSE 8888
ADD ./target/springboot-config-service-0.0.1-SNAPSHOT.jar config-server.jar
ENTRYPOINT ["java","-jar","/config-server.jar"]