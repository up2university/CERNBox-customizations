# CERNBox-customizations

This repository contains images, logos, scripts, and configuration files to customize the CERNBox Docker image (gitlab-registry.cern.ch/cernbox/boxedhub/cernbox) for the Up2U project.

Currently, it is used to:
  * Replace the CERNBox logo with the Up2U logo;
  * Integrate CERNBox with the Up2U Single Sign-On solution (https://github.com/up2university/single-sign-on).

Please consider that the installation of common tools and software packages (e.g., shibboleth) typically takes place in the upstream process of building the Docker image for CERNBox.
If additional packages are required, their installation in the upstream Docker image can be discussed and coordinated by opening an issue in this repository.

