#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit from mt6768-common
$(call inherit-product, device/xiaomi/mt6768-common/BoardConfigCommon.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# BL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.1-impl \
    android.hardware.bluetooth.audio@2.3-impl \
    libbt-vendor \
    libmtkconfig \
    vendor.mediatek.hardware.btstack@2.0 \

# Display (MediaTek)
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@4.0-impl-mediatek

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.mediatek

# Media
PRODUCT_PACKAGES += \
    libstagefright_softomx_plugin \
    libaudiofoundation \
    libcodec2_hidl@1.2 \
    libsfplugin_ccodec_utils \
    libavservices_minijail

# Audio 
PRODUCT_PACKAGES += \
    libtinycompress \
    tinymix

# Rootdir
PRODUCT_PACKAGES += \
    init.insmod.sh \
    mishow.sh \

PRODUCT_PACKAGES += \
    fstab.mt6768 \
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.mt6768.rc \
    init.mt6768.usb.rc \
    init.mt8786.rc \
    init.mtkgki.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    init_connectivity.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.project.rc \
    meta_init.rc \
    meta_init.vendor.rc \
    multi_init.rc \
	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6768:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.mt6768

PRODUCT_PACKAGES += \
    NoBiometricsOverlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/mediatek \
    hardware/mediatek/libmtkperf_client \
    hardware/lineage/interfaces/power-libperfmgr \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/aospa/interfaces \
    kernel/xiaomi/flare-prebuilt

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/flare/flare-vendor.mk)

PRODUCT_CHARACTERISTICS := tablet,nosdcard
TARGET_SCREEN_HEIGHT := 1340
TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_DENSITY := 179


# Fix CTS MediaProjection error
DISABLE_CTS_TESTS := true


# No biometrics for flare tablet
TARGET_SUPPORTS_FINGERPRINT := false
TARGET_SUPPORTS_FACE_UNLOCK := false
BOARD_USES_FACE_UNLOCK := false
