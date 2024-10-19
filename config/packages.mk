#
# Copyright (C) 2020-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Gapps
WITH_GMS ?= true

# GMS Flags
TARGET_USES_MINI_GAPPS ?= false
TARGET_USES_PICO_GAPPS ?= false

TARGET_SUPPORTS_QUICK_TAP ?= true
TARGET_USES_PIXEL_LAUNCHER ?= false
FORCE_AOSP_DIALER ?= true
FORCE_AOSP_CONTACTS ?= true

ifeq ($(WITH_GMS),true)
  ifeq ($(TARGET_USES_PICO_GAPPS),true)
    $(call inherit-product, vendor/gms/gms_pico.mk)
  else ifeq ($(TARGET_USES_MINI_GAPPS),true)
    $(call inherit-product, vendor/gms/gms_mini.mk)
  else
    $(call inherit-product, vendor/gms/gms_full.mk)
  endif
  PRODUCT_PACKAGES += GoogleConfigOverlay
  TARGET_GAPPS_ARCH ?= arm64
  $(call inherit-product, vendor/gapps/$(TARGET_GAPPS_ARCH)/$(TARGET_GAPPS_ARCH)-vendor.mk)
endif

# Some prebuilt goodies
TARGET_INCLUDE_EXTRA_APPS ?= true

ifeq ($(TARGET_INCLUDE_EXTRA_APPS), true)
  $(call inherit-product, vendor/2by2-prebuilt-apps/apps.mk)
endif

# Add su only userdebug and eng builds
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
  PRODUCT_PACKAGES += su
  PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += system/xbin/su
endif

# SH apps
TARGET_SHIPS_SHAPPS ?= false

ifeq ($(TARGET_SHIPS_SHAPPS), true)
  $(call inherit-product-if-exists, vendor/sh-fwk/config.mk)
endif
