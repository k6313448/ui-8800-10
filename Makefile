#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=ui-8800-10
PKG_VERSION:=1.0
PKG_RELEASE:=0

PKG_LICENSE:=GPLv3 
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=maoky <maoky@bellnett.com> 

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/ui-8800-10
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  $(call Package/luci/webtemplate)
  DEPENDS+=+luci +#################################################
  TITLE:=8800 User Interface v1.0
endef

define Package/ui-8800-10/description
  8800 User Interface v1.0
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ui-8800-10/postinst
endef

define Package/ui-8800-10/install

###################################first install xiaomi ui

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/80211_ctrl.lua $(1)/usr/lib/lua/luci/controller/80211_ctrl.lua
	$(INSTALL_DATA) ./files/bellbeacons.lua $(1)/usr/lib/lua/luci/controller/bellbeacons.lua
	$(INSTALL_DATA) ./files/firewall.lua $(1)/usr/lib/lua/luci/controller/firewall.lua

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/admin
	$(INSTALL_DATA) ./files/index.lua $(1)/usr/lib/lua/luci/controller/admin/index.lua
	$(INSTALL_DATA) ./files/network.lua $(1)/usr/lib/lua/luci/controller/admin/network.lua
	$(INSTALL_DATA) ./files/status.lua $(1)/usr/lib/lua/luci/controller/admin/status.lua
	$(INSTALL_DATA) ./files/system.lua $(1)/usr/lib/lua/luci/controller/admin/system.lua

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view
	$(INSTALL_DATA) ./files/sysauth.htm $(1)/usr/lib/lua/luci/view/sysauth.htm

	#####$(INSTALL_DIR) $(1)/www/luci-static/openwrt.org/img
	#########$(INSTALL_DATA) ./files/logo.png $(1)/www/luci-static/openwrt.org/img/logo.png
endef

$(eval $(call BuildPackage,ui-8800-10))
