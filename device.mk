#
# Copyright (C) 2022 The LineageOS Project
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
#

# Inherit from motorola sm6375-common
$(call inherit-product, device/motorola/sm6375-common/common.mk)

TARGET_SCREEN_DENSITY := 420

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 420dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Resource Overlays
PRODUCT_PACKAGES += \
    FrameworksResMiami \
    SettingsProviderResMiami \
    SettingsResMiami \
    SystemUIResMiami

# Camera
PRODUCT_PACKAGES += \
    libgui_shim_vendor

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630947043778501761.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630947043778501761.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.miami \
    com.motorola.hardware.biometric.fingerprint@1.0.vendor \
    vendor.egistec.hardware.fingerprint@4.0.vendor

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/goodix_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/ReadyForAirRemote_Consumer_Control.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ReadyForAirRemote_Consumer_Control.kl \
    $(LOCAL_PATH)/configs/keylayout/ReadyForAirRemote_Keyboard.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ReadyForAirRemote_Keyboard.kl

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    android.hardware.nfc@1.2.vendor \
    android.hardware.secure_element@1.2.vendor \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

# Virtual A/B
TARGET_IS_VAB := true

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 31

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $f)))

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/miami/miami-vendor.mk)
