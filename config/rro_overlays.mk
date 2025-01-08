# 2by2-side RRO Overlays
PRODUCT_PACKAGES += \
    2by2FrameworksResOverlay \
    2by2SystemUIResOverlay \
    2by2SettingsResOverlay \
    2by2LauncherOverlay \
    2by2LineageSetupWizardOverlay

# Optional
PRODUCT_PACKAGES += \
    DisableCameraSoundOverlay

# Standard Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/2by2/overlay/common

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/2by2/overlay/common
