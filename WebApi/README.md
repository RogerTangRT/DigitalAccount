# Projeto WebAPI
[API DO ZERO com .NET 6, CLEAN ARCH, SOLID E CLEAN CODE 🔥 PARTE 1](https://www.youtube.com/watch?v=AY3cgq94f9U)

Verificar se o wsl (windows subsystem for linux) Subsistema do Windows para Linux está rodando
```Console
> wsl -l -v
```

Iniciar o wsl 
```Console
> wsl
```

Parar o WSL
```Console
> wsl --shutdown
```

Verificar os containes do docker que estão rodando
```Console
> docker ps 
```

Iniciar o docker
```Console
> sudo service docker start
```

Parar o docker
```Console
> sudo service docker stop
```
Para instancias do docker
```Console
> docker stop $(docker ps -aq)
```

Instalar o portainer. Só necessário uma vez
```Console
> docker volume create portainer_data

> docker run -d -p 9000:9000 --name portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data portainer/portainer-ce
```
Visualizar portrainer pelo Browser
[portainer](http://localhost:9000/)

Login: Admin

Senha: 


Ir para o diretório do projeto
```Console
> cd /
> cd mnt/c/Users/Roger/Documents/GitHub/C#/DigitalAccount/DigitalAccount/
> cd C:/Users/Roger/Documents/GitHub/C#/DigitalAccount/DigitalAccount/Webapi
```

Compilar pelo WSL CLI
```Console
> docker build -t webapi .
```

Executar em produção
```Console
> docker run -d -p 8080:80 --name webapi-container webapi
```
Executar em Desenvolvimento. Roda o Swagger
```Console
> docker run -d -p 8080:80 --name webapi-container -e ASPNETCORE_ENVIRONMENT=Development webapi
```
Visualizar Aplicação pelo Browser
[WebAPI](http://localhost:8080/swagger/index.html)

Parar container webapi
```Console
> docker stop webapi-container
```
Remover container webapi
```Console
> docker rm webapi-container
```
