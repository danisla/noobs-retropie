# NOOBS installer for RetroPie

Scripts to create NOOBs installer for RetroPie.

RetroPie project: http://blog.petrockblock.com/retropie

## Usage:

First, download the standard version of the SD card image from: http://blog.petrockblock.com/retropie/retropie-downloads/retropie-sd-card-image-for-raspberry-pi-2-2/

Uncompress it:

```
gunzip retropie-v3.4-rpi2.img.gz
```

Export the full path to the .img file to the `RPI_IMG` variable.

```
export RPI_IMG=/Users/disla/Downloads/retropie-v3.4-rpi2.img
```

Run the install.sh script to (optionally) format the SD card, build the boot and root tarballs and copy to your SD card:

```
./install.sh
```
