# Minha Cidade
## O que é?
> Você entende que é importante todos os cidadãos entenderem como a gestão municipal investe nas áreas essenciais como saúde, educação, segurança e outras? Pois é, pensando nessa importância, criamos o Minha Cidade!

Minha Cidade é uma plataforma para análise de dados públicos extraidos das transparências municipais. A ideia veio por parte de Josué Paiva Benardino, um dos integrantes da equipe que criou e desenvolveu o Minha Cidade, que foi aprimorada e implementada por ele e pelos demais participantes da equipe. O processo de desenvolvimento se iniciou durante a primeira fase da maratona de programação [Hackfest 2017](http://hackfest.com.br/), chegando à fase final como um dos 10 melhores projetos. Promovida pelo [Ministério Público da Paraíba (MPPB)](http://www.mppb.mp.br/) em parceria com a Rede Paraibana de Comunicação, com a [Controladoria Geral da União (CGU)](http://www.cgu.gov.br/), com o [Tribunal de Contas do Estado da Paraíba (TCE)](https://portal.tce.pb.gov.br/) e outras instituições, a maratona ocorreu durante os dias 9 e 11 de Junho de 2017, com o objetivo de envolver a sociedade no combate à corrupção e a melhora dos serviços públicos por meio do desenvolvimento de soluções tecnológicas.

## Softwares

### [Frontend](https://github.com/minha-cidade/frontend)
Landing page que descreve a plataforma Minha Cidade ao usuário, mostra informaçes interessantes sobre dados públicos e oferece links para download do aplicativo.

### [Crawler](https://github.com/minha-cidade/crawler)
O Crawler tem a função de periodicamente baixar o banco de dados CSV da Transparência de João Pessoa e armazenar seu conteúdo no banco de dados da Minha Cidade, para que depois possa ser enviado pela API Backend.

### [Backend](https://github.com/minha-cidade/backend)
O Backend Minha Cidade expõe uma API de fácil acesso aos dados coletados pelo Crawler, provendo uma forma simples e eficiente de analisar dados públicos referentes às despesas municipais.

### [APP Minha Cidade](https://github.com/minha-cidade/app-movel-hibrido)
Aplicativo móvel híbrido Minha Cidade, desenvolvido com framework ionic v3.4.0. Utiliza dos dados coletados pelo Crawler e fornecidos pela API Backend

# Instalação do Docker
* Primeiro devemos atualizar o banco de dados de pacotes:
``` shell
    sudo apt-get update
```  
* Para instalar o docker adicione ao sistema a chave GPG oficial do repositório do Docker:
``` shell
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```
* Adicione o repositório do Docker às fontes do APT:
``` shell
    sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
```
* Atualize o banco de dados de pacotes com os pacotes do Docker a partir do novo repositório adicionado:
``` shell
    sudo apt-get update
```
* Certifique-se de que você está instalando a partir do repositório do Docker em vez do repositório padrão do Ubuntu 16.04:
``` shell
    apt-cache policy docker-engine
```
* Você deverá ver uma saída semelhante à seguinte:
``` shell
    docker-engine:
        Installed: (none)
        Candidate: 1.11.1-0~xenial
    Version table:
        1.11.1-0~xenial 500
            500 https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
        1.11.0-0~xenial 500
            500 https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
```
* Instale o Docker
``` shell
    sudo apt-get install -y docker-engine
```
* Após a instalação verifique se o serviço esta sendo executado
``` shell
    sudo systemctl status docker
```
* A saída deve ser semelhante:
``` shell
    [ secondary_label Output]
        ● docker.service - Docker Application Container Engine
            Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
            Active: active (running) since Sun 2016-05-01 06:53:52 CDT; 1 weeks 3 days ago
                Docs: https://docs.docker.com
        Main PID: 749 (docker)
```

# Instalação do Mongo
* Para instalar o Mongo rode o seguinte comando do docker
``` docker
    docker run --name some-mongo -d mongo
```
* Por padrão o Mongo é exposto na porta 27017

# Instalação do Crawler
O [Crawler](https://github.com/minha-cidade/crawler) tem a função de periodicamente baixar o banco de dados CSV da
[Transparência de João Pessoa](http://transparencia.joaopessoa.pb.gov.br/)
e armazenar seu conteúdo no banco de dados MongoDB.

## Configuração
A configuração do crawler é enviada através das seguintes variáveis de ambiente:

* `CRAWLER_MONGO_CONNECTION_STRING` (default: `"mongodb://localhost"`)

  Endereço do banco de dados MongoDB seguindo o formato [Connection String](https://docs.mongodb.com/manual/reference/connection-string/).


* `CRAWLER_MONGO_DATABASE` (default: `"despesas"`)

  Nome do banco de dados usado pelo MongoDB.


* `CRAWLER_MONGO_COLLECTION` (default: `"gastometro"`)

  Nome da collection usada pelo MongoDB.


* `CRAWLER_SINGLE_RUN` (default: `"false"`)

  Executa o crawler apenas uma vez, sem iniciar o scheduler.

## Instalação
Na pasta do repositório, execute o seguinte comando para criar uma imagem docker
com o Crawler:

    $ docker build -t crawler .

Depois de criado a imagem, execute o seguinte comando para executar a aplicação
de forma interativa:

    $ docker run -it --name crawler

# Backend Minha Cidade em Go
## Introdução
O [Backend](https://github.com/minha-cidade/backend) Minha Cidade expõe uma API de fácil acesso aos dados coletados
pelo [Crawler Minha Cidade](https://github.com/minha-cidade/crawler), provendo
uma forma simples e eficiente de analisar dados públicos referentes às despesas
municipais.

## Configuração
A configuração é enviada através das seguintes variáveis de ambiente:

* `BACKEND_LISTEN_ADDRESS` (default: `":8080"`)

  Endereço o qual o servidor aceitará requests.


* `BACKEND_MONGO_CONNECTION_STRING` (default: `"mongodb://localhost"`)

  Endereço do banco de dados MongoDB seguindo o formato [Connection String](https://docs.mongodb.com/manual/reference/connection-string/).

* `BACKEND_REVERSE_PROXY` (default: `false`)

  Caso seja `true`, os headers `X-Forwarded-For` e `X-Real-IP` enviados pela
  proxy reversa serão usados para identificar o IP real do request. Apenas
  use caso o backend for acessível apenas via proxy reversa que suporte esses
  headers (ex.: Nginx, Apache etc). Caso contrário qualquer cliente será capaz
  de forjar um IP nos logs de acesso.

* `BACKEND_CORS_ALLOWED_ORIGINS` (default: `"*"`)

  Endereços que o sevidor enviará no header [CORS](https://pt.wikipedia.org/wiki/Cross-origin_resource_sharing) separados
  por vírgula, sem espaço.

  Ex:

      "google.com,yahoo.com,bing.com"


## Instalação
Na pasta do repositório, execute o seguinte comando para criar uma imagem docker
com o Backend

    $ docker build -t backend .

Depois de criado a imagem, execute o seguinte comando para executar a aplicação

    $ docker run -it --rm --name backend -p 8080:8080 backend

# Instalação do App Hibrido
* Clone o repositorio [MinhaCidadeApp](https://github.com/minha-cidade/app-movel-hibrido), após isso instale as o Ionic
``` shell
    $ sudo npm install -g ionic cordova
```
* Entre na pasta do projeto e use o sequinte comando:
``` shell
    $ ionic cordova run android
```
# Landpage
* Clone o repositorio da [landpage](https://github.com/minha-cidade/frontend) e abra o arquivo index.html com algum browser
