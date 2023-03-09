from flask import Flask
import json

app = Flask(__name__)

@app.route("/")
def main():
	return "<center><h1>LAPSHOP PRIME</h1></center>"

@app.route("/laptops")
def laptops():
	return "<h1>Catalogo de laptops</h1>"

@app.route("/about")
def about():
	with open("about.json") as archivo:
		datos = json.load(archivo)
	return datos

@app.route("/about/terms-of-use")
def terms():
	return "<h1>Pagina en Mantenimiento</h1>"

if __name__=='__main__':
	app.run()


