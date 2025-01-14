#
# Copyright (C) 2020-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Reduce gapps
TARGET_USES_MINI_GAPPS ?= true

ifeq ($(TARGET_USES_MINI_GAPPS),true)
# Choose AOSP Dialer to default
PRODUCT_PACKAGES += 2by2DefaultDialerOverlay
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
