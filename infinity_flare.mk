#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from generic device
$(call inherit-product, device/xiaomi/flare/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

PRODUCT_DEVICE := flare
PRODUCT_NAME := infinity_flare
PRODUCT_BRAND := xiaomi
PRODUCT_MODEL := flare
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

INFINITY_MAINTAINER := KSN & MintVioletAurora
TARGET_HAS_UDFPS := false
WITH_GAPPS := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="missi_pad_global-user 14 UP1A.231005.007 V816.0.5.0.UHXMIXM release-keys" \
    BuildFingerprint := Android/missi_pad_global/missi:14/UP1A.231005.007/V816.0.5.0.UHXMIXM:user/release-keys