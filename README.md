# README
## Project Overview

This is a simple Spring Boot application for basic user authentication.
User authentication is done with JDBC authentication.
This particular project uses Java 11 and Gradle.

## JDBC Authentication Setup
### Run Postgres

Before starting, make sure to have Postgres running (e.g. locally, on docker, etc.).
For instance, to run Postgres on docker, you can do:
`docker run --name some-postgres -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -d postgres`

### Schema

Schema is based off Spring Security's [JDBC Authentication Default
Schema](https://docs.spring.io/spring-security/site/docs/current/reference/html/appendix.html#user-schema).