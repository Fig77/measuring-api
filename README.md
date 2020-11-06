
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
# API developer version readme - 

## Introduction

This API works as a support for tracking systems. Allows creating users, with two default roles (Admin and User), to create items to measure and measurements.

## ReadMe disclaimer

This ReadMe is the current documentation during the development process, will not be de final version, information might be missing or pending to add, as well as proper formatting and overall API doc. rubocop errors are warning are not completely clean at this point.

## Index
- [Current Features](#current-features-applied)
- [Quick start](#quickstart)
- [Roles and end point](#roles-claim)

## Current Features applied

- RESTful api.
- Deploy version on heroku.
- Users management.
- Items to measure and measurements management.
- Secret/token api key.
- Rspec testing.
- Postgres database.
- Admin default behavior.
## Missing:
* serialization.
* Additional scopes might be added.
* Additional Queries for getting specific dates and other target data.

## Quickstart
*RUBY VERSION USED IN DEVELOPMENT WAS 2.7.1*
- Install ruby version 2.7.X+ and set it with your ruby environment manager
  ([more info here](https://www.ruby-lang.org/en/documentation/installation/)).

- Install Postgres and start the PostgreSQL server in the foreground
  ([more info here](https://wiki.postgresql.org/wiki/Detailed_installation_guides)).

- Clone the repository and get inside it:

```
git clone 

```

- Create a postgres role to let rails manage the db:

```
rails db:create
```

- Setup the gems and databases:

```
bundle install
```

```

rails db:migrate
```

- Run tests:

```
rspec .
```

- To start server

```
rails s
```

Locally the system resources can be accessed at the local base URL, check console output to see where is it mounted. Ej:

```
http://localhost:3000
```

## Documentation

### Authentication

Authentication is performed using JSON Web Tokens. JSON Web Tokens are an open, industry-standard [RFC 7519](https://tools.ietf.org/html/rfc7519) method for representing claims securely between two parties. When the user successfully logs in using their credentials, a JSON Web Token will be returned, which should be kept by clients in
local storage (no cookies):

```
"token":"eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1MzYyMjU5NDUsImV4cCI6MTUzNjMxMjM0NSwic3ViIjoiMzdjMDY2ZjgtNDhjMS00NDZjLTk4OGQtYzQ0ZDQ4MDJiNzZmIiwicm9sZXMiOlsiYWRtaW4iXX0.UwqjX27pGJHJoGjCMkLhBnwoszb9d590upnkRFM0LaA"}
```

Whenever the user wants to access a protected route or resource, the user agent should send the JWT in the Authorization header using the Bearer schema:

`Authorization: Bearer <token>`

### Roles Claim
  Important note
```
Not all actions for ADMIN is currently created, for now, an admin can create by default the items to measure, has control over uses and measurements. Since there is no particular seed at this point, you need to manually add an admin. To do this, you must: Create a new user, with username:unique:string, password, email:unique:string. Create a new Role, with name:unique:string, admin:bool, and unite them with the UserRole through the table.
```

#### Admin role

- At the end version it will: create and delete items, change roles of users, delete users from the server, as well as updating already in place items.


#### User role

- Create an account
- View every item to measure
- Add measurements
- See previous measurements as well as updating the 

## Technology Used

- Rails API
- Postgres
- bcrypt
- JWT

### API Endpoints

| API Endpoint            | Functionality                           |
| ----------------------- | --------------------------------------- |
| POST /signup              | Register a new user: expects username:string:unique, email:string:unique and password.                   |
| POST /auth/login          | Login in a user expects username:string and password:string                      |
| GET /measure_items        | Fetch all approved vets profile. expects auth_token with the user token, that you can get when login a valid user.       |
| POST /measurements        | Creates new measurement. expects value and the id of the item that is being measured.|
| GET /measurements            | Get the users' measures.   expects user token.|
| GET /measurements?today=true | Will bring only items for the current date. |
| GET /measurements?from=${day}&to=${day} | Will bring measures from day A to day B
| POST /measure_items        | ADMIN: creates a new measure item. Expects user token. The user must be an admin. |


## Live Version

API live version
https://measurements-api.herokuapp.com/

<!-- CONTACT -->

## Authors

Facundo Iglesias

- [GitHub profile](https://github.com/Fig77)
