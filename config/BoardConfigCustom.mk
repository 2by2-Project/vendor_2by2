include vendor/2by2/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

include vendor/2by2/config/BoardConfigSoong.mk

-include vendor/motorola/apps/BoardConfigVendor.mk
