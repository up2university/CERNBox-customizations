#!/bin/bash
set -o errexit # Bail out on all errors immediately

echo ""
echo "Applying customizations for Up2U..."

### 1. Put in place the Up2U logo
echo "  .Logo ..."
mv /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png.original
cp up2u_logo.png /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png

### 2. Set Up2U Single Sign-On paramters
# NOTE: Please select 'shibboleth' as authentication method ('AUTH_TYPE') for cernbox Docker image v0.7 and later
echo "  .SSO Configuration..."
cp sso_config/attribute-map.xml /etc/shibboleth/attribute-map.xml
sed "s/%%%CERNBOXGATEWAY_HOSTNAME%%%/${CERNBOXGATEWAY_HOSTNAME}/" sso_config/shibboleth2.xml.template > sso_config/shibboleth2.xml
cp sso_config/shibboleth2.xml /etc/shibboleth/shibboleth2.xml
sed -i "s/LDAPUserBackend/LDAPUserBackendSSORegister/" /var/www/html/cernbox/config/config.php


echo "Done"
echo ""
