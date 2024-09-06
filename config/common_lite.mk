PRODUCT_BRAND ?= 2by2-Project-Lite

# Audio
include vendor/2by2/config/audio.mk

# RRO Overlays
include vendor/2by2/config/rro_overlays.mk

# Bootanimation
include vendor/2by2/config/bootanimation.mk

# Bootanimation
include vendor/2by2/config/version.mk

# Font
$(call inherit-product, vendor/2by2/prebuilts/fonts_sgr_sgm/fonts.mk)

# Conditionally enable blur
TARGET_USES_BLUR ?= true

ifeq ($(TARGET_USES_BLUR), true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1
endif

# Keys
-include vendor/2by2-example-keys/keys.mk
