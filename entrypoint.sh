#!/bin/bash
set -o errexit # Bail out on all errors immediately

echo ""
echo "Applying customizations for Up2U..."

mv /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png.original
cp up2u_logo.png /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png

echo "Done"
echo ""
