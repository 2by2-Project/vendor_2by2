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

# Additional supported old Pixels
LEGACY_PIXELS := \
    redfin \
    bramble \
    sunfish

# Set automatically for supported all Pixels
ifneq ($(filter $(LINEAGE_BUILD),$(shell cat vendor/lineage/vars/pixels) $(LEGACY_PIXELS)),)
  TARGET_IS_PIXEL := true
endif

ifeq ($(TARGET_IS_PIXEL),true)
$(call inherit-product, vendor/2by2/config/pixel.mk)
endif

# Font
$(call inherit-product, vendor/2by2/prebuilts/fonts_sgr_sgm/fonts.mk)

# Keys
-include vendor/2by2-example-keys/keys.mk

# Certification
$(call inherit-product-if-exists, vendor/certification/config.mk)
