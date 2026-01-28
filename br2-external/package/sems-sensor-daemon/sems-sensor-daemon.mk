SEMS_SENSOR_DAEMON_VERSION = 1.0
SEMS_SENSOR_DAEMON_SITE = $(BR2_EXTERNAL_SEMS_PATH)/package/sems-sensor-daemon/src
SEMS_SENSOR_DAEMON_SITE_METHOD = local

define SEMS_SENSOR_DAEMON_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/main.py $(TARGET_DIR)/usr/local/bin/sems-sensor-daemon
    # Instalar servicio systemd (si usas systemd)
    # $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_SEMS_PATH)/package/sems-sensor-daemon/sems-sensor-daemon.service \
    #     $(TARGET_DIR)/usr/lib/systemd/system/sems-sensor-daemon.service
endef

$(eval $(generic-package))
