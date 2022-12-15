ARCHS = arm64 arm64e
export DEBUG = 0
export FINALPACKAGE = 1
export THEOS_DEVICE_IP = localhost
export THEOS_DEVICE_PORT=2222

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Speedster

Speedster_FILES = Speedster.x
Speedster_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += speedsterprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
