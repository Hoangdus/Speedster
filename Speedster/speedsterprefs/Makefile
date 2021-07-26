ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SpeedsterPrefs

SpeedsterPrefs_FILES = sdrRootListController.m SdrSwitchCell.m
SpeedsterPrefs_FRAMEWORKS = UIKit
SpeedsterPrefs_PRIVATE_FRAMEWORKS = Preferences
SpeedsterPrefs_INSTALL_PATH = /Library/PreferenceBundles
SpeedsterPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
