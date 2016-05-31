# Release name
PRODUCT_RELEASE_NAME := jsglte

# Inherit some common MK stuff.
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/jsglte/device_jsglte.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := jsglte
PRODUCT_NAME := mk_jsglte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := jsglte
PRODUCT_MANUFACTURER := samsung
