#For CentOS 7
FROM centos:7.4.1708

# Download certificate and key from the customer portal (https://cs.nginx.com)
# and copy to the build context
COPY nginx-repo.crt nginx-repo.key /etc/ssl/nginx/

# Install prerequisite packages
RUN yum -y install wget ca-certificates epel-release

# Add NGINX Plus repo to yum
RUN wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/nginx-plus-7.repo
RUN wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/app-protect-signatures-7.repo

# Install NGINX App Protect
RUN yum -y install app-protect app-protect-attack-signatures app-protect-threat-campaigns\
    && yum clean all \
    && rm -rf /var/cache/yum \
    && rm -rf /etc/ssl/nginx

# Forward request logs to Docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#    && ln -sf /dev/stderr /var/log/nginx/error.log
    
# Copy configuration files  
COPY $CI_PROJECT_DIR/nginx.conf $CI_PROJECT_DIR/log-default.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/NginxCustomPolicy.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/signatures/modifications.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/signatures/signature-sets.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/signatures/server-technologies.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/filetype/filetypes.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/compliance/evasions.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/compliance/http-protocols.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/compliance/methods.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/response-pages/response-pages.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/automation-attacks/bot-defense.json /etc/nginx/
COPY $CI_PROJECT_DIR/policies/ip-exceptions/whitelist-ips.json /etc/nginx/

COPY entrypoint.sh  ./

CMD ["sh", "/entrypoint.sh"]
