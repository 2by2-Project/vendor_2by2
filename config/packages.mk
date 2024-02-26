#
# Copyright (C) 2020-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Gapps
WITH_GMS ?= true

# GMS Flags
TARGET_USES_MINI_GAPPS ?= false

TARGET_SUPPORTS_QUICK_TAP ?= true
TARGET_USES_PIXEL_LAUNCHER ?= false
FORCE_AOSP_DIALER ?= true
FORCE_AOSP_CONTACTS ?= true

ifeq ($(WITH_GMS),true)

ifeq ($(TARGET_USES_MINI_GAPPS),true)
  $(call inherit-product, vendor/gms/gms_mini.mk)
else
  $(call inherit-product, vendor/gms/gms_full.mk)
endif

ifeq ($(TARGET_USES_PIXEL_LAUNCHER), true)
  PRODUCT_PACKAGES += NexusLauncherRelease
endif

ifneq ($(FORCE_AOSP_DIALER), true)
  PRODUCT_PACKAGES += GoogleDialer
endif

ifneq ($(FORCE_AOSP_CONTACTS), true)
  PRODUCT_PACKAGES += GoogleContacts
endif

endif

# Add su only userdebug and eng builds
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
  PRODUCT_PACKAGES += su
endif

# SH apps
TARGET_SHIPS_SHAPPS ?= false

ifeq ($(TARGET_SHIPS_SHAPPS), true)
  $(call inherit-product-if-exists, vendor/sh-fwk/config.mk)
endif
