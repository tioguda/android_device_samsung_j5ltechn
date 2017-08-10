PRODUCT_PROPERTY_OVERRIDES := \
    ro.ota.romname=Validus-j5ltechn \
    ro.ota.version=$(shell date +%F%H | sed s@-@@g) \
    ro.ota.manifest=https://basketbuild.com/uploads/devs/tioguda/Validus/j5ltechn/7.1.2/j5ltechn.xml

#Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/j5ltechn/j5ltechn-vendor.mk)

# Inherit from common
$(call inherit-product, device/samsung/j5-common/device-common.mk)

LOCAL_PATH := device/samsung/j5ltechn

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Common overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#NFC
PRODUCT_PACKAGES += \
	com.android.nfc.helper \
	com.android.nfc_extras \
	libnfc_nci \
	libnfc_nci_jni \
	nfc_nci.pn54x.msm8916 \
	NfcNci \
	Tag

# NFC configs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml \
	$(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
	$(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml
