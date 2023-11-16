FROM nginx:1.25

LABEL GRUPO="corinthians"
LABEL NOME1="Thiago Tanaka Padrao"

USER root

ENV PORT=9090
EXPOSE 9090

COPY /html /www/owlficinas/
COPY /nginx.conf.template /etc/nginx/templates 

VOLUME /www/arquivos

CMD ["nginx", "-g", "daemon off;"]

RUN useradd -u 2000 usuario
USER usuario