#!/bin/bash

# Kaiburr Task Manager API Test Script
echo "=== Kaiburr Task Manager API Test ==="
echo "Testing REST API endpoints..."
echo

BASE_URL="http://localhost:8081/tasks"

# Test 1: Create a task
echo "1. Creating a new task..."
curl -X PUT "$BASE_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "task-001",
    "name": "Hello World Task",
    "owner": "John Doe",
    "command": "echo Hello World from Kaiburr!"
  }' | jq .
echo -e "\n"

# Test 2: Create another task
echo "2. Creating another task..."
curl -X PUT "$BASE_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "task-002", 
    "name": "List Files Task",
    "owner": "Jane Smith",
    "command": "ls -la"
  }' | jq .
echo -e "\n"

# Test 3: Get all tasks
echo "3. Getting all tasks..."
curl -X GET "$BASE_URL" | jq .
echo -e "\n"

# Test 4: Get task by ID
echo "4. Getting task by ID (task-001)..."
curl -X GET "$BASE_URL?id=task-001" | jq .
echo -e "\n"

# Test 5: Search tasks by name
echo "5. Searching tasks by name (Hello)..."
curl -X GET "$BASE_URL/search?name=Hello" | jq .
echo -e "\n"

# Test 6: Execute a task
echo "6. Executing task-001..."
curl -X PUT "$BASE_URL/task-001/execute" | jq .
echo -e "\n"

# Test 7: Get task after execution to see execution history
echo "7. Getting task-001 after execution..."
curl -X GET "$BASE_URL?id=task-001" | jq .
echo -e "\n"

# Test 8: Delete a task
echo "8. Deleting task-002..."
curl -X DELETE "$BASE_URL/task-002"
echo -e "\n"

# Test 9: Verify deletion
echo "9. Getting all tasks after deletion..."
curl -X GET "$BASE_URL" | jq .
echo -e "\n"

echo "=== API Test Complete ==="