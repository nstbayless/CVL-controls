set -e

FLIPS="./flips/flips-linux"
DST="build"

if ! command -v z80asm &> /dev/null
then
    echo "z80asm required. (On ubuntu: sudo apt install z80asm)"
    exit 1
fi

if ! [ -f base-us.gb ] && ! [ -f base-jp.gb ]
then
    echo "at least one of the following ROMS is required: base-us.gb, base-jp.gb"
    exit 1
fi

chmod u+x "$FLIPS"

if [ -d "$DST" ]
then
    rm -r "$DST"
fi

mkdir "$DST"

function getLabel() {
    A=$(sed 's/[\t ]\+/ /g' "$1" | grep -oP "(?<=$2"': equ \$).*')
    if [ -z "$A" ]; then
        return 1
    else
        echo "0x$A"
        return 0
    fi
}

function build() {
    BASEPATCH=$1
    BASEROM=$2
    EXPORT=$3
    BUILDNAME=$BASEROM-$4
    echo "Assembling patch $EXPORT/$BUILDNAME"
    chmod a-w base-$BASEROM.gb
    shift
    shift
    shift
    shift
    
    echo "incbin 'base-$BASEROM.gb'" > cfg.asm
    echo "rom_us: equ 10" >> cfg.asm
    echo "rom_jp: equ 11" >> cfg.asm
    echo "rom_type: equ rom_$BASEROM" >> cfg.asm
    
    while [ $# -gt 0 ]
    do
        echo "$1" >> cfg.asm
        shift
    done
    
    md5sum base-$BASEROM.gb
    sha256sum base-$BASEROM.gb
    crc32 base-$BASEROM.gb
    
    PATCH="$BASEPATCH.asm"
    
    z80asm -v -o $BUILDNAME.gb --label=$BUILDNAME.lbl -i cfg.asm $PATCH
    $FLIPS -c --ips base-$BASEROM.gb $BUILDNAME.gb $BUILDNAME.ips

    mkdir -p "$DST/$EXPORT/$BASEROM"
    cp "$BUILDNAME.ips" "$DST/$EXPORT/$BASEROM"
}

function simplemd5() {
    md5sum "$1" | cut -d ' ' -f 1
}

build patch us cvleg-no-aircontrol no-aircontrol "NO_CONTROL: equ 1" "NO_VCANCEL: equ 0"
build patch us cvleg-no-aircontrol no-aircontrol-no-vcancel "NO_CONTROL: equ 1" "NO_VCANCEL: equ 1"

build patch jp cvleg-no-aircontrol no-aircontrol "NO_CONTROL: equ 1" "NO_VCANCEL: equ 0"
build patch jp cvleg-no-aircontrol no-aircontrol-no-vcancel "NO_CONTROL: equ 1" "NO_VCANCEL: equ 1"

cp README.txt "$DST/cvleg-no-aircontrol/README.txt"

if [ -f "cvleg-no-aircontrol.zip" ]
then
    rm *.zip
fi
7z a "./cvleg-no-aircontrol.zip" "./$DST/cvleg-no-aircontrol"

exit 0
