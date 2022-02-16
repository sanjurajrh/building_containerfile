FROM registry.access.redhat.com/ubi8/ubi:8.0
ENV DOCROOT /var/www/html
RUN yum -y install httpd && yum clean all -y && echo "Hello from parent container" > ${DOCROOT}/index.html
ONBUILD COPY src/ ${DOCROOT}/
EXPOSE 80
RUN rm -rf /run/httpd && mkdir /run/httpd
USER root 
CMD /usr/sbin/httpd -DFOREGROUND
