# Documentação

# Todos os software criado para o projeto minha cidade:

### Crawler
O software que tem a função de explorar o portal da transparência de João Pessoa e abstrair as informações

  
  ## Building do código Crawler
Na pasta do repositório, execute o seguinte comando para criar uma imagem docker
com o Crawler:

    $ docker build -t crawler .

Depois de criado a imagem, execute o seguinte comando para executar a aplicação
de forma interativa:

    $ docker run -it --name crawler
    
    
### APP minha cidade
Aplicativo móvel híbrido Minha Cidade desenvolvido com framework ionic v3.4.0 Edit Add topics

 ## Building do código APP

1 - Installar Ionic

    $ npm install -g cordova ionic
    $ ionic start myBlank blank
    
2 - Baixar o repositório 

    $ git clone https://github.com/ionic-team/ionic2-app-base.git
    
