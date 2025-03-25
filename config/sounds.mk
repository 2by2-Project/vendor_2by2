# 2by2 Sounds
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/2by2/sounds/,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

# Set default sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.alarm_alert=Birdland.m4a \
    ro.config.notification_sound=Tethys.ogg \
    ro.config.ringtone=Princess_of_Light.ogg
