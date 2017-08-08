# Minha Cidade
## O que é?
Você entende que é importante todos os cidadãos entenderem como a gestão municipal investe nas áreas essenciais como saúde, educação, segurança e outras? Pois é, pensando nessa importância, criamos o Minha Cidade!

A ideia veio por parte de Josué Paiva Benardino, um dos integrantes da equipe que criou e desenvolveu o Minha Cidade, que foi aprimorada e implementada por ele e pelos demais participantes da equipe. O processo de desenvolvimento se iniciou durante a primeira fase da maratona de programação [Hackfest 2017](http://hackfest.com.br/), chegando à fase final como um dos 10 melhores projetos. Promovida pelo Ministério Público da Paraíba (MPPB) em parceria com a Rede Paraibana de Comunicação com a Controladoria Geral da União (CGU), com o Tribunal de Contas do Estado da Paraíba (TCE) e outras instituições, a maratona ocorreu durante os dias 9 e 11 de Junho de 2017, com o objetivo de envolver a sociedade no combate à corrupção e a melhora dos serviços públicos por meio do desenvolvimento de soluções tecnológicas.

## Softwares

### [Frontend](https://github.com/minha-cidade/frontend)
Landing page que descreve a plataforma Minha Cidade ao usuário, mostra informaçes interessantes sobre dados públicos e oferece links para download do aplicativo.

### [Crawler](https://github.com/minha-cidade/crawler)
O Crawler tem a função de periodicamente baixar o banco de dados CSV da Transparência de João Pessoa e armazenar seu conteúdo no banco de dados da Minha Cidade, para que depois possa ser enviado pela API Backend.

### [Backend](https://github.com/minha-cidade/backend)
O Backend Minha Cidade expõe uma API de fácil acesso aos dados coletados pelo Crawler, provendo uma forma simples e eficiente de analisar dados públicos referentes às despesas municipais.
       
### [APP Minha Cidade](https://github.com/minha-cidade/app-movel-hibrido)
Aplicativo móvel híbrido Minha Cidade, desenvolvido com framework ionic v3.4.0. Utiliza dos dados coletados pelo Crawler e fornecidos pela API Backend
