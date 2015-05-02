#
# Author: Xiangfu Liu <xiangfu@openmobilefree.net>
# Address: 12h6gdGnThW385JaX1LRMA8cXKmbYRTP8Q
#
# This is free and unencumbered software released into the public domain.
# For details see the UNLICENSE file at the root of the source tree.
#

include $(TOPDIR)/rules.mk

MINER_TYPE:=S3


PKG_NAME:=cgminer
#PKG_VERSION:=3.4.3
#PKG_VERSION:=3.8.5
#PKG_VERSION:=3.12.0
#PKG_VERSION:=4.6.1
PKG_VERSION:=4.9.0
# Date:   Sun Sep 22 08:30:59 2013 -0700
PKG_REV:=7a7e8f1eb242a9356a63c1db9b9e1706c561ad9d
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.bz2
#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/jameshilliard/cgminer.git -b bitmain-s3
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/cgminer
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=cgminer (FPGA Miner)
	URL:=https://github.com/ckolivas/cgminer
	DEPENDS:=+libcurl +libpthread +jansson +udev
endef

define Package/cgminer/description
Cgminer is a multi-threaded multi-pool GPU, FPGA and CPU miner with ATI GPU
monitoring, (over)clocking and fanspeed support for bitcoin and derivative
coins. Do not use on multiple block chains at the same time!
endef

CONFIGURE_ARGS += --disable-opencl --disable-adl --disable-nurses --enable-bitmain
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/Compile
	$(call Build/Compile/Default)
	(cd $(PKG_BUILD_DIR) && \
	  $(TARGET_CC) -Icompat/jansson-2.6/src -Icompat/libusb-1.0/libusb \
	  api-example.c -o cgminer-api;)
endef


define Package/cgminer/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/config

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cgminer-api $(1)/usr/bin

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cgminer $(1)/usr/bin
	$(INSTALL_BIN) $(FILES_DIR)/cgminer-monitor       $(1)/usr/bin
	$(INSTALL_BIN) $(FILES_DIR)/cgminer.init          $(1)/etc/init.d/cgminer

ifeq ($(MINER_TYPE),S3++)
	$(CP)          $(FILES_DIR)/cgminer_s3++.config     $(1)/etc/config/cgminer
else
	$(CP)          $(FILES_DIR)/cgminer.config     $(1)/etc/config/cgminer
endif

ifeq ($(MINER_TYPE),S3)
		$(CP)          $(FILES_DIR)/asic-freq.config     $(1)/etc/config/asic-freq
else
		$(CP)          $(FILES_DIR)/s1-asic-freq.config     $(1)/etc/config/asic-freq
endif	
	rm -rf $(1)/usr/bin/compile_time
	date >> $(1)/usr/bin/compile_time
	echo $(MINER_TYPE)
	echo $(MINER_TYPE) >> $(1)/usr/bin/compile_time
endef

$(eval $(call BuildPackage,cgminer))
