# Question Management System

A web application for managing questions, solutions, titles, and results, built using **Node.js**, **Express.js**, **Prisma.io**, **PostgreSQL**, and **Docker**. This app allows for easy management of quiz data and supports **Unity Rich Text Tags** for enhanced text formatting in specific fields.

## Features

- **CRUD Operations**: Create, Read, Update, and Delete questions, solutions, titles, and results.
- **PostgreSQL Integration**: Uses PostgreSQL to store and manage question data.
- **Unity Rich Text Tags**: Supports Unity Rich Text formatting for the fields `Question`, `Solution`, `Title`, and `Result`.
- **Docker Support (Optional)**: The application can be containerized using Docker for simplified deployment.

## Technologies Used

- **Node.js**: JavaScript runtime environment for the backend.
- **Express.js**: Web framework to build the REST API.
- **Prisma.io**: ORM used to interact with PostgreSQL.
- **PostgreSQL**: Relational database to store question data.
- **Docker**: Platform to containerize and run the application in isolated environments.

## Installation and Setup

### Step 1: Clone the repository

If you don't have Git installed, first install it using the following commands:

```bash
sudo apt update
sudo apt install git
```

Then, clone the project repository:

```bash
git clone https://github.com/impsstolemyhouse/question-management.git
cd question-management
```

### Step 2: Install Dependencies

If Node.js and npm are not installed on your system, install them first:

```bash
sudo apt update
sudo apt install -y nodejs npm
```

Next, install all the necessary dependencies for the project:

```bash
npm install
```

This command will download and install all required Node.js packages, such as Express, Prisma, and other dependencies.

### Step 3: Set Up PostgreSQL Database

#### 1. Install PostgreSQL:

```bash
sudo apt update
sudo apt install postgresql postgresql-client -y
```

PostgreSQL should start automatically after installation. If not, you can start it manually.

```bash
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

#### 2. Log in as the postgres user and set a password:

```bash
sudo -u postgres psql
```

Run the following SQL command to set the password:

```sql
ALTER USER postgres WITH PASSWORD 'your_new_password';
```

Exit the PostgreSQL shell:

```sql
\q
```

#### 3. Apply database migrations:

```bash
npx prisma migrate dev
```

#### 4. Restore the database from a backup:

```bash
psql -U postgres -h 127.0.0.1 -d question-management -f backup.sql
```

Enter the password you set when prompted.

### Step 4: Start the Application

To run the application, use:

```bash
npm start
```

The application will now be accessible at

`http://localhost:3000`.

or finds an available port, starting from the preferred port (default: 3000), incrementing if necessary, ensuring the server starts without manual intervention.

## API Endpoints

### POST http://localhost:3000/api/questions/:id

Create a new question in the system.

Request Body Example:

```json
{
  "Question": "What is the capital of France?",
  "Solution": "The capital of France is Paris, which is known for its rich history and landmarks like the Eiffel Tower.",
  "CorrectAnswer": "Paris",
  "Options": ["London", "Berlin", "Paris", "Rome"],
  "Steps": [
    {
      "Title": "<b>Identify the country in question...</b>",
      "Result": "Recognize that the country in question is France."
    },
    {
      "Title": "<b>Determine the capital...</b>",
      "Result": "Recall that Paris is the capital city of France."
    }
  ],
  "Tags": ["Geography", "Capitals"]
}
```

**You must send the JSON data under the name "jsonData" and the images as "Problem-Image," "Step-1-Image," "Step-2-Image," and so on.**

Response Example:

```json
{
  "Id": 1,
  "Question": "What is the capital of France?",
  "Solution": "The capital of France is Paris, which is known for its rich history and landmarks like the Eiffel Tower.",
  "CorrectAnswer": "Paris",
  "ImageUrl": "/uploads/1735130917698-214806599.png",
  "Options": ["London", "Berlin", "Paris", "Rome"],
  "Steps": [
    {
      "Title": "<b>Identify the country in question...</b>",
      "Result": "Recognize that the country in question is France.",
      "ImageUrl": "/uploads/1735130917700-757427361.png"
    },
    {
      "Title": "<b>Determine the capital...</b>",
      "Result": "Recall that Paris is the capital city of France.",
      "ImageUrl": "/uploads/1735130917702-986166840.png"
    }
  ],
  "Tags": ["Geography", "Capitals"]
}
```

