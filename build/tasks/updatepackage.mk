CUSTOM_FASTBOOT_PACKAGE := $(PRODUCT_OUT)/$(CUSTOM_BUILD)-img.zip

.PHONY: updatepackage
updatepackage:
	$(hide) mv $(INTERNAL_UPDATE_PACKAGE_TARGET) $(CUSTOM_FASTBOOT_PACKAGE)
	@echo -e ""
	@echo -e "2by2 Project fastboot package build completed."
	@echo -e ""
	@echo -e "zip: "$(CUSTOM_FASTBOOT_PACKAGE)
	@echo -e "size: `ls -lah $(CUSTOM_FASTBOOT_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""
