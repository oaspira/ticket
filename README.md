# README

# Ticket - README

## Requisitos

Certifique-se de ter as seguintes dependências instaladas:

- *Ruby* 3.0.2 ou superior (a versão exata está definida no arquivo .ruby-version)
- *Bundler* (para gerenciar dependências Ruby)

## Instalação

### 1. Clonar o repositório

Primeiro, clone o repositório do projeto:

```bash
git clone git@github.com:oaspira/ticket.git
cd ticket
```

### 2. Instalar as dependências

Assumindo que você já tenha o Ruby instalado e configurado, instale as gems necessárias com o Bundler:

```bash
bundle install
```

### 3. Configurar o banco de dados

Este projeto utiliza PostgreSQL.

- Edite o arquivo `config/database.yml` com as suas configurações do PostgreSQL.

Após configurar o banco de dados, crie as tabelas e rode as migrações:

```bash
rails db:create
rails db:migrate
rails db:seed
```

### 4. Iniciar o servidor

Inicie o servidor Rails com o seguinte comando:

```bash
rails s
```

### 5. Testes

O projeto utiliza RSpec para testes. Para rodar os testes, use o seguinte comando:

```bash
bundle exec rspec
```

### 6. Testar no navegador

Voce pode testar tambem no navegador acessando

```bash
http://localhost/3000/tickets
```
