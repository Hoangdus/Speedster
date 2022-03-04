ARCHS = arm64 arm64e
export DEBUG = 0
export FINALPACKAGE = 1

include /var/theos/makefiles/common.mk

TWEAK_NAME = Speedster

Speedster_FILES = Speedster.x
Speedster_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += speedsterprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"