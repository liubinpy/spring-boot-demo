# First stage: complete build environment
FROM uhub.service.ucloud.cn/mydockerhub.io/maven:3.5.0-jdk-8-alpine	 AS builder

# source code
ADD . .

# package jar
RUN mvn clean package

# Second stage: minimal runtime environment
FROM uhub.service.ucloud.cn/uhub.gcr.io/openjdk:11

# copy jar from the first stage
COPY --from=builder target/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE  80
ENTRYPOINT ["java","-jar","/app.jar"]
