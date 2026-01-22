#!/bin/sh

echo "Starting Evolution Manager v2..."

# Usa a porta definida pelo Railway (fallback para 80)
PORT=${PORT:-80}

echo "Using PORT=$PORT"

# Ajusta todos os arquivos nginx para escutar na porta correta
sed -i "s/listen 80;/listen ${PORT};/g" /etc/nginx/conf.d/*.conf

# (Opcional) mostrar o listen final para debug
grep -R "listen" /etc/nginx/conf.d/

# Inicia o nginx em primeiro plano
nginx -g "daemon off;"
