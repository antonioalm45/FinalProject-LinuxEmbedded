################################################################################
# SEMS Dashboard (vendorized: dist + node_modules preincluidos)
################################################################################

SEMS_DASHBOARD_VERSION = main
SEMS_DASHBOARD_SITE = https://github.com/antonioalm45/sems-web-dashboard.git
SEMS_DASHBOARD_SITE_METHOD = git

SEMS_DASHBOARD_LICENSE = MIT
SEMS_DASHBOARD_LICENSE_FILES = LICENSE

# Node runtime en el target
SEMS_DASHBOARD_DEPENDENCIES = nodejs

define SEMS_DASHBOARD_BUILD_CMDS
    # Nada: ya traemos dist y node_modules
endef

define SEMS_DASHBOARD_INSTALL_TARGET_CMDS
    # Directorio destino en el target
    mkdir -p $(TARGET_DIR)/opt/sems-web-dashboard

    # Copiar backend (incl. node_modules)
    cp -a $(@D)/backend $(TARGET_DIR)/opt/sems-web-dashboard/

    # Copiar dist del frontend
    mkdir -p $(TARGET_DIR)/opt/sems-web-dashboard/frontend
    cp -a $(@D)/frontend/dist $(TARGET_DIR)/opt/sems-web-dashboard/frontend/

    # Crear usuario/grupo opcional (si quieres no correr como root)
    # adduser -D -h /opt/sems-web-dashboard -s /bin/sh sems || true

    # Instalar defaults (configuración) y script init
    install -D -m 0644 $(BR2_EXTERNAL_BASE_EXTERNAL_PATH)/package/sems-dashboard/sems-dashboard.defaults \
        $(TARGET_DIR)/etc/default/sems-dashboard
    install -D -m 0755 $(BR2_EXTERNAL_BASE_EXTERNAL_PATH)/package/sems-dashboard/S99sems-dashboard \
        $(TARGET_DIR)/etc/init.d/S99sems-dashboard
endef

$(eval $(generic-package))