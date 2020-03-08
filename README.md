# README
## Project Overview

This is a simple Spring Boot application for basic user authentication.
This particular project uses Java 11 and Gradle.
User authentication is done with JDBC authentication.
Postgres (version 12.2 at time of writing) is used as the database, but any relational database should work.

## JDBC Authentication Setup
### Postgres Setup

Before starting, make sure to have Postgres running (e.g. locally, on docker, etc.).
For instance, to run Postgres on docker, you can do:
`docker run --name some-postgres -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -d postgres`

## Application Setup
### Application Properties
To run this project, you can either set the necessary environment variables or modify the application.properties values.
In a production setting, you should use environment variables to not hard-code sensitive information.

- `POSTGRES_USERNAME`
- `POSTGRES_PASSWORD`
- `FLYWAY_ADMIN_USERNAME`
- `FLYWAY_ADMIN_PASSWORD`

This project uses a localhost database connection, but that can be changed in the
[application.properties](./src/main/resources/application.properties).

The postgres credentials are used for connecting to the target database.

The flyway properties are used for creating the initial admin account.
An initial user (non-admin) will also be created.

### Running the Application

To run the application, you can either use your IDE or utilize the gradle wrapper on the command line:
```
# cd into the project directory
./gradlew bootRun
```
*Note: make sure to have your JAVA_HOME environment variable set.*

#### Verify Application Runs Properly

Open your browser and go to `localhost:8080/principal`. You should be prompted to login.

You can either login with the `FLYWAY_ADMIN_USERNAME` and `FLYWAY_ADMIN_PASSWORD` environment variables you defined or
with username `reader` and password `reader`.

You should then see information about the account you logged in with.

## Schema and Flyway Migrations

Flyway is used for version controlling the database and performing database migrations.
There are two migration sql scripts:
- [V1__addUsersAndAuthorities.sql](./src/main/resources/db/migration/V1__addUsersAndAuthorities.sql)
- [V2__addDefaultUsers.sql](./src/main/resources/db/migration/V2__addDefaultUsers.sql)

The first creates the tables we will need for authentication.
The second will add our initial users (one admin user and one regular user).

*Note: information about Flyway can be found on the [Flyway website](https://flywaydb.org).*

### Authentication Schema

The table schema used is based off Spring Security's [JDBC Authentication Default
Schema](https://docs.spring.io/spring-security/site/docs/current/reference/html/appendix.html#user-schema).

The [V1__addUsersAndAuthorities.sql](./src/main/resources/db/migration/V1__addUsersAndAuthorities.sql) migration
file contains the SQL for generating the `users` and `authorities` tables used for authentication. The `password`
column of the users table was increased to accommodate passwords encrypted by the `BCryptPasswordEncoder`.

### Adding Initial Users

**Disclaimer:** managing users, groups, and roles through the database you own is a better approach than using
Flyway migration script, but this migration file is helpful for informational purposes.

The [V2__addDefaultUsers.sql](./src/main/resources/db/migration/V2__addDefaultUsers.sql) migration file will
add an admin user (with ROLE_ADMIN and ROLE_USER) and a regular user (with just ROLE_USER).
The credentials for these users are provided via placeholders defined in
[application.properties](./src/main/resources/application.properties).

