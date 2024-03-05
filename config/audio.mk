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

# Default Sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Frail_Naysayer.mp3 \
    ro.config.alarm_alert=Alarm003301.m4a \
    ro.config.notification_sound=Notice003201.m4a
