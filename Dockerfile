FROM openjdk:11  
COPY ./src/main/java /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac com/mycompany/app/App.java  
CMD ["java", "com/mycompany/app/App"]  