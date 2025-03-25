BOOT_ANIMATION_SYMLINKS := $(TARGET_OUT)/media
$(BOOT_ANIMATION_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Boot animation symlinks: $@"
	@mkdir -p $@
	$(hide) ln -sf /product/media/bootanimation.zip $@/bootanimation.zip

ALL_DEFAULT_INSTALLED_MODULES += $(BOOT_ANIMATION_SYMLINKS)
