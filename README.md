# Instalar opencode_theme da Tray no Ubuntu 20.04 ou maior

A Tray é uma plataforma de e-commerce da Locaweb. Ela utiliza um módulo em Rails que é uma CLI para editar os temas customizados de sua plataforma.

https://github.com/tray-tecnologia/opencode_theme

Todavia esta biblioteca está EXTREMAMENTE desatualizada e é compatível apenas com Ruby de 2.1 ao 2.3.8.

# update 23/02/2021 - Script Automatizado

Com a ajuda do @rhandrade quie converteu este tutorial em um script, agora você pode clocar este repositório e executar diretamente o install-opencode-ubuntu.sh direto em seu computador. Para isso basta dar permissão de escrita ao arquivo e depois executá-lo.

    chmod a+x install-opencode-ubuntu.sh
    ./install-opencode-ubuntu.sh

IMPORTANTE: o script pedir a senha de seu usuário pois alguns comandos rodam com SUDO.

# Segue embasamento usado para construção do script.

Para instalar o Ruby 2.3 em estações ubuntu/linux modernas, temos algumas dificuldades devido a bibliotecas depreciadas entre outros problemas.

Os principais problemas encontrados foram:
- incompatibilidade do renv com openssl 1.1
- impossibilidade de instalação do openssl1.0 via repositórios do ubuntu
- inconpatibilidade com faraday atualizado.

## Abordagem utilizada
Para prosseguir com a instalaçao abordamos a seguinte estratégia:
- Instalação do ruby por meio de rbenc
- instalação manual do openSSL1.0
- instalação manual das libs compatíveis.

### Passo 1: Instalação do rbenv para seu usuário

Atualize seu APT

    sudo apt update

Instale as dependências

    sudo apt install autoconf bison build-essential libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev

IMPORTANTE: talvez você precise remover a libssldev atual ou a libssl1.1 caso estejam instaladas.

Baixe, instale e adicione o rbenv ao seu PATH

    git clone https://github.com/rbenv/rbenv.git ~/.rbenv

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

    source ~/.bashrc

Seguimos então com a instalação do ruby-build

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    

### Passo 2: Instalação das openssl1.0
Lembrando, para instalar versões do ruby anteriores a 2.4, precisamos anteriormente instalar o openssl1.0. Todavia eles não estão mais disponíveis nos repositórios mais recentes. Para isso vamos baixar manualmente as bibliotecas necessárias:

Baixe a lib openssl1.0 do repositório antigo do Ubuntu

    wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.6_amd64.deb
    
Instale esta biblioteca

    sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.6_amd64.deb

Baixe a lib de desenvolvimento

    wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0-dev_1.0.2n-1ubuntu5.6_amd64.deb

Instale a Lib

    sudo dpkg -i libssl1.0-dev_1.0.2n-1ubuntu5.6_amd64.deb


### Passo 3 Instalação do Ruby 2.3
Agora é possível fazer a instalação do Ruby anterior a 2.4 via rbenv.

    rbenv install 2.3.8
    
Habilite a versão instalada

    rbenv global 2.3.8

O gem desta versão não vem com os sources habilitados. Para isso vamos colocar as sources na gem para permitir a instalação de pacotes.

    gem sources --add https://rubygems.org/

Agora vamos então instalar as dependências nas versões corretas.

### Passo 4: instalação das dependências da tray opencode_theme
Existem uma série de incompatibilidades de versão devido ao módulo estar desatualizado. para isso vamos entao instalar as versões compatíves:

    gem install faraday -v 1.0.1 
    
    gem install launchy -v 2.4.3
    
    gem install nokogiri -v 1.6.8


Agora sim podemos instalar o opencode_theme

    gem install opencode_theme
    
UFFAAAAA!
Agora é para funcionar.

Dúvidas? Entre em contato no
https://www.aupi.com.br



