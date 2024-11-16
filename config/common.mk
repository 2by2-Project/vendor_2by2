PRODUCT_BRAND ?= 2by2-Project

# Audio
include vendor/2by2/config/audio.mk

# Packages
include vendor/2by2/config/packages.mk

# RRO Overlays
include vendor/2by2/config/rro_overlays.mk

# Themes
include vendor/2by2/config/themes.mk

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

# Avoid artifact path requirements
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    $(strip $(shell cat vendor/2by2/config/artifact_path_requirement_allowed_list.txt))

# Conditionally enable blur
TARGET_USES_BLUR ?= true

ifeq ($(TARGET_USES_BLUR), true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1
endif

# Translations
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/2by2-crowdin/overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/2by2-crowdin/overlay

# Keys
-include vendor/2by2-example-keys/keys.mk

# Certification
$(call inherit-product-if-exists, vendor/certification/config.mk)
