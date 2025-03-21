# 서버를 구동시킬 자바를 받아옵니다.
FROM --platform=$TARGETPLATFORM openjdk:17-jdk-alpine

# 작업 디렉터리를 설정합니다.
WORKDIR /app

# `JAR_FILE` 이라는 이름으로 build 한 jar 파일을 지정합니다.
ARG JAR_FILE=./build/libs/*.jar

# 지정한 jar 파일을 app.jar 라는 이름으로 Docker Container에 추가합니다.
ADD ${JAR_FILE} app.jar

# JSP 파일이 위치할 폴더를 지정합니다. (예시로 /app/WEB-INF/jsp 폴더로 복사)
# JSP 파일을 추가하는 부분
COPY ./src/main/webapp/WEB-INF/views /app/WEB-INF/views

# 애플리케이션이 사용할 포트 명시
EXPOSE 8080

# app.jar 파일을 실행합니다.
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/app.jar"]
