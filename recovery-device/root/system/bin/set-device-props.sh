#!/sbin/sh

set_device_codename() {
	resetprop "ro.build.product" "$1"
	resetprop "ro.omni.device" "$1"
	resetprop "ro.product.device" "$1"
	for i in odm product system system_ext vendor; do
		resetprop "ro.product.${i}.device" "$1"
	done
}

set_device_model() {
	resetprop "ro.product.model" "$1"
	for i in odm product system system_ext vendor; do
		resetprop "ro.product.${i}.model" "$1"
	done
}

case "$(cat /sys/firmware/devicetree/base/model)" in
	"Qualcomm Technologies, Inc. xiaomi apollo")
		set_device_codename "apollo"
		set_device_model "Redmi K30S Ultra / Mi 10T / Mi 10T Pro"
		;;
	"Qualcomm Technologies, Inc. xiaomi cas")
		set_device_codename "cas"
		set_device_model "Mi 10 Ultra"
		;;
	"Qualcomm Technologies, Inc. xiaomi cmi")
		set_device_codename "cmi"
		set_device_model "Mi 10 Pro"
		;;
	"Qualcomm Technologies, Inc. xiaomi lmi")
		set_device_codename "lmi"
		set_device_model "POCO F2 Pro / Redmi K30 Pro"
		;;
	"Qualcomm Technologies, Inc. xiaomi umi")
		set_device_codename "umi"
		set_device_model "Mi 10"
		;;
esac

exit 0
