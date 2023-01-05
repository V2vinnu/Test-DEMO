FROM maven as build
WORKDIR /app
COPY . .
RUN mvn clean install


FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/target/Uber.jar /app
EXPOSE 9090
RUN ["java","-jar","Uber.jar"]