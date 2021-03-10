import os
import sys
from flask import Flask,request,make_response,jsonify,render_template
import mysql.connector as mydb

"""
# コネクションの作成
conn = mydb.connect(
    host='hostname',
    port='3306',
    user='username',
    password='password',
    database='dbname'
)
"""

# コネクションの作成
conn = mydb.connect(
    host='localhost',
    port='3306',
    user='chaserFlask',
    password='chaser',
    database='dbname'
)