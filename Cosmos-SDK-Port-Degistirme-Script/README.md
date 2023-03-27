# COSMOS SDK PROJELERİNDE SUNUCUNUZCA BİRDEN FAZLA NODE ÇALIŞTIRMAK İÇİN PORT DEĞİŞTİRME VE AKTİF ETME

# Aşağıdaki Komutları çalıştırın ve Açıklamaları Takip Edin 

İlk önce git yüklüyoruz
```
sudo apt install git
```

# Mevcut Portları Kontrol edin

```
lsof -i -P -n | grep LISTEN
```

# İlk önce ls -a yaparak .node yazan ve degistirmek istediginiz Cosmos SDK projesinin adini basinda nokta olmadan spripti çalıştırınca ilk yere yazın

```
git clone https://github.com/ahmkah/Cosmos-SDK-Port-Degistirme.git && cd Cosmos-SDK-Port-Degistirme && chmod +x port_degistirme.sh && ./port_degistirme.sh
```

# Değişen Portları Kontrol edin

```
lsof -i -P -n | grep LISTEN
```


# Değişen Portları Kontrol ettiğinizde VPS'inizde aktif olan portlar degismediyse port degistirmek istediginiz node'a manuel olarak restart atin 
Örnegin nibiru projesi için kullanılan systemctl ismi olan nibid gibi.. -->
 
 ```
 sudo systemctl restart nibid 
```


