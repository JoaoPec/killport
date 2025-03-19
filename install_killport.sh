#!/bin/bash

# Diretório onde o executável será armazenado
INSTALL_DIR="/usr/local/bin"

# Nome do executável
EXECUTABLE_NAME="killport"

# Verifica se o Go está instalado
if ! command -v go &>/dev/null; then
  echo "Erro: Go não está instalado. Instale o Go e tente novamente."
  exit 1
fi

# Clona ou atualiza o repositório (se houver um)
if [ ! -d "$HOME/repositories/killport" ]; then
  git clone https://github.com/seu-usuario/killport.git "$HOME/repositories/killport"
else
  cd "$HOME/repositories/killport" || exit
  git pull
fi

# Entra na pasta do projeto
cd "$HOME/repositories/killport" || exit

# Compila o programa
go build -o "$EXECUTABLE_NAME"

# Move o executável para o diretório do sistema
sudo mv "$EXECUTABLE_NAME" "$INSTALL_DIR/"

# Garante permissão de execução
sudo chmod +x "$INSTALL_DIR/$EXECUTABLE_NAME"

echo "Instalação concluída! Agora você pode usar o comando '$EXECUTABLE_NAME' no terminal."
