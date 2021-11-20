# Getting Started

### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.6.0-SNAPSHOT/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/2.6.0-SNAPSHOT/maven-plugin/reference/html/#build-image)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/docs/2.5.5/reference/htmlsingle/#using-boot-devtools)

### Guides
The following guides illustrate how to use some features concretely:

* [Centralized Configuration](https://spring.io/guides/gs/centralized-configuration/)

## Create the jar file
./mvnw package -DskipTests


## Docker
### Create a Dockerfile
FROM azul/zulu-openjdk:17
EXPOSE 8888
RUN mkdir -p -v /Users/joan/Workspace/config
COPY ./target/*.properties /Users/joan/Workspace/config
COPY ./target/.git /Users/joan/Workspace/config
WORKDIR /tmp
ADD ./target/springboot-config-service-0.0.1-SNAPSHOT.jar /config-server.jar
ENTRYPOINT ["java","-jar","/config-server.jar"]

### Build a docker image (for Mac M1 platform)
docker build --platform linux/arm64 -t config-server:1.0.0 .

### Create a network
docker network create springcloud-network

### Run docker container
_Single instance on a concrete port_
docker run -p 8888:8888 --name config-server --network springcloud-network config-server:1.0.0

_Multiple instances on a random ports -> capital -P_
docker run -P --name config-server --network springcloud-network config-server:1.0.0

