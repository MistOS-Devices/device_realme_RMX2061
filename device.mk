#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

include device/realme/RMX2061/configs/camera.mk

# Inherit from sm7125-common
$(call inherit-product, device/realme/sm7125-common/common.mk)

# Inherit proprietary targets
include vendor/realme/RMX2061/RMX2061-vendor.mk

# Apply camera replacements after the stock vendor copy rules.
ifeq ($(TARGET_INCLUDE_OPLUS_CAMERA),true)
include vendor/oplus/camera/profiles/rmx2061/rmx2061.mk
endif

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/odm/,$(TARGET_COPY_OUT_ODM)/etc) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/vendor/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/svi_config_19720.xml:$(TARGET_COPY_OUT_VENDOR)/etc/svi_config_19720.xml

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.RMX2061.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.RMX2061.rc

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay
