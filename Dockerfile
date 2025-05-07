version: '3.8'

services:
  mysql:
    image: mysql:8.0
    container_name: blogg-mysql
    env_file:
      - .env
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql
      - ./init_blogg_schema.sql:/docker-entrypoint-initdb.d/init_blogg_schema.sql:ro
    networks:
      - blogg-net

  blogg-app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: blogg-app
    env_file:
      - .env
    ports:
      - "8080:8080"
    depends_on:
      - mysql
    networks:
      - blogg-net

volumes:
  mysql_data:

networks:
  blogg-net:
