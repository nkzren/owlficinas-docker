FROM nginx
LABEL GRUPO="solen" NOME1="Adryelli Reis dos Santos"

# Adicionando arquivos do diretório
COPY nginx.conf.template /etc/nginx/conf.d/default.conf.template
COPY html /www/owlficinas/

ENV PORT=9090

USER root

# Atualizando pacotes e dando permissões para o usuário nginx
RUN chown -R nginx:nginx /var/cache/nginx /var/run/ /www/ /etc/nginx/conf.d/

USER nginx

# Criando volume
RUN mkdir /www/arquivos && \
    chown nginx:nginx /www/arquivos
VOLUME /www/arquivos

# Expondo porta
EXPOSE 9090

# Configurando diretório de trabalho e iniciando o NGINX
# Substituindo a variável $PORT no arquivo template.conf
CMD /bin/sh -c "envsubst '\${PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
