# Copyright (C) 2024 The 2by2 Project
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

PRODUCT_VERSION_MAJOR := 1
PRODUCT_VERSION_MINOR := 5b
CUSTOM_BUILD_VERSION_CODENAME := Vanadium
CUSTOM_MAINTAINER ?= Unknown

# Versioning System
CUSTOM_BUILD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)

# Add suffix when building VANILLA edition
ifeq ($(WITH_GMS),false)
  VANILLA_SUFFIX := -VANILLA
endif

# Maintainer props
PRODUCT_PRODUCT_PROPERTIES += \
    ro.2by2.build.version.codename=$(CUSTOM_BUILD_VERSION_CODENAME) \
    ro.2by2.build.version=$(CUSTOM_BUILD_VERSION)

# Device info
CUSTOM_PROCESSOR_INFO ?= Unknown

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.2by2_processor_info=$(subst $() ,_,$(CUSTOM_PROCESSOR_INFO)) \
    persist.sys.device_camera_info_rear=$(CUSTOM_CAMERA_REAR_INFO) \
    persist.sys.device_camera_info_front=$(CUSTOM_CAMERA_FRONT_INFO)

# Internal version
LINEAGE_VERSION := 2by2-Project-$(PLATFORM_VERSION)-$(shell date -u +%Y%m%d_%H%M%S)-$(LINEAGE_BUILD)$(VANILLA_SUFFIX)

# Display version
LINEAGE_DISPLAY_VERSION := $(LINEAGE_VERSION)
