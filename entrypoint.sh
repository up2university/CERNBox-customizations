#!/bin/bash
set -o errexit # Bail out on all errors immediately

echo ""
echo "Applying customizations for Up2U..."

### 1. Put in place the Up2U logo
### Commented out because the following paths does not exist in images used in branch webng_beta_psnc in the upstream repo
# echo "  .Logo ..."
# mv /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png.original
# cp up2u_logo.png /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png

### 2. Set Up2U Single Sign-On paramters
# NOTE: Please select 'shibboleth' as authentication method ('AUTH_TYPE') for cernbox Docker image v0.7 and later
# echo "  .SSO Configuration..."
# cp sso_config/attribute-map.xml /etc/shibboleth/attribute-map.xml
# sed "s/%%%CERNBOXGATEWAY_HOSTNAME%%%/${CERNBOXGATEWAY_HOSTNAME}/" sso_config/shibboleth2.xml.template > sso_config/shibboleth2.xml
# cp sso_config/shibboleth2.xml /etc/shibboleth/shibboleth2.xml
# sed -i "s/LDAPUserBackend/UserBackendSSOtoLDAP/" /var/www/html/cernbox/config/config.php
###sed -i "s/LDAPUserBackend/UserBackendSSOtoLDAPNumericUID/" /var/www/html/cernbox/config/config.php

### 3. Configure SWAN API for UP2U SSO
# echo -e '#!/bin/sh\nsh /var/www/html/cernbox/cernbox_scripts/UserBackendSSOtoLDAP.d/ldap_lookup.sh ssouid $1 uid' > /var/www/html/cernbox/cernbox_scripts/get_username.sh
# chmod u+x /var/www/html/cernbox/cernbox_scripts/get_username.sh
# echo "ssotranslaterscript: /var/www/html/cernbox/cernbox_scripts/get_username.sh" >> /etc/cboxswanapid/cboxswanapid.yaml
# echo "ssofield: uid" >> /etc/cboxswanapid/cboxswanapid.yaml

### 4. Add tracking code
sed -i "s|<\/body>|<script type=\"application/javascript\" src=\"$TRACKING_URL\"></script></body>|" /var/www/html/cernbox/core/templates/layout.user.php
# And allow the domain to use it
sed -i "s|);|'cbox.swan.cspdomains' => ['root.cern.ch', 'cdnjs.cloudflare.com' $TRACKING_DOMAINS],);|" /var/www/html/cernbox/config/config.php
sed -i "s/\$policy->addAllowedScriptDomain(\$domain);/\$policy->addAllowedImageDomain(\$domain);\$policy->addAllowedScriptDomain(\$domain);/" /var/www/html/cernbox/apps/swanviewer/appinfo/app.php


echo "Done"
echo ""
