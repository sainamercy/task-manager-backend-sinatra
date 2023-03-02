# TASK-MANAGER
Task Manager is a basic API built with ruby's Sinatra DSL. 

The application has been built with the MVC design pattern.

## Pre-Requisites
In order to use this repository you will need the following:

- Operating System **(Windows `10+`, Linux `3.8+`, or MacOS X `10.7+`)**
- RAM >= 4GB
- Free Space >= 2GB

## Built With
This application has been built with the following tools:

![ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![sqlite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)


- **Ruby `v2.7.+`**
- **SQlite3 `v1.6`**
- **ActiveRecord `v7.0.4`**
- **Rake `v13.0.6`**
- **Puma `v6.1`**
- **rerun `v0.14`**
- **Sinatra `v3.0.5`**

## Setup
You can setup this repository by following this manual

1. Clone the repository
    ```{shell}
   git clone https://github.com/sainamercy/task-manager-backend-sinatra.git
   ```
2. Ensure the ruby gems are setup in your machine
    ```{shell}
   bundle install
   ```
3. Perform any pending database migrations
   ```{shell}
   rake db:migrate
   ```
4. Run the application
    ```{shell}
    rake start
    ```
5. Open the application from your browser
    ```
   http://localhost:9292
   ```
   
## Application
This application is a simple web API that allows users to:

- Register a new account.
- Log in to existing account.
- Create TASK items.
- Update individual TASK items.
- View all TASK items.
- Organize Task items by status
- Filter TASK items by date.
- Delete a TASK item.

### MODELS
Database schema definitions.

#### TODO

| COLUMN      | DATA TYPE                                       | DESCRIPTION                         | 
|-------------|-------------------------------------------------|-------------------------------------|
| id          | Integer                                         | Unique identifier.                  |
| title       | String                                          | The name of the task.               |
| description | String                                          | A short description about the task. |
| user_id     | Integer                                         | The user's task identifier          |
| due         | Date                                            | The set due date for the task.      |
| created_at  | Date                                            | The date the task was created.      |
| upgdated_at | Date                                            | The date the task was updated.      |
| priority    | ENUM `[LOW, MEDIUM, HIGH]`                      | The priority of the task.           |
| status      | ENUM `[CREATED, ONGOING, COMPLETED, CANCELLED]` | The status of the task.             |


#### USER
| COLUMN        | DATA TYPE | DESCRIPTION                           | 
|---------------|-----------|---------------------------------------|
| id            | Integer   | Unique identifier.                    |
| full_name     | String    | User's full name.                     |
| password_hash | String    | User's password hashed with `BCrypt`. |
| updated_at    | Date      | The date the user was updated.        |
| created_at    | Date      | The date the user was created.        |


### ROUTES

1. `/auth/register` - Create a new user account.
   
   ```{json}
   ## REQUEST BODY
   {
    "full_name": "John Doe",
    "email": "mail@mail.com",
    "password": "12345678"
   }
   ```
2. `/auth/login` - Log in a user using email and password.

   ```{json}
   ## REQUEST BODY
   {
    "email": "mail@mail.com",
    "password": "12345678"
   }
   ```
3. `/tasks/create` - Add a new TODO item.

   ```{json}
   ## REQUEST BODY
   {
    "title": "Make Breakfast",
    "description": "Prepare milk and cereal",
    "due": "2023-09-09"
   }
   ```
4. `/tasks:id` - List all TASKS items for a specific user.

   ```{json}
   ## RESPONSE SAMPLE
   {
    "data": [
        {
            "id": 2,
            "title": "Running another DSA practice 2",
            "description": "A wild desc",
            "user_id": 1
            "due": "2023-02-24T00:00:00.000Z",
            "created_at": "2023-02-24T09:34:41.856Z",
            "updated_at": "2023-02-24T09:34:41.856Z",
            "priority": "LOW",
            "status": "CREATED"
        }],
    "message": "SUCCESS"
   }
   ```
5. `/tasks/update/:id` - Update an existing TASK.
6. `/tasks/delete/:id` - Delete a TASK item.

## LICENSE
MIT License

# Author
This repository is maintained by:

- [Mercy Saina](https://github.com/sainamercy)