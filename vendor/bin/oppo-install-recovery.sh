#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:c4e372e8b571f385106e3e931bfe3db66440b95e; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:c0a63dd444d366bc31c4197f77cc9d25484626bf \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:c4e372e8b571f385106e3e931bfe3db66440b95e && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
