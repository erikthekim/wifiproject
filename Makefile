include $(TOPDIR)/rules.mk

# Name, version and release number
# The name and version of your package are used to define the variable to point to the build directory of your package: $(PKG_BUILD_DIR)
PKG_NAME:=wificlient
PKG_VERSION:=1.0
PKG_RELEASE:=1

# Source settings (i.e. where to find the source code)`
# This is a custom variable, used below
PKG_BUILD_DIR:=$(BUILD_DIR)/wifiproject-1.0.2
PKG_MAINTAINER:=Erik Kim <erikkima13@gmail.com>
PKG_LICENSE:=MIT
HOME_DIR:=/home/erik
PKG_SOURCE:=1.0.2.tar.gz

#change HOME_DIR to your home directory

PKG_SOURCE_URL:=https://github.com/erikthekim/wifiproject/archive/refs/tags/
PKG_HASH:=4a1ff2f10beb01aa6486962de69226ff9a5ba626a2a83f0c816a8f6553b3e248
#HOST_BUILD_DEPENDS:=ruby/host
#PKG_BUILD_DEPENDS:=ruby/host
#PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
#include $(INCLUDE_DIR)/host-build.mk

# Package definition: instructions on how and where our package will appear in the overall configuration menu ('make menuconfig')
define Package/wificlient
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Wificlient
endef

# Package description: a more verbose description on what our package does
define Package/wificlient/description
  A Wificlient module for our project.
endef

define Build/Configure
endef

# Package build instructions; invoke the target-specific compiler to first compile the source file, and then to link the file into the final executable
define Build/Compile
endef

# Package install instructions; create a directory inside the package to hold our executable, and then copy the executable we built previously into the folder

define Package/wificlient/install
		echo "Getting ready..."
		$(INSTALL_DIR) $(1)/usr/bin
		echo "Step 1: INSTALLING THE EXECUTABLES..."
		$(CP) $(PKG_BUILD_DIR)/src/wifi_state_machine.rb $(1)/usr/bin/
		$(INSTALL_DIR) $(1)/usr/files
		
		echo "Step 2"
		$(CP) $(PKG_BUILD_DIR)/files/hostapd.conf $(1)/usr/bin/hostapd.conf
		$(CP) $(PKG_BUILD_DIR)/files/hostapd.wpa_pmk_file $(1)/usr/bin/hostapd.wpa_pmk_file
		$(INSTALL_DIR) $(1)/etc/init.d
		echo "Final Step"
		echo "$(CP) $(PKG_BUILD_DIR)/statemachine.init $(1)/etc/init.d/"
endef

# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call BuildPackage,wificlient))
