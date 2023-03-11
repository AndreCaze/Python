from flask import Flask
from flask import jsonify
#from urllib.com import urlopen
import mysql.connector
import json

app = Flask(__name__)

@app.route("/")
def main():
	return "<center><h1>LAPSHOP PRIME</h1></center>"

@app.route("/laptops")
def laptops():
	return "<h1>Catalogo de laptops</h1>"

@app.route("/about/terms-of-use")
def terms():
	return "<h1>Pagina en Mantenimiento</h1>"

@app.route("/about")
def about():
	with open("about.json") as archivo:
		datos = json.load(archivo)
	return datos

@app.route("/example")
def example():
	return jsonify(saludo="bye bye")

@app.route("/api/sql/test")
def sqltest():
	conexion = mysql.connector.connect(
    	host="127.0.0.1",
    	user="root",
    	password="Charles120Ahoy",
    	database="Laptops"
	)

	cursor = conexion.cursor()
	cursor.execute("SELECT * FROM Laptop")

	resultados = cursor.fetchall()
	return resultados


if __name__=='__main__':
	app.run()
