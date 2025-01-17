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

CUSTOM_MAINTAINER ?= Unknown

# Maintainer & Version props
PRODUCT_SYSTEM_PROPERTIES += \
    ro.2by2.maintainer=$(CUSTOM_MAINTAINER) \
    ro.2by2.version=$(CUSTOM_VERSION_PROP)

# Internal version
CUSTOM_VERSION := 2by2-Project_$(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)
