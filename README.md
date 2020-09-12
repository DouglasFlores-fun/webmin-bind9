# webmin-bind9
Crear imagen:
docker build -t webmin-bind9 .

Iniciar contenedor:
docker run -d --name webmin -p 10000:10000 -p 53:53/udp -p 53:53/tcp webmin-bind9

Eliminar contenedor
docker rm -f webmin-bind9


