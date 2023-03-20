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


#Consultar Todos Laptops
@app.route("/laptops/all")
def example():
	conexion = mysql.connector.connect(
    	host="127.0.0.1",
    	user="root",
    	password="Charles120Ahoy",
    	database="laptops"
	)

	cursor = conexion.cursor()
	cursor.execute("SELECT * FROM laptops")
	headers=[x[0] for x in cursor.description]
	resultados = cursor.fetchall()
	json_data=[]
	for result in resultados:
		json_data.append(dict(zip(headers,result)))
	return jsonify(json_data)


#Consultar Todos Fabricantes
@app.route("/manufacturer/all")
def manufacturer():
	conexion = mysql.connector.connect(
    	host="127.0.0.1",
    	user="root",
    	password="Charles120Ahoy",
    	database="laptops"
	)

	cursor = conexion.cursor()
	cursor.execute("SELECT * FROM manufacturer")
	headers=[x[0] for x in cursor.description]
	resultados = cursor.fetchall()
	json_data=[]
	for result in resultados:
		json_data.append(dict(zip(headers,result)))
	return jsonify(json_data)


#Consultar Todos Procesadores
@app.route("/processor/all")
def processor():
	conexion = mysql.connector.connect(
    	host="127.0.0.1",
    	user="root",
    	password="Charles120Ahoy",
    	database="laptops"
	)

	cursor = conexion.cursor()
	cursor.execute("SELECT * FROM processor")
	headers=[x[0] for x in cursor.description]
	resultados = cursor.fetchall()
	json_data=[]
	for result in resultados:
		json_data.append(dict(zip(headers,result)))
	return jsonify(json_data)


#Consultar Todos Tarjetas Graficas
@app.route("/graphics/all")
def graphics():
	conexion = mysql.connector.connect(
    	host="127.0.0.1",
    	user="root",
    	password="Charles120Ahoy",
    	database="laptops"
	)

	cursor = conexion.cursor()
	cursor.execute("SELECT * FROM graphics_card")
	headers=[x[0] for x in cursor.description]
	resultados = cursor.fetchall()
	json_data=[]
	for result in resultados:
		json_data.append(dict(zip(headers,result)))
	return jsonify(json_data)


#Consultar Todos Series
@app.route("/series/all")
def series():
	conexion = mysql.connector.connect(
    	host="127.0.0.1",
    	user="root",
    	password="Charles120Ahoy",
    	database="laptops"
	)

	cursor = conexion.cursor()
	cursor.execute("SELECT * FROM series")
	headers=[x[0] for x in cursor.description]
	resultados = cursor.fetchall()
	json_data=[]
	for result in resultados:
		json_data.append(dict(zip(headers,result)))
	return jsonify(json_data)




#Prueba
@app.route("/api/sql/test")
def sqltest():
	conexion = mysql.connector.connect(
    	host="127.0.0.1",
    	user="root",
    	password="Charles120Ahoy",
    	database="laptops"
	)

	cursor = conexion.cursor()
	cursor.execute("SELECT * FROM laptops")
	headers=[x[0] for x in cursor.description]
	resultados = cursor.fetchall()
	json_data=[]
	for result in resultados:
		json_data.append(dict(zip(headers,result)))
	return jsonify(json_data)





if __name__=='__main__':
	app.run()

