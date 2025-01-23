
# Membongkar, Memodifikasi, dan Membangun Ulang APK di Terminal

## Langkah-langkah

1. Ubah APK menjadi ZIP:
   ```bash
   mv app.apk app.zip
   ```

2. Ekstrak konten APK:
   ```bash
   unzip app.zip
   ```

3. Ubah DEX ke JAR:
   ```bash
   dex2jar classes.dex
   mv classes-dex2jar.jar classes.jar
   ```

4. Dekompilasi JAR ke Java:
   ```bash
   java -jar procyon-decompiler.jar classes.jar -o java
   ```

5. Kompilasi kembali file Java:
   ```bash
   javac -d output_folder/ java/**/*.java
   ```

6. Konversi kembali ke DEX:
   ```bash
   ./d8 output_folder/ --output new_classes.dex
   ```

7. Ganti file DEX lama dengan yang baru:
   ```bash
   cp new_classes.dex app/classes.dex
   ```

8. Kompres kembali menjadi APK:
   ```bash
   zip -r modified_app.apk app/
   ```

9. Tanda tangani APK:
   ```bash
   keytool -genkey -v -keystore random_keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias random_alias
   apksigner sign --ks random_keystore.jks --ks-key-alias random_alias --out signed.apk modified_app.apk
   ```

10. Verifikasi APK:
    ```bash
    apksigner verify signed.apk
    ```

> **Catatan:** Pastikan Anda memahami legalitas dan risiko dalam membongkar serta memodifikasi APK.
