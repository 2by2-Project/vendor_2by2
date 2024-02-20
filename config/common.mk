PRODUCT_BRAND ?= 2by2-Project

# Audio
include vendor/2by2/config/audio.mk

# Packages
include vendor/2by2/config/packages.mk

# RRO Overlays
include vendor/2by2/config/rro_overlays.mk

# Bootanimation
include vendor/2by2/config/bootanimation.mk

# Version
include vendor/2by2/config/version.mk

# Inherit Pixel stuff
TARGET_IS_PIXEL ?= false
TARGET_IS_PIXEL_6 ?= false
TARGET_IS_PIXEL_7 ?= false
TARGET_IS_PIXEL_8 ?= false
TARGET_IS_PIXEL_FOLD ?= false
TARGET_PIXEL_STAND_SUPPORTED ?= false

ifeq ($(TARGET_IS_PIXEL),true)
$(call inherit-product, vendor/2by2/config/pixel.mk)
endif

# Font
$(call inherit-product, vendor/2by2/prebuilts/fonts_sgr_sgm/fonts.mk)
