#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=leo

mkdir -p ../../../vendor/htc/$DEVICE/proprietary
unzip -j -o ../../../${DEVICE}_update.zip system/bin/akmd system/bin/mm-venc-omx-test system/bin/parse_radio_log system/etc/01_qcomm_omx.cfg system/etc/AudioBTID.csv system/etc/firmware/bcm4329.hcd system/etc/firmware/default.acdb system/etc/firmware/default_nel.acdb system/etc/firmware/default_france.acdb system/etc/firmware/fw_bcm4329_apsta.bin system/etc/firmware/fw_bcm4329.bin system/etc/firmware/yamato_pfp.fw system/etc/firmware/yamato_pm4.fw system/lib/egl/libEGL_adreno200.so system/lib/egl/libGLESv1_CM_adreno200.so system/lib/egl/libGLESv2_adreno200.so system/lib/egl/libq3dtools_adreno200.so system/lib/libcamera.so system/lib/libgps.so system/lib/libgsl.so system/lib/libhtc_acoustic.so system/lib/libhtc_ril.so system/lib/liblvmxipc.so system/lib/liboemcamera.so system/lib/libOmxVdec.so system/lib/libomx_wmadec_sharedlibrary.so system/lib/libomx_wmvdec_sharedlibrary.so system/lib/libpvasfcommon.so system/lib/libpvasflocalpbreg.so system/lib/libpvasflocalpb.so system/etc/pvasflocal.cfg -d ../../../vendor/htc/$DEVICE/proprietary
chmod 755 ../../../vendor/htc/$DEVICE/proprietary/akmd
chmod 755 ../../../vendor/htc/$DEVICE/proprietary/mm-venc-omx-test
chmod 755 ../../../vendor/htc/$DEVICE/proprietary/parse_radio_log

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/htc/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# This file is generated by device/htc/__DEVICE__/extract-files.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:obj/lib/libcamera.so

# All the blobs necessary for leo
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/akmd:/system/bin/akmd \\
    vendor/htc/__DEVICE__/proprietary/mm-venc-omx-test:/system/bin/mm-venc-omx-test \\
    vendor/htc/__DEVICE__/proprietary/parse_radio_log:/system/bin/parse_radio_log \\
    vendor/htc/__DEVICE__/proprietary/01_qcomm_omx.cfg:/system/etc/01_qcomm_omx.cfg \\
    vendor/htc/__DEVICE__/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \\
    vendor/htc/__DEVICE__/proprietary/bcm4329.hcd:/system/etc/firmware/bcm4329.hcd \\
    vendor/htc/__DEVICE__/proprietary/default.acdb:/system/etc/firmware/default.acdb \\
    vendor/htc/__DEVICE__/proprietary/default_france.acdb:/system/etc/firmware/default_france.acdb \\
    vendor/htc/__DEVICE__/proprietary/default_nel.acdb:/system/etc/firmware/default_nel.acdb \\
    vendor/htc/__DEVICE__/proprietary/fw_bcm4329_apsta.bin:/system/etc/firmware/fw_bcm4329_apsta.bin \\
    vendor/htc/__DEVICE__/proprietary/fw_bcm4329.bin:/system/etc/firmware/fw_bcm4329.bin \\
    vendor/htc/__DEVICE__/proprietary/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \\
    vendor/htc/__DEVICE__/proprietary/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \\
    vendor/htc/__DEVICE__/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:/system/lib/libcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libgsl.so:/system/lib/libgsl.so \\
    vendor/htc/__DEVICE__/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \\
    vendor/htc/__DEVICE__/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \\
    vendor/htc/__DEVICE__/proprietary/liblvmxipc.so:/system/lib/liblvmxipc.so \\
    vendor/htc/__DEVICE__/proprietary/liboemcamera.so:/system/lib/liboemcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxVdec.so:/system/lib/libOmxVdec.so

ifdef WITH_WINDOWS_MEDIA
PRODUCT_COPY_FILES += \\
    vendor/htc/__DEVICE__/proprietary/libomx_wmadec_sharedlibrary.so:system/lib/libomx_wmadec_sharedlibrary.so \\
    vendor/htc/__DEVICE__/proprietary/libomx_wmvdec_sharedlibrary.so:system/lib/libomx_wmvdec_sharedlibrary.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasfcommon.so:system/lib/libpvasfcommon.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasflocalpbreg.so:system/lib/libpvasflocalpbreg.so \\
    vendor/htc/__DEVICE__/proprietary/libpvasflocalpb.so:system/lib/libpvasflocalpb.so \\
    vendor/htc/__DEVICE__/proprietary/pvasflocal.cfg:system/etc/pvasflocal.cfg
endif

EOF

./setup-makefiles.sh
