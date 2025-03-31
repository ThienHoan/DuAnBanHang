# Sử dụng OpenJDK 17 và Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Đặt thư mục làm việc
WORKDIR /app

# Copy toàn bộ mã nguồn vào container
COPY . .

# Build ứng dụng bằng Maven
RUN mvn clean package

# Dùng Tomcat để chạy ứng dụng
FROM tomcat:9-jdk17

# Xóa ứng dụng mặc định trong Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR vào thư mục chạy ứng dụng
COPY --from=build /app/target/DuAnBanHang-1.0.war /usr/local/tomcat/webapps/ROOT.war


# Mở cổng 8080 để truy cập ứng dụng
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
