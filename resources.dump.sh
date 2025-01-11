#dev by adearie
#penggunaan:: #bash resources.dump.sh file.apk > hasil.txt

#!/bin/bash

# Periksa apakah nama file APK disediakan sebagai argumen  
if [ "$#" -ne 1 ]; then  
    echo "Penggunaan: $0 <path_to_apk_file>"
    exit 1  
fi

APK_FILE="$1"

# Periksa apakah file APK ada  
if [ ! -f "$APK_FILE" ]; then  
    echo "File APK tidak ditemukan: $APK_FILE"
    exit 1  
fi

# Menampilkan informasi umum tentang APK  
echo "=== Informasi Umum (Badging) ==="
aapt2 dump badging "$APK_FILE"
echo ""

# Menampilkan konfigurasi sumber daya  
echo "=== Konfigurasi Sumber Daya ==="
aapt2 dump configurations "$APK_FILE"
echo ""

# Menampilkan izin yang diperlukan  
echo "=== Izin yang Diperlukan ==="
aapt2 dump permissions "$APK_FILE"
echo ""

# Menampilkan semua string sumber daya  
echo "=== Semua String Sumber Daya ==="
aapt2 dump resources "$APK_FILE" | grep string  
echo ""

# Menampilkan informasi semua sumber daya  
echo "=== Informasi Semua Sumber Daya ==="
aapt2 dump resources "$APK_FILE"
echo ""

# Menampilkan informasi overlayable  
echo "=== Informasi Overlayable ==="
aapt2 dump overlayable "$APK_FILE"
echo ""

echo "Selesai!"
