FROM docker.io/fedora:latest
# Updating dependencies, installing Apache and cleaning dnf caches to reduce
# container size
RUN dnf -y update && dnf -y install httpd && dnf clean all
# Creating placeholder file to be served by apache
RUN echo "Apache" >> /var/www/html/index.html
# We open 80 port, the default one for HTTP for Apache server to listen on
EXPOSE 8080
# Simple startup script to avoid some issues observed with container restart
ADD run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh
CMD ["/run-apache.sh"]
