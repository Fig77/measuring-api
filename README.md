# API developer version readme - pre release

## Introduction

This API works as support for tracking systems. Allows to create users, with two default roles (Admin and User), to create items to measure, and measurements.

## ReadMe disclaimer

This ReadMe is the current documentation during development process, will not be de final version, information might be missing or pending to add, as well as proper formating and overall API doc. Rspec errors are warning are not completly clean at this point.

## Index
- [Current Features](#current-features-applied)
- [Quick start](#quick-start)
- [Roles and end point](#roles-claim)

## Current Features applied

- RESTful api.
- Deploy version on heroku.
- Users management.
- Items to measure and measurements management. (Missing time column)
- Secret/token api key.
- Rspec testing.
- Postgres database.
## Missing:
* Full functionality of user admin.
* Compliments around models to get more complex data while being effective for the frontend and backend.
* versioning and serialization.

## Quick start
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

- That's it, you app is lock and loaded!

```
rails s
```

Locally the system resouces can be accessed at the local base url, check console output to see where is it mounted. Ej:

```
http://localhost:3000
```

## Documentation

### Authentication

Authentication is performed using JSON Web Tokens. JSON Web Tokens are an open, industry standard [RFC 7519](https://tools.ietf.org/html/rfc7519) method for representing claims securely between two parties. When the user successfully logs in using their credentials, a JSON Web Token will be returned, which should be kept by clients in
local storage (no cookies):

```
"token":"eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1MzYyMjU5NDUsImV4cCI6MTUzNjMxMjM0NSwic3ViIjoiMzdjMDY2ZjgtNDhjMS00NDZjLTk4OGQtYzQ0ZDQ4MDJiNzZmIiwicm9sZXMiOlsiYWRtaW4iXX0.UwqjX27pGJHJoGjCMkLhBnwoszb9d590upnkRFM0LaA"}
```

Whenever the user wants to access a protected route or resource, the user agent should send the JWT in the Authorization header using the Bearer schema:

`Authorization: Bearer <token>`

### Roles Claim
  Important note
```
Not all actions for ADMIN is currently created, for now an admin can create by default the items to measure. Since there is no particular seed at this point, you need to manually add an admin. To do this, you must: Create a new user, with username:unique:string, password, email:unique:string. Create a new Role, with name:unique:string, admin:bool, and unite them with the UserRole through table.
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
| POST /measurements        | Creates new measurement. expects value and the id of the item that is being mesuere.|
| GET /measurements          | Get the users measures.   expects user token.|
| POST /measure_items        | ADMIN: creates a new measure item. Expects user token. User must be an admin. |


## Live Version

This is the link to the live preview in Heroku. Consist of the base URL<br>
[API deploy development version](https://obscure-sands-00808.herokuapp.com)<br>

<!-- CONTACT -->

## Authors

Facundo Iglesias

- [GitHub profile](https://github.com/Fig77)