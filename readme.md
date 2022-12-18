## Bienvenido al repositorio de Fabián Alvarez
### Introducción
Este proyecto forma parte del trabajo práctico final de la materia "Entorno de programación" de la Tecnicatura Universitaria en Inteligencia Artificial de la facultad de Ciencias Exactas, Ingeniería y Agrimensura de la Universidad Nacional de Rosario, Argentina.
Consiste en una aplicación que permite filtrar un texto para encontrar:
1. La palabra más corta, la más larga y el promedio de longitud de todas las palabras del texto.
2. Las 10 palabras más usadas en el texto, que tengan al menos 4 letras.
3. Nombres propios, con la salvedad de que se identifican palabras que estén en el formato "Nnnnnn".
4. La oración más corta, la más larga y el promedio de longitud de todas las oraciones del texto.
5. La cantidad de líneas en blanco que tiene el texto.

### Recursos
La app se programó en Bash usando la terminal de comandos de Linux (Ubuntu 22.04). Con el complemento de herramientas como tr o awk para el filtrado de texto. Además, la aplicación se ejecuta a través de un contenedor de Docker y se usó Git para gestionar el control de versiones y posterior publicaión en el repositorio de GitHub.

### Instalación y ejecución
Primero se debe descargar el repositorio, para eso desde se debe copiar el link del repositorio https://github.com/fabianalvarez7/tp_final_edp.git y pegar en la terminal de Linux, luego del comando: git clone
```bash
git clone https://github.com/fabianalvarez7/tp_final_edp.git 
```
Todos los archivos de la app se descargan en el directorio "tp_final_edp"
Deben encontrarse los siguientes archivos:
1. Dockerfile
2. blankLinesCounter.sh
3. findNames.sh
4. menu.sh
5. readme.md
6. statsSentences.sh
7. statsUsageWords
8. statsWords.sh
9. textotp.txt

Para entrar al directorio clonado:
```bash
cd tp_final_edp
```
Una vez dentro, para ver el contenido del directorio:
```bash
ls -l
```
Ahora procedemos a construir la imagen de docker:
```bash
docker build -t app:1 .
```
Atención con el punto final luego del espacio.
Para ver que la imagen ya se encuentra creada:
```bash
docker images
```
Deben listarse dos imágenes, la de Ubuntu con el tag "latest" y la de app con el tag "1"

Ahora podemos generar y correr el contenedor. La aplicación comenzará a funcionar, pidiendo ingresar el nombre de un archivo de texto. En el directorio ya hay un archivo llamado "textotp.txt" que ingresaremos por teclado.
```bash
docker run --name contenedortp -it -v $PWD:/app app:1
```
Luego de ingresar el archivo de texto se despliega el menú de opciones para hacer el filtrado del mismo. Seguir las instrucciones hasta que se consiga la información buscada. Una vez que se salga de la app bien porque ya haya terminado su uso o bien porque hubo una salida con error, se puede volver a ejecutar la aplicación de la siguiente manera.

Primero vemos el estado del contenedor que ha sido creado:
```bash
docker ps -a
```
Debe encontrarse en la lista con el nombre "contenedortp" y su estado debe ser "up", quiere decir que está corriendo.

Entonces para volver a ejecutar la aplicación usamos el siguiente comando:
```bash
docker exec -it contenedortp ./menu.sh
```
Una vez que terminamos de usar la app podemos detener el contenedor copiando su id:
```bash
docker stop id_contenedor
```
Para volver a correrlo usamos:
```bash
docker start id_contenedor
```
Y luego "docker exec-it contenedortp ./menu" como fue aclarado antes. Esto también puede hacerse si por ejemplo se modifica el texto y se desea ejecutar la aplicación otra vez.

Finalmente podemos eliminar el contenedor, para eso debe estar en estado detenido:
```bash
docker rm id_contenedor
```
Y también podemos eliminar la imagen:
```bash
docker rmi image id_imagen
```
Y se puede volver a empezar el procedimiento

### Bibliografía
Libro Entorno de programación año 2022 elaborado por la cátedra

###Contacto
Para consultas: fabianalvarez212@gmail.com
