# Name of the application
APPLICATION = mqtt-connect-test

BOARD ?= native

RIOTBASE ?= $(CURDIR)/../../RIOT

CFLAGS += -DEVELHELP

# Change this to 0 to show compiler invocation lines by default
QUIET ?= 1

WIFI_SSID ?= "TIM-26374786"
WIFI_PASS ?= "C7AkkbPh2NH9X7mCTAap2Y2Y"



USEMODULE += gnrc_netif_default
USEMODULE += auto_init_gnrc_netif
USEMODULE += gnrc_sock_udp
USEMODULE += gnrc_udp
USEMODULE += gnrc_netif_event
USEMODULE += gnrc_ipv6_default
USEMODULE += gnrc_icmpv6_echo
USEMODULE += gnrc_ipv6_router_default
USEMODULE += gnrc_icmpv6_error
USEMODULE += auto_init_gnrc_ipv6
USEMODULE += gnrc_udp
USEMODULE += gnrc_ipv6_router
USEMODULE += gnrc_sock_udp
USEMODULE += saul_default
USEMODULE += fmt
USEMODULE += gnrc_rpl
USEMODULE += gnrc_netapi

# MQTT-SN client
USEMODULE += mqtt_sn

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

