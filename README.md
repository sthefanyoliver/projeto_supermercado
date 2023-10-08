# Sistema de gerenciamento de um Supermercado

## 📃 Descrição do projeto:
Este projeto é um sistema de gerenciamento de supermercado WEB que utiliza um banco de dados. Foi criado com o objetivo de testar meus conhecimentos em programação web. O sistema oferece as seguintes funcionalidades:

* **Autenticação de Usuários:** Acesso ao sistema por meio de um login.

* **Seções Web de Segurança:** Garante que apenas usuários autorizados tenham acesso ao sistema.

* **Funcionalidades de CRUD (Criar, Ler, Atualizar e Excluir):** O sistema permite a gestão completa de produtos, usuários, unidades de medida e segmentos.

* **Filtro de Pesquisa:** Mecanismo criado para que as informações desejadas sejam encontradas mais facilmente.

* **Sistema de Paginação:** Facilita a navegação por grandes conjuntos de dados.

## 💻 Tecnologias Utilizadas:

* **Linguagens de Programação:** Foi ultilizado combinação de HTML, CSS, JavaScript e PHP para criar o front-end e o back-end do sistema.

* **Framework Bootstrap:** Ultilização do framework Bootstrap para garantir a responsividade do sistema, para que ele se adpte a dispoitivos de diferntes tamanhos, trazendo para o usuário uma boa experiencia de uso.
  
* **Banco de Dados MySQL:** O SGBD foi usado para a criação do banco de dados ultilizado no sistema.

* **Servidor Local WAMP com MariaDB:** Ultilizado para realizar os testes necessários na integração do banco de dados com o sistema, facilitando seu desenvolvimento.

## ⚠️ ATENÇÃO:
Antes de começar a usar o sistema, certifique-se de atender aos seguintes requisitos:
* **Instalação e Funcionamento do WAMP Server:** Certifique-se de ter o WAMP Server instalado e funcionando corretamente. O WAMP Server é essencial para hospedar o ambiente de desenvolvimento local, que inclui o servidor web e o banco de dados necessários para executar o sistema. Você pode instalar o WAMP Server clicando [aqui](https://www.wampserver.com/en/).

* **Navegador Web:** Você precisa ter um navegador web para acessar o sistema e interagir com sua interface.

## 🚀 Passos para a ultilização do sistema:
Siga atentamente o passo a passo a seguir:
1. Clone o repositório do GiitHub no seu computador, no caminho C:\wamp64\www 
2. Inicie o WAMP server.
3. Com o botão esquerdo do mouse clique sobre o icone do WAMP server, clique na aba MariaDB, clique na aba MariaDB Console e entre com seu usuario e senha (Geralmente por padrão de instalação o usuario é root e a senha é branco)
4. O banco de dados esta dentro da pasta sql deste repositório, logo execute o seguinte comando no MariaDB Console:
   
   source C:/wamp64/www/projeto_supermercado/sql/ob1.sql;
   
   Para verificar se o banco de dados foi executado corretamente ultilize o comando SQL:
   
   show databases;
   
   Logo após ultilize o comando SQL:
   
   use ob1;
   
5. Abra um navegador WEB de sua preferencia e digite o seguinte caminho na barra de pesquisa:
   
   localhost/projeto_supermercado/login.html
   
Se tudo tiver sido feito corretamente a tela de login será exibida da seguinte forma:

![image](https://github.com/sthefanyoliver/projeto_supermercado/assets/139503553/e6b05d49-dbdc-4ec0-9873-7c55b36ba642)

6. Clique no link CRIAR CONTA e cadastre seu usuario.
   
7. Volte para a tela de login clicando no link abaixo do botão CADASTRAR.
   
8. Coloque seu usuario e senha na tela de login.

Se tudo ocorrer como esperdo voce verá a tela inicial do sistema da seguinte forma:

![image](https://github.com/sthefanyoliver/projeto_supermercado/assets/139503553/7597479a-2495-46d4-8759-65648a3f4b78)



