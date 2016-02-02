#!/usr/bin/env bash

source .commonfunc
source .pifunc

OS="RetroPie"
CFG_BASE="$(pwd)"
OS_BASE="${CFG_BASE}/os"
RPI_IMG="${RPI_IMG}"

[[ -z "${RPI_IMG}" ]] && log "ERROR: Cannot build ${os} tarballs, RPI_IMG is not set, must point to .img file." && exit 1

get_sd_card
[[ -z "$disk" ]] && log "ERROR: No SD card, exiting." && exit 1

NEW_CARD=$(get_input "Format SD card and install ${OS}? (skip if card has already been prepared) (y/n)")
INIT=false
[[ "$NEW_CARD" == "y" ]] && INIT=true

if [[ $INIT == true ]]; then
    format_sdcard "$disk"
    [[ $? -ne 0 ]] && log "ERROR: Could not format SD card." && exit 1
fi

get_boot_dir
[[ -z "$boot" ]] && log "ERROR: Could not find boot dir on $disk" && exit 1

if [[ $INIT == true ]]; then
    install_noobs "$boot" && install_os "$boot" "$OS" "$OS_BASE"
    [[ $? -ne 0 ]] && log "ERROR: Could not install NOOBS at: ${boot}" && exit 1
fi

if [[ ! -d "${boot}/os/${OS}" ]]; then
    install_os "$boot" "$OS" "$OS_BASE"
    [[ $? -ne 0 ]] && log "ERROR: Could not install "${OS}" at: ${boot}" && exit 1
fi
