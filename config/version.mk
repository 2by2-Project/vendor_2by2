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

CUSTOM_BUILD_TYPE ?= COMMUNITY
CUSTOM_MAINTAINER ?= Unknown

# We supports VANILLA, but community builds only.
ifeq ($(WITH_GMS),false)
  ifeq ($(CUSTOM_BUILD_TYPE),OFFICIAL)
    $(error Official builds must be GAPPS only.)
  endif
  CUSTOM_BUILD_TYPE := VANILLA
endif

# Maintainer props
PRODUCT_SYSTEM_PROPERTIES += \
    ro.2by2.buildtype=$(CUSTOM_BUILD_TYPE) \
    ro.2by2.maintainer=$(CUSTOM_MAINTAINER)

# Internal version
LINEAGE_VERSION := 2by2-Project-$(PLATFORM_VERSION)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(CUSTOM_BUILD_TYPE)

# Display version
LINEAGE_DISPLAY_VERSION := $(LINEAGE_VERSION)
