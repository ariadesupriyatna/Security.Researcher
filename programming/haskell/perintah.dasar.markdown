# Perintah-perintah Dasar pada Haskell

Untuk menggunakan Haskell, kita membuka terminal, masuk ke folder yang berisi `file.hs` alias file Haskell kita, lalu ketik `ghci`. Setelah itu, kita dapat menggunakan perintah-perintah ini:

---

### :quit atau :q  
Untuk keluar dari `ghci`.

---

### :help atau :h  
Untuk menampilkan perintah yang tersedia.

---

### :load myFile.hs atau :l myFile.hs  
Untuk memuat file `myFile.hs`.

---

### :reload atau :r  
Untuk memuat ulang file yang sedang dimuat.

---

### :info ATypeClass atau :i ATypeClass  
Untuk mendapatkan info tentang kelas tipe `ATypeClass`.  
Sebagai contoh:  
- `:i []`  
- `:i Int`

---

### :type expression atau :t expression  
Untuk mengetahui jenis ekspresi.  
Contoh:  
- `:t True`  
- `:t (\x -> x + 1)`

---

### :kind Datatype atau :k Datatype  
Untuk mengetahui jenis datatype/konstruktor `Datatype`.  
Contoh:  
- `:k Int`  
- `:k []`  
- `:k (->)`

---

### :module + HaskellModule atau :m + HaskellModule  
Untuk memuat/menambahkan modul `HaskellModule` dari pustaka-pustaka Haskell.  
Contoh:  
- `:m + System.IO`  
- `:m + Data.Map`

---

### :module - HaskellModule atau :m - HaskellModule  
Untuk mencopot/menghapus modul `HaskellModule` dari lingkungan saat ini.  
Contoh:  
- `:m - System.IO`  
- `:m - Data.Map`
