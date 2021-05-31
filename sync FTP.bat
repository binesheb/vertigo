echo "create Folder"

mkdir "\\192.168.29.243\Vertigo Admin\boot\vertigo\"
mkdir "\\192.168.29.243\Vertigo Admin\boot\vertigo\asset\"
mkdir "\\192.168.29.243\Vertigo Admin\boot\vertigo\scripts\"

echo "copy files"
copy .\asset\*.* "\\192.168.29.243\Vertigo Admin\boot\vertigo\asset\"
copy .\scripts\*.* "\\192.168.29.243\Vertigo Admin\boot\vertigo\scripts\"
