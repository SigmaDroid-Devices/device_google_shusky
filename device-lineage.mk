#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable CSI checking
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := false

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.mep.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.mep.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay

# Face Unlock
-include vendor/google/faceunlock/device.mk

# Kernel
TARGET_PREBUILT_KERNEL := device/google/shusky-kernel/Image.lz4

# PixelParts (HBM)
include packages/apps/PixelParts/device.mk

# PowerShare
include hardware/google/pixel/powershare/device.mk

# wireless_charger HAL service
include device/google/gs-common/wireless_charger/wireless_charger.mk

# Gapps
WITH_GMS := true
WITH_GAPPS := true
BUILD_GMS_OVERLAYS_AND_PROPS := true
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true

# Sigma build flags
SIGMA_BUILD_TYPE := OFFICIAL
SIGMA_MAINTAINER := Albinoman887
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_IS_PIXEL := true
TARGET_SUPPORTS_CLEAR_CALLING := true

# Build necessary packages for vendor

# Codec2
PRODUCT_PACKAGES += \
    libexynosv4l2

# Graphics
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# Identity credential
PRODUCT_PACKAGES += \
    android.hardware.identity_credential.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal
