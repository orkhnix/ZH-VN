# kakathic
TOME=$GITHUB_WORKSPACE
sudo apt install zipalign >/dev/null

apktool () { java -jar $TOME/.github/Tools/apktool-2.6.2.jar "$@"; }       

unapk () {
echo "Unpack: ${1##*/}"
apktool d -q -r -f "$1" -o "${1%.*}"
}

repapk () {
echo "Repack: ${1##*/}"
apktool b -q -c -f "${1%.*}" -o "$TOME/Op/${1##*/}"
zipalign -f 4 "$TOME/Op/${1##*/}" "$TOME/Up/${1##*/}"
}

mkdir -p $TOME/Up
Timkiem () { grep -Rl "$1" $2; }

Thaythe () {
Tt1="$(Timkiem "$1" "$3")"
[ "$Tt1" ] && echo "MOD: $1 -> $2" | sed "s|\\\/|/|g"
for Tt2 in $Tt1; do
[ "$Tt2" ] && sed -i -e "s|$1|$2|g" $Tt2
done
}

modTT(){
Thaythe "Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z" "Le/k/a;->a:Z" "${1%.*}/smali*"
Thaythe "ro.miui.region" "ro.khu.vuc" "${1%.*}/smali*"
Thaythe "ro.product.mod_device" "ro.product.vip" "${1%.*}/smali*"
}

unapk "$TOME/Hpk/com.miui.weather2.apk"
modTT "$TOME/Hpk/com.miui.weather2.apk"
repapk "$TOME/Hpk/com.miui.weather2.apk"


