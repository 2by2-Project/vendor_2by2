#
# Copyright (C) 2024 The 2by2 Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Icons
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/2by2/themes/icons/CustomIcons

# Icon shapes
PRODUCT_PACKAGES += \
    IconShapeRoundedRectRoundedOverlay

# Fonts
PRODUCT_PACKAGES += \
    FontGoogleSansOverlay

PRODUCT_PACKAGES += \
    2by2HeadlineSpecialFontOverlay

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/2by2/prebuilts/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts)