**You can use images with URLs like http://localhost:3000/ImageUrl.**

**For example, http://localhost:3000/uploads/1735130917702-986166840.png.**

### GET http://localhost:3000/api/questions

Fetch all questions from the system.

Example Response:

```json
[
  {
    "Id": 1,
    "Question": "What is the capital of France?",
    "Solution": "The capital of France is Paris, which is known for its rich history and landmarks like the Eiffel Tower.",
    "CorrectAnswer": "Paris",
    "ImageUrl": "/uploads/1735130917698-214806599.png",
    "Options": ["London", "Berlin", "Paris", "Rome"],
    "Steps": [
      {
        "Title": "<b>Identify the country in question...</b>",
        "Result": "Recognize that the country in question is France.",
        "ImageUrl": "/uploads/1735130917700-757427361.png"
      },
      {
        "Title": "<b>Determine the capital...</b>",
        "Result": "Recall that Paris is the capital city of France.",
        "ImageUrl": "/uploads/1735130917702-986166840.png"
      }
    ],
    "Tags": ["Geography", "Capitals"]
  }
]
```

### GET http://localhost:3000/api/questions/:id

Fetch one question with question id.

Example Response:

```json
{
  "Id": 1,
  "Question": "What is the capital of France?",
  "Solution": "The capital of France is Paris, which is known for its rich history and landmarks like the Eiffel Tower.",
  "CorrectAnswer": "Paris",
  "ImageUrl": "/uploads/1735130917698-214806599.png",
  "Options": ["London", "Berlin", "Paris", "Rome"],
  "Steps": [
    {
      "Title": "<b>Identify the country in question...</b>",
      "Result": "Recognize that the country in question is France.",
      "ImageUrl": "/uploads/1735130917700-757427361.png"
    },
    {
      "Title": "<b>Determine the capital...</b>",
      "Result": "Recall that Paris is the capital city of France.",
      "ImageUrl": "/uploads/1735130917702-986166840.png"
    }
  ],
  "Tags": ["Geography", "Capitals"]
}
```

### PUT http://localhost:3000/api/questions/:id

Update an existing question.

Request Body Example:

```json
{
  "Question": "What is the capital of England?",
  "Solution": "The capital of England is London, which is famous for landmarks like the Tower of London and Buckingham Palace.",
  "CorrectAnswer": "London",
  "Options": ["London", "Manchester", "Liverpool", "Birmingham"],
  "Steps": [
    {
      "Title": "<b>Identify the country in question...</b>",
      "Result": "Recognize that the country in question is England."
    },
    {
      "Title": "<b>Determine the capital...</b>",
      "Result": "Recall that London is the capital city of England."
    }
  ],
  "Tags": ["Geography", "Capitals", "England"]
}
```

Response Example:

```json
{
  "Id": 1,
  "Question": "What is the capital of England?",
  "Solution": "The capital of England is London, which is famous for landmarks like the Tower of London and Buckingham Palace.",
  "CorrectAnswer": "London",
  "ImageUrl": "/uploads/1735130917698-214806599.png",
  "Options": ["London", "Manchester", "Liverpool", "Birmingham"],
  "Steps": [
    {
      "Title": "<b>Identify the country in question...</b>",
      "Result": "Recognize that the country in question is England.",
      "ImageUrl": "/uploads/1735130917700-757427361.png"
    },
    {
      "Title": "<b>Determine the capital...</b>",
      "Result": "Recall that London is the capital city of England.",
      "ImageUrl": "/uploads/1735130917702-986166840.png"
    }
  ],
  "Tags": ["Geography", "Capitals", "England"]
}
```

### DELETE http://localhost:3000/api/questions/:id

Delete a question by its ID.

Response Example:

```json
{
  "message": "Question deleted successfully"
}
```
