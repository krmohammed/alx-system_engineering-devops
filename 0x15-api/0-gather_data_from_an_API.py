#!/usr/bin/python3
""" uses a REST API, looking at employee details"""


import requests
import sys


emp_id = sys.argv[1]
emp_url = f"https://jsonplaceholder.typicode.com/users/{emp_id}"
todo_url = f"{emp_url}/todos"

emp_response = requests.get(emp_url)
todo_response = requests.get(todo_url)

emp = emp_response.json()
todos = todo_response.json()

emp_name = emp.get('name')
all_tasks = len(todos)
completed = [todo for todo in todos if todo.get('completed')]

print(f"Employee {emp_name} is done with tasks({len(completed)}/{all_tasks}):")

for todo in completed:
    print(f"\t{todo.get('title')}")
