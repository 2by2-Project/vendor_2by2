CUSTOM_TARGET_PACKAGE := $(PRODUCT_OUT)/2by2-Project-$(CUSTOM_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: otapackage bacon
otapackage:
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(CUSTOM_TARGET_PACKAGE)
	$(hide) $(SHA256) $(CUSTOM_TARGET_PACKAGE) | cut -d ' ' -f1 > $(CUSTOM_TARGET_PACKAGE).sha256sum
	$(hide) source ./vendor/2by2/tools/generate_json_build_info.sh $(CUSTOM_TARGET_PACKAGE)
	$(hide) mkdir -p vendor/2by2-ota/$(CUSTOM_BUILD)/
	$(hide) cp $(PRODUCT_OUT)/$(CUSTOM_BUILD).json vendor/2by2-ota/$(CUSTOM_BUILD)/$(CUSTOM_BUILD).json
	@echo -e ""
	@echo -e "2by2 Project OTA package build completed."
	@echo -e ""
	@echo -e "zip: "$(CUSTOM_TARGET_PACKAGE)
	@echo -e "sha256: `cat $(CUSTOM_TARGET_PACKAGE).sha256sum | cut -d ' ' -f 1`"
	@echo -e "size: `ls -lah $(CUSTOM_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

bacon: otapackage
