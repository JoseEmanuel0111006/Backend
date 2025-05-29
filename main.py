from flask import Flask, render_template, request, redirect, url_for
import psycopg2
from werkzeug.security import generate_password_hash
from conexion import conectar

app = Flask(__name__)


@app.route('/')
def inicio():
    return render_template('inicio.html')


@app.route('/registrarse', methods=['GET','POST'])
def registrarse():
    if request.method == 'POST':
        nombre = request.form['nombre']
        gmail = request.form['email']
        password = request.form['password']
        confirm_password = request.form['confirm_password']

        if password != confirm_password:
                return "Las contraseñas no coinciden."
    

        contra_hash = generate_password_hash(password)
        conn = conectar()

        if conn:
                try:
                    with conn.cursor() as cur:
                        cur.execute("""
                            INSERT INTO usuarios (nombre, apellido, gmail, contra_hash)
                            VALUES (%s, %s, %s, %s)
                        """, (nombre, '', gmail, contra_hash)) 
                        conn.commit()
                        return redirect(url_for('inicio'))
                except Exception as e:
                    return f"Error al registrar: {e}"
                finally:
                    conn.close()
        else:
            return "Error de conexión a la base dedatos"
        
    return render_template('registrarse.html')

if __name__ == '__main__':
    app.run(debug=True)