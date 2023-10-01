# Name of the application
APPLICATION = mqtt-connect-test

BOARD ?= native

RIOTBASE ?= $(CURDIR)/../../RIOT

CFLAGS += -DEVELHELP

# Change this to 0 to show compiler invocation lines by default
QUIET ?= 1

WIFI_SSID ?= "TIM-26374786"
WIFI_PASS ?= "C7AkkbPh2NH9X7mCTAap2Y2Y"



# Modules to include
USEMODULE += analog_util
USEMODULE += periph_gpio
USEMODULE += periph_gpio_irq
USEMODULE += xtimer

USEMODULE += fmt
USEPKG += paho-mqtt

FEATURES_REQUIRED += periph_gpio periph_adc periph_i2c


USEMODULE += ztimer

include $(RIOTBASE)/Makefile.include

