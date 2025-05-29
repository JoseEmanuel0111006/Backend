from flask import Flask, render_template, request, redirect, url_for
import psycopg2
from werkzeug.security import generate_password_hash
from conexion import conectar

app = Flask(__name__)