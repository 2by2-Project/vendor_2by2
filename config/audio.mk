LOCAL_PATH := vendor/2by2/audio

# Alarms
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/alarms,$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms)

# Ringtones
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/ringtones,$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones)

# Notifications
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/notifications,$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications)

# UI
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/ui,$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui)

# 2019 Material product sounds (CC-BY 4.0)
# Source: https://material.io/design/sound/sound-resources.html
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/2by2/audio/material/,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

# Default Sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Princess_of_Light.ogg \
    ro.config.alarm_alert=Birdland.m4a \
    ro.config.notification_sound=material_simple-celebration_1.ogg
