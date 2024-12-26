# 2by2-side RRO Overlays
PRODUCT_PACKAGES += \
    2by2FrameworksResOverlay \
    2by2SystemUIResOverlay \
    2by2SettingsResOverlay \
    2by2ExtSettingsStringOverlay \
    2by2LauncherOverlay \
    2by2LineageSetupWizardOverlay \
    2by2SetupWizardOverlay \
    2by2UpdaterOverlay \
    CertifiedPropsOverlayStub

# Optional
PRODUCT_PACKAGES += \
    DisableCameraSoundOverlay \
    DndLegacyIcons

# Standard Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/2by2/overlay/common

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/2by2/overlay/common

# Overlay defaults
PRODUCT_COPY_FILES += \
    vendor/2by2/rro_overlays/config-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/overlay/config/config.xml \
    vendor/2by2/rro_overlays/partition_order.xml:$(TARGET_COPY_OUT_PRODUCT)/overlay/partition_order.xml
