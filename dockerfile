# Gunakan Java 21
FROM openjdk:21-jdk-slim

# Set direktori kerja
WORKDIR /minecraft

# Salin file server dan properti
COPY paper.jar .
COPY server.properties .
COPY --chown=1000:1000 plugins ./plugins/

# Auto-accept EULA
RUN echo "eula=true" > eula.txt

# Buka port default
EXPOSE 25565
EXPOSE 19132

# Jalankan Paper Server
CMD ["java", "-Xmx2G", "-Xms2G", "-jar", "paper.jar", "nogui"]

