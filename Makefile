THEOS_DEVICE_IP=192.168.1.15
TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RicoTwitterPlus

RicoTwitterPlus_FILES = $(wildcard *.xm *.m)
RicoTwitterPlus_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
