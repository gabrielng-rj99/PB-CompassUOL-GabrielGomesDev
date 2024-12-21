#!/bin/bash

# Comando para adicionar
NOVO_COMANDO="0 5 * * * /caminho/para/seu/script.sh"

# Verifica se o comando já existe no crontab
(crontab -l | grep -q "$NOVO_COMANDO") || (crontab -l; echo "$NOVO_COMANDO") | crontab -
