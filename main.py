from flask import Flask
import json

app = Flask(__name__)

@app.route("/")
def main():
	return "<center><h1>HOLA ITE Ensenada</h1></center>"

@app.route("/laptops")
def laptops():
	return "<h1>Pagina Principal del Catalogo</h1>"

@app.route("/about")
def about():
	with open("about.json") as archivo:
		datos = json.load(archivo)
	return datos

@app.route("/about/terms-of-use")
def usos():
	return "<h1>Pagina en Mantenimiento</h1>"

if __name__=='__main__':
	app.run()


