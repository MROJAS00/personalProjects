FROM ubuntu:latest
WORKDIR /app
RUN \
# Update
apt-get update -y && \
# Install Java
apt-get install default-jre -y && \
apt install maven -y
ADD . .
EXPOSE 8080
RUN mvn clean install
CMD java -jar ./target/serving-web-content-complete-0.0.1-SNAPSHOT.jar