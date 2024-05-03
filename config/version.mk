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

# Add suffix when building VANILLA edition
ifeq ($(WITH_GMS),false)
  VANILLA_SUFFIX := -VANILLA
endif

# Internal version
LINEAGE_VERSION := 2by2-Project-$(PLATFORM_VERSION)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)$(VANILLA_SUFFIX)

# Display version
LINEAGE_DISPLAY_VERSION := $(LINEAGE_VERSION)
