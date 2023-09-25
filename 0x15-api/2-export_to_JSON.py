#!/usr/bin/python3
""" Python3 REST API example EXPORT to csv"""
import json
import requests
import sys


if __name__ == '__main__':

    id_employee = sys.argv[1]
    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get("https://jsonplaceholder.typicode.com/users/{}"
                         .format(id_employee)).json()
    todos = requests.get("https://jsonplaceholder.typicode.com/todos?userId={}"
                         .format(id_employee)).json()

    with open("{}.json".format(id_employee), "w") as user_id:
        json.dump({id_employee: [{
                'task': task.get('title'),
                'completed': task.get('completed'),
                'username': users.get('username')
            } for task in todos]}, user_id)
