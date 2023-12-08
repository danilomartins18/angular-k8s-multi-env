# Substituição de Arquivos de Configuração da Aplicação Angular no Deployment no Kubernetes

## Visão Geral do Projeto

Este projeto tem como objetivo demonstrar o processo de substituição de arquivos de configuração de uma aplicação Angular durante o momento do deployment em um cluster Kubernetes. O foco principal é permitir a substituição dinâmica de arquivos de configuração para possibilitar a configuração personalizada da aplicação em diferentes ambientes.

## Componentes do Projeto

### Aplicação Angular

A aplicação Angular é composta por arquivos de configuração que incluem variáveis específicas do ambiente. Nesse caso, temos o arquivo `env.js` que faz esse papel.

### Deployment no Kubernetes

Os manifestos de deployment no Kubernetes (`deployment-full.yaml`) descrevem como a aplicação Angular será implantada no cluster. Esses manifestos incluem informações sobre Pods, Services, ConfigMaps e outros recursos necessários.

### Substituição de Configuração

A substituição de configuração é realizada por meio da substituição dinâmica de arquivos de configuração durante o processo de deployment. A ideia é utilizar um ConfigMap no Kubernetes que contenha os arquivos com marcadores, que posteriormente serão substituídos por valores específicos do ambiente durante o deployment. Neste caso no ConfigMap consta o conteúdo final do arquivo `env.js`. A definição do ConfigMap também está no `deployment-full.yaml`.

### Pré-requisitos

Para rodar o projeto seu ambiente deve estar com as seguintes ferramentas instaladas:

- NodeJS
- Angular CLI
- Docker (com o Kubernetes habilitado)

### Simulação feita

Para validar esta POC no arquivo `env.js` foi inserida na propriedade `name` o valor `LOCAL`. Quando rodamos o projeto através do Angular CLI (`ng serve`), ao acessar a URL da aplicação na tela inicial deve apresentar o nome do projeto com o sufixo `local` como definido no arquivo `env.js`. E no ConfigMap alteramos este valor para `K8S`. Depois de gerar a imagem Docker com o nome `app-k8s-env-poc` e ao fazer o deployment no  Kubernetes localmente utilizando o arquivo `deployment-full.yaml` e o `kubectl`, a aplicação deveria exibir a mesma tela, mas com o sufixo  `k8s`.
