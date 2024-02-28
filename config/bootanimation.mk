# Boot Animation

LOCAL_PATH := vendor/2by2/prebuilts/bootanimation

SUPPORTED_RES := $(strip $(notdir $(shell ls $(LOCAL_PATH)/*.zip)))

# If TARGET_BOOT_ANIMATION_RES is empty or not supported
ifeq ($(filter $(SUPPORTED_RES),$(TARGET_BOOT_ANIMATION_RES).zip),)

  # If TARGET_SCREEN_WIDTH value is supported, use TARGET_SCREEN_WIDTH as default.
  # Otherwise use 1080p as default.
  ifneq ($(filter $(SUPPORTED_RES),$(TARGET_SCREEN_WIDTH).zip),)
    TARGET_BOOT_ANIMATION_RES := $(TARGET_SCREEN_WIDTH)
  else
    TARGET_BOOT_ANIMATION_RES := 1080
  endif

  $(warning Hmm. looks like your TARGET_BOOT_ANIMATION_RES is not defined, or not supported. Assuming default $(TARGET_BOOT_ANIMATION_RES)p!)

endif

PRODUCT_COPY_FILES += $(LOCAL_PATH)/$(TARGET_BOOT_ANIMATION_RES).zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
