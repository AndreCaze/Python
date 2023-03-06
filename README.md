# LAPSHOP Prime

Author(s): Miguel A. & Andre C.

Status: [Draft, Ready for review, In Review, Reviewed]

Ultima actualización: 2023-03-06

## Contenido
- Goals
- Non-Goals
- Background
- Overview
- Detailed Design
  - Solucion Propuesta
    - Frontend
    - Backend
- Consideraciones
- Métricas

## Links
- [Al Repositorio del Proyecto](https://github.com/AndreCaze/Python.git)

## Objetivo
Una aplicacion web para facilitar el proceso de compra de laptops nuevas, usadas, y reconstruidas.

## Goals
- Proveer un catalogo completo de laptops de diversos fabricantes.
- Facilitar el proceso de compra de laptops.
- Ofrecer una extensa lista de componentes personalizables para cada laptop.
## Non-Goals
- Incluir computadores de escritorio, celulares, tabletas u otros dispositivos diferentes a las laptops.
- Venta de componentes por separado.

## Background
Hace poco estuvimos viendo cuantas APIs hay dedicada a la venta de Laptops, y descubrimos que casi todas ofrecian laptops nuevas o proveian de un catalogo minusculo de componentes extras de laptops.

Actualmente los usuarios de Laptops requieren dispositivos que se adapten a sus necesidades o situaciones donde los componentes que tienen no son suficientes para el trabajo que desean desempeñar

_Incluye recursos, como otros design docs si es necesario_

_No escribas acerca de tu diseño o requerimientos aquí_

## Overview
Necesitamos un API que contenga todas las marcas de Laptops y todos los componentes que se le pueden agregar a una.

Cada Laptop tendra una id, en la cual se podra consultar su existencia o disponibilidad junto con cualquier componente que se le quiera añadir.

Los End Points tendran el siguiente formato:
- 1.-/v0.1/LapShopP/laptops/{item-id}
- 2.-/v0.1/LapShopP/laptops/{item-id}/prices/{emp-id}
- 3.-/v0.1/LapShopP/laptops/{item-id}/components
- 4.-/v0.1/LapShopP/laptops/{item-id}/components/{components-id}
- 5.-/v0.1/LapShopP/laptops?manufacturer=INTEL&condition=new
- 6.-/v0.1/LapShopP/laptops/{item-id}/prices
- 7.-/v0.1/LapShopP/laptops/types
- 8.-/v0.1/LapShopP/laptops/{item-id}/reviews
- 9.-/v0.1/LapShopP/about
- 10.-/v0.1/LapShopP/about/terms-of-use

_Esta sección debería ser entendible por nuevos miembros de tu equipo que no están relacionados al proyecto_

_Pon detalles en la siguiente sección_

## Detailed Design
_Usa diagramas donde veas necesario_

_Herramientas como [Excalidraw](https://excalidraw.com) son buenos recursos para esto_

_Cubre los cambios principales:_

 _- Cuales son las nuevas funciones que vas a escribir?_
 _- Porque necesitas nuevos componentes?_
 _- Hay código que puede ser reusable?_

_No elabores minuciosamente la implementación._

## Solution 1
### Frontend
_Frontend…_
### Backend
_Backend…_

## Consideraciones
Para correr se ocupa las siguientes dependencias o paquetes:

Flask==2.2.3

pip==22.3

virtualenv==20.19.0

## Métricas
Instrucciones para ejecutar este proyecto

Instalar python 3.10.12.12.13.343

A continuacion instalar los archivos en requirements.txt

> pip install -r requerimientos.txt
> pip install mysql -connector

De preferencia esto debe estar en un ENV

> python -m venv venv

El proyecto esta realizado en flask y se debe ejecutar con el siguiente comando:

> flask run app