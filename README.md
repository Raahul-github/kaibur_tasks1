# Task 1: Java Backend and REST API Example

This task involves implementing a Java application that provides a REST API for managing "task" objects. These task objects represent shell commands that can be executed within a Kubernetes pod.

## Project Structure

*   `task-api/`: The Java Spring Boot application (to be implemented).
*   `README.md`: This documentation file.

## Task Object Structure

Each `task` object should have the following properties:

*   `id` (String): Task ID
*   `name` (String): Task name
*   `owner` (String): Task owner
*   `command` (String): Shell command to be run
*   `taskExecutions` (List<TaskExecution>): A list of task execution records.

### TaskExecution Object Structure

Each `TaskExecution` object should contain:

*   `startTime` (Date): Execution start date/time
*   `endTime` (Date): Execution end date/time
*   `output` (String): Command output

### Sample JSON Object

```json
{
  "id": "123",
  "name": "Print Hello",
  "owner": "John Smith",
  "command": "echo Hello World again!",
  "taskExecutions": [
    {
      "startTime": "2023-04-21 15:51:42.276Z",
      "endTime": "2023-04-21 15:51:43.276Z",
      "output": "Hello World!"
    },
    {
      "startTime": "2023-04-21 15:52:42.276Z",
      "endTime": "2023-04-21 15:52:43.276Z",
      "output": "Hello World again!"
    }
  ]
}
```

## REST API Endpoints

The application should expose the following REST API endpoints:

*   **GET /tasks**
    *   Returns all `task` objects if no parameters are passed.
    *   If a `task` ID is passed as a parameter, it should return a single task or a 404 Not Found error if no such task exists.

*   **PUT /tasks**
    *   Accepts a `task` object as a JSON-encoded message body.
    *   The application must validate the `command` provided in the request to ensure it does not contain unsafe or malicious code.

## How to Access and Run the Project

1.  **Clone the Repository**: If you haven't already, clone this repository to your local machine.

    ```bash
    git clone <repository-url>
    cd task1-java-backend
    ```

2.  **Navigate to the `task-api` directory**: The core Java backend application will be located in the `task-api` subdirectory.

    ```bash
    cd task-api
    ```

3.  **Build the Application**: Use Maven to build the project.

    ```bash
    ./mvnw clean install
    ```

4.  **Run the Application**: Once built, you can run the Spring Boot application.

    ```bash
    java -jar target/taskmanager-1.0.0.jar
    ```
    (Note: The exact JAR name might vary based on your `pom.xml` configuration.)

5.  **Access the API**: Once the application is running, the REST API will typically be accessible at `http://localhost:8080` (or another port if configured differently).

## Copyright

Copyright © 2025 Kaiburr LLC. All rights reserved.
