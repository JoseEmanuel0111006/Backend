import psycopg2

def conectar():
    try:
        conexion = psycopg2.connect(
            host = "localhost",
            database = "",
            user= "",
            password= "",
            port= ""
        )
        return conexion
    except Exception as e:
        print(f"Error a conectar con la base de datos {e}")
        return None
    
























    
#if __name__ == "__main__":
#    conn = conectar()  # Definís conn llamando a la función
#
#    if conn:
#        print("esta bien")
#        conn.close()
#    else:
#        print("esta mal")