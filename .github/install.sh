# kakathic

TOME="$GITHUB_WORKSPACE"
TOOLS="$TOME/.github/Tools"

apktool(){ java -jar $TOOLS/apktool-2.6.2.jar "$@"; }     
baksmali(){ java -jar $TOOLS/baksmali-2.3.4.jar d "$@"; }     
smali(){ java -jar $TOOLS/smali-2.5.2.jar a "$@"; }     
sudo apt install zipalign >/dev/null








echo '{
"version": "'$Phienban'",
"versionCode": "'$Phienban2'",
"zipUrl": "https://github.com/kakathic/ZH-VN/releases/download/Download/VH-MI_'$Phienban'.Zip",
"changelog": "https://raw.githubusercontent.com/kakathic/ZH-VN/ZH/Web/Version.md"
}' > $GITHUB_WORKSPACE/Up/Up.json

cd $GITHUB_WORKSPACE/Module
zip -qr $GITHUB_WORKSPACE/VH-MI_$Phienban.Zip *

