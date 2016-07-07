#
# Copyright (C) 2016 The Mokee OpenSource Project
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

# inherit from common msm8974
-include device/samsung/msm8974-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/jsglte

TARGET_OTA_ASSERT_DEVICE := jsglte,GT-I9508V

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3  androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
TARGET_KERNEL_CONFIG := msm8974_sec_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8974_sec_jsglte_chncmcc_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/jsglte

# Audio
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# MKHW
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/mkhw
BOARD_HARDWARE_CLASS += hardware/samsung/mkhw

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# GPS
TARGET_NO_RPC := true
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_CACHEIMAGE_PARTITION_SIZE := 364904448
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2365587456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12824064000 # 12442385408 - 16384

# Power HAL
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(DEVICE_PATH)/power/power_ext.c
TARGET_POWERHAL_VARIANT := qcom

# Radio
BOARD_RIL_CLASS := ../../../device/samsung/jsglte/ril

# RIL
BOARD_VENDOR := samsung
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"
BOARD_PROVIDES_LIBRIL := true
TARGET_RIL_VARIANT := caf

# Recovery
#RECOVERY_VARIANT := twrp
ifeq ($(RECOVERY_VARIANT),twrp)
#TWRP Specific Build Flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_CRYPTO := true
TW_NO_EXFAT_FUSE := false
TW_NO_EXFAT := false
GET_RECOVERY_QCOM_RTC_FIX := true
TW_MTP_DEVICE := "/dev/mtp_usb"
TARGET_USERIMAGES_USE_F2FS := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/twrp.fstab
# Chinese Support
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
else
BOARD_CUSTOM_RECOVERY_KEYMAPPING := $(DEVICE_PATH)/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
endif

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Sensor
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# inherit from the proprietary version
-include vendor/samsung/jsglte/BoardConfigVendor.mk
