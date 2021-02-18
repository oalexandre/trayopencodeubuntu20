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

##Passo 1: Instalação do rbenv para seu usuário

  sudo apt update
