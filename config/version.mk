# Copyright (C) 2020 YAAP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
PRODUCT_VERSION_MAJOR := 1
PRODUCT_VERSION_MINOR := 5
CUSTOM_BUILD_VERSION_CODENAME := Vanadium

# Versioning System
BUILD_DATE := $(shell date +%Y%m%d)
TARGET_PRODUCT_SHORT := $(CUSTOM_BUILD)
CUSTOM_BUILDTYPE ?= HOMEMADE
CUSTOM_BUILD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)
ifeq (user,$(TARGET_BUILD_VARIANT))
CUSTOM_PROD := ota-prod
else
CUSTOM_PROD := ota
endif
CUSTOM_VERSION := $(CUSTOM_BUILD_VERSION_CODENAME)-$(TARGET_PRODUCT_SHORT)-$(CUSTOM_PROD)-$(BUILD_DATE)-$(shell date +%H%M%S)
ROM_FINGERPRINT := 2by2-Project/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.2by2.build.version=$(CUSTOM_BUILD_VERSION) \
  ro.2by2.build.date=$(BUILD_DATE) \
  ro.2by2.buildtype=$(CUSTOM_BUILDTYPE) \
  ro.2by2.fingerprint=$(ROM_FINGERPRINT) \
  ro.2by2.version=$(CUSTOM_VERSION) \
  ro.2by2.device=$(CUSTOM_BUILD) \
  ro.modversion=$(CUSTOM_VERSION)

# Signing
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/2by2/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/2by2/signing/keys/releasekey
ifneq ($(TARGET_NO_OEM_UNLOCK),true)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
endif
ifneq (,$(wildcard vendor/2by2/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/2by2/signing/keys/otakey.x509.pem
endif
endif
