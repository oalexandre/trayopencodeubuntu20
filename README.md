# Instalar opencode_theme da Tray no Ubuntu 20.04 ou maior

A Tray é uma plataforma de e-commerce da Locaweb. Ela utiliza um módulo em Rails que é uma CLI para editar os temas customizados de sua plataforma.

https://github.com/tray-tecnologia/opencode_theme

Todavia esta biblioteca está EXTREMAMENTE desatualizada e é compatível apenas com Ruby de 2.1 ao 2.3.8.

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
    sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev

Baixe, instale e adicione o rbenv ao seu PATH
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

    source ~/.bashrc

Seguimos então com a instalação do ruby-build
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    






