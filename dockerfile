FROM nginx:1.25
LABEL GRUPO="SirMonteiro" NOME1="Gabriel Monteiro de Souza"

COPY html /www/owlficinas
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

VOLUME /www/arquivos

ENV PORT=9090
EXPOSE 9090

RUN chown -R nginx:nginx /var/cache/nginx && \
  chown -R nginx:nginx /etc/nginx/ && \
  chmod -R 755 /etc/nginx/ && \
  chown -R nginx:nginx /var/log/nginx && \
  touch /var/run/nginx.pid && \
  chown nginx:nginx /var/run/nginx.pid

USER nginx

CMD ["nginx", "-g", "daemon off;"]