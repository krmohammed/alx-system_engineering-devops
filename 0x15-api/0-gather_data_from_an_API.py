#!/usr/bin/python3
""" uses a REST API, looking at employee details"""
import requests
import sys


def get_todo_progress(emp_id):
    """ checks the todo progress of an employee

    args:
        emp_id <str>: employee id
    """
    emp_url = f"https://jsonplaceholder.typicode.com/users/{emp_id}"
    todo_url = f"https://jsonplaceholder.typicode.com/users/{emp_id}/todos"

    emp_response = requests.get(emp_url)
    todo_response = requests.get(todo_url)

    if emp_response.status_code != 200 or todo_response.status_code != 200:
        print("Couldn't fetch data")
        return

    emp = emp_response.json()
    todos = todo_response.json()

    name = emp.get('name')
    all_t = len(todos)
    completed = [todo for todo in todos if todo.get('completed')]
    done = len(completed)

    output = "Employee {} is done with tasks({}/{}):".format(name, done, all_t)

    print(output)

    for todo in completed:
        print("\t {}".format(todo.get('title')))


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <employee_id>")
        sys.exit(1)

    get_todo_progress(sys.argv[1])
