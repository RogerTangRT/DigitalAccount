# Instalar banco de dados PostGree

Vídeo de como configurar o banco no PgAdmin

[Postgres e PGAdmin diretamente pelo Docker](https://www.youtube.com/watch?v=CdoBvd_bPdk)


Baixar o postgrees
```Console
> docker pull postgres
```
Exemplo de como Rodar PostGree. Não executar
```Console
> docker run --name myPostgresDb -p 5432:5432 -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -e POSTGRES_DB=mydatabase -d postgres
```
Explicação do parâmetros
```Console
--name myPostgresDb: Assigns a name to your container.
-p 5432:5432: Maps the container's port 5432 to your host's port 5432.
-e POSTGRES_USER=myuser: Sets the PostgreSQL superuser username.
-e POSTGRES_PASSWORD=mypassword: Sets the PostgreSQL superuser password.
-e POSTGRES_DB=mydatabase: Creates a default database named mydatabase.
-d postgres: Runs the container in detached mode using the postgres image.
```

## Antes de Criar o banco
**Tudo é possível visualizar através do portainer**

Criar uma rede para conversar os conteineres chamada my-network
```Console
> docker network create --driver bridge my-network
```
Verificar a rede
```Console
> docker network ls
```

Criar o banco de dados
Se a imagem não for encontrada, ela será baixada automaticamente
```Console
> docker run --name my-postgres --network=my-network -p 5433:5432 -e POSTGRES_PASSWORD=postgres -d postgres
```

```Console
--name my-postgres: Assigns a name to your container.
--network=my-network:  Rede onde o postgrees estará. No caso my-network
-p 5433:5432: Maps the container's port 5433 to your host's port 5432.
-e POSTGRES_USER=postgres: Sets the PostgreSQL superuser username.
-e POSTGRES_PASSWORD=postgres: Sets the PostgreSQL superuser password.
-d postgres: Runs the container in detached mode using the postgres image.
```


Verificar os conteiners que estão vinculados a rede
```Console
> docker inspect my-network
```

## Rodar PostGree no console do linux - Connect to PostgreSQL. Depois que criar o banco de dados

Usuário: postgres

Banco de dados: postgres

Senha: **Você está se conectando como o usuário postgres dentro do container, e não é necessário digitar a senha nesse caso**

```Console
> docker exec -it my-postgres psql -U postgres -d postgres
```
Sair do gerenciador de console
```Console
\q → sai do prompt

\l → lista todos os bancos

\dt → lista todas as tabelas no schema atual

\du → lista os usuários

\c nome_do_banco → conecta em outro banco

CREATE DATABASE nome; → cria um banco novo
```
## PGAdmin
Subir o PgAdmin na rede criadamy-network

```Console
> docker run -d --name pgadmin4 --network=my-network -p 15432:80 -e 'PGADMIN_DEFAULT_EMAIL=admin@admin.com' -e 'PGADMIN_DEFAULT_PASSWORD=postgres'  dpage/pgadmin4
```
Parâmetros
```Console
--name	                        pgadmin4
--network	                my-network
-p 15432:80	                Acessível em http://localhost:15432
PGADMIN_DEFAULT_EMAIL	        admin@admin.com
PGADMIN_DEFAULT_PASSWORD	postgres
Imagem utilizada	        dpage/pgadmin4
```

### Criando tabela pelo pgadmin
```SQL
CREATE TABLE TB_Config(
	id_config int PRIMARY KEY,
	config nchar(20) NULL);
```
### Inserindo dados
```SQL
INSERT INTO TB_Config VALUES (1,'Config1');
INSERT INTO TB_Config VALUES (2,'Config2');
```

### Visualizando os dados
```SQL
SELECT * FROM TB_Config;
```
**IMPORTANTE: O ";" deve existir no comando**

## Exemplo de Outra configuração. Não necessário rodar

Se a imagem não for encontrada, ela será baixada automaticamente
```Console
> docker run -d \
  --name pgadmin4 \
  -p 8080:80 \
  -e 'PGADMIN_DEFAULT_EMAIL=admin@admin.com' \
  -e 'PGADMIN_DEFAULT_PASSWORD=admin' \
  dpage/pgadmin4
```

Subir o pgadmin
```Console
> docker start pgadmin4
```
Para rodar o PGADMIN na porta 15432

No browser PgAdmin está na porta 15432 [PgAdmin]( http://localhost:15432)

## Parar e remover imagens
Parar parar o PGAdmin
```Console
> docker stop pgadmin4
```
Para remover a imagem do PgAdmin
```Console
> docker rm pgadmin4
```

Parar parar o banco Postgres
```Console
> docker stop my-postgres
```

Para remover a imagem do Postgres
```Console
> docker rm my-postgres
```


Parar parar o portainer
```Console
> docker stop portainer
```

Para remover a imagem do portainer
```Console
> docker rm portainer
```

