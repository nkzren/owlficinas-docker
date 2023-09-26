FROM nginx
LABEL GRUPO="solen" NOME1="Adryelli Reis dos Santos"

#adicionando arquivos do diretório
COPY "./nginx.conf.template" "/etc/nginx/nginx.conf"
COPY "html" "/www/owlficinas/"

USER root

#sudo update && dando permissões para o usuário nginx
RUN apt-get update && apt-get install -y sudo
RUN sudo chown -R nginx:nginx /var/cache/nginx && sudo chown -R nginx:nginx /var/run/ && sudo chown -R nginx:nginx /www/

USER nginx

#criando volume
RUN mkdir /www/arquivos
RUN chown nginx:nginx /www/arquivos

VOLUME /www/arquivos

#expor porta
EXPOSE 9090

WORKDIR /usr/share/nginx/html/
ENTRYPOINT ["/usr/sbin/nginx"]

CMD ["-g", "daemon off;"]
