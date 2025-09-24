@echo off
echo === Kaiburr Task Manager API Test ===
echo Testing REST API endpoints...
echo.

set BASE_URL=http://localhost:8081/tasks

echo 1. Creating a new task...
curl -X PUT "%BASE_URL%" -H "Content-Type: application/json" -d "{\"id\": \"task-001\", \"name\": \"Hello World Task\", \"owner\": \"John Doe\", \"command\": \"echo Hello World from Kaiburr!\"}"
echo.
echo.

echo 2. Creating another task...
curl -X PUT "%BASE_URL%" -H "Content-Type: application/json" -d "{\"id\": \"task-002\", \"name\": \"List Files Task\", \"owner\": \"Jane Smith\", \"command\": \"dir\"}"
echo.
echo.

echo 3. Getting all tasks...
curl -X GET "%BASE_URL%"
echo.
echo.

echo 4. Getting task by ID (task-001)...
curl -X GET "%BASE_URL%?id=task-001"
echo.
echo.

echo 5. Searching tasks by name (Hello)...
curl -X GET "%BASE_URL%/search?name=Hello"
echo.
echo.

echo 6. Executing task-001...
curl -X PUT "%BASE_URL%/task-001/execute"
echo.
echo.

echo 7. Getting task-001 after execution...
curl -X GET "%BASE_URL%?id=task-001"
echo.
echo.

echo 8. Deleting task-002...
curl -X DELETE "%BASE_URL%/task-002"
echo.
echo.

echo 9. Getting all tasks after deletion...
curl -X GET "%BASE_URL%"
echo.
echo.

echo === API Test Complete ===
pause