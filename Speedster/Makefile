ARCHS = arm64 arm64e
SDK_PATH = $(THEOS)/sdks/iPhoneOS13.7.sdk/
SYSROOT = $(SDK_PATH)
export DEBUG = 1
export FINALPACKAGE = 0
export THEOS_DEVICE_IP = localhost
export THEOS_DEVICE_PORT=2222
export THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Speedster

Speedster_FILES = Speedster.x
Speedster_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += speedsterprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
