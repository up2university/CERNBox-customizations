#!/bin/bash
set -o errexit # Bail out on all errors immediately

echo ""
echo "Applying customizations for Up2U..."

### 1. Put in place the Up2U logo
echo "  .Logo ..."
mv /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png.original
cp up2u_logo.png /var/www/html/cernbox/themes/cernbox/core/img/logo-icon.png

echo "Done"
echo ""
