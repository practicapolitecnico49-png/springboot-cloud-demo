# Usamos una imagen base con Java 17
FROM eclipse-temurin:17-jdk-alpine

# Directorio dentro del contenedor
WORKDIR /app

# Copiamos pom.xml y el código fuente al contenedor
COPY pom.xml .
COPY src ./src
COPY mvnw .
COPY .mvn .mvn

# Instalamos dependencias y construimos el .jar
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Exponemos el puerto de Spring Boot
EXPOSE 8080

# Comando para arrancar la app
CMD ["sh", "-c", "java -jar target/*.jar"]