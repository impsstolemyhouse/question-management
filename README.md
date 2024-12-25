# Question Management System

This backend manages quiz questions with rich text, multiple-choice answers, and explanations, built with Node.js, Express.js, Prisma.io, PostgreSQL, and Docker. It supports CRUD operations and generates Unity-compatible JSON output with embedded images for enhanced formatting.

## Installation and Setup

### Step 1: Clone the repository

If you don't have Git installed, run:

```bash
sudo apt update
sudo apt install git
```

Then, clone the repository:

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
ALTER USER postgres WITH PASSWORD 'your_password';
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

### POST http://localhost:3000/api/questions

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

You must send the JSON data under the name "jsonData" and the images as "Problem-Image," "Step-1-Image," "Step-2-Image," and so on.

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

```
{
  "message": "Question deleted successfully"
}
```

# Important Notes

- **Correct Port**: When accessing the API endpoints, make sure to use the correct port. By default, the application will try to start on port 3000. However, if this port is already in use, the server will automatically find the next available port. Be sure to use the correct port number when making requests to the API.

  For example, if the server starts on port 3001, your API endpoint will be accessible at:

  ```
  http://localhost:3001/api/questions
  ```

- **Using Images:** You can use images with URLs like http://localhost:3000/ImageUrl. These URLs will point to the images hosted by the server.

  For example:

  ```
  http://localhost:3000/uploads/1735130917702-986166840.png
  ```

- **Sending Data**: You must send the JSON data under the name "jsonData" and the images as "Problem-Image," "Step-1-Image," "Step-2-Image," and so on.
