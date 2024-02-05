# Stage 1 : Build
# Amazon Corretto OpenJDK의 이미지 버전을 17로 설정 및 builder라는 이름으로 이미지 스테이징
FROM amazoncorretto:17-alpine-jdk AS builder

# 작업 디렉토리를 /app으로 설정
WORKDIR /app
# 현재 디렉토리의 파일을 /app 으로 복사
COPY gradlew build.gradle settings.gradle ./
COPY gradle ./gradle
COPY src ./src
# Jar 파일을 생성
RUN ./gradlew bootJar

# Stage 2 : Run
# 실행을 위해 Amazon Corretto OpenJDK의 이미지 버전을 17로 설정
FROM amazoncorretto:17-alpine-jdk

# 작업 디렉토리를 /app으로 설정
WORKDIR /app
# builder에서 스테이징한 이미지를 /app으로 복사
COPY --from=builder /app/build/libs/*.jar /app/app.jar

# 포트 매칭 : 사용하는 port 명시
EXPOSE 8080
# app.jar를 실행
ENTRYPOINT java -jar /app/app.jar
