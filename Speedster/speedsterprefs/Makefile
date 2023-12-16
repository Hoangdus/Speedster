ARCHS = arm64 arm64e
SDK_PATH = $(THEOS)/sdks/iPhoneOS13.7.sdk/
SYSROOT = $(SDK_PATH)

include $(THEOS)/makefiles/common.mk
export THEOS_PACKAGE_SCHEME=rootless

BUNDLE_NAME = SpeedsterPrefs

SpeedsterPrefs_FILES = sdrRootListController.m SdrSwitchCell.m
SpeedsterPrefs_FRAMEWORKS = UIKit
SpeedsterPrefs_PRIVATE_FRAMEWORKS = Preferences
SpeedsterPrefs_INSTALL_PATH = /Library/PreferenceBundles
SpeedsterPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
