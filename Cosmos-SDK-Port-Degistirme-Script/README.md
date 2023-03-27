# COSMOS SDK PROJELERİNDE SUNUCUNUZCA BİRDEN FAZLA NODE ÇALIŞTIRMAK İÇİN PORT DEĞİŞTİRME VE AKTİF ETME

# Aşağıdaki Komutları çalıştırın ve Açıklamaları Takip Edin 

İlk önce git yüklüyoruz
```
sudo apt install git
```
İlk önce ls -a yaparak .node yazan ve degistirmek istediginiz projenin adini basinda nokta olmadan ilk yere yazın

```
git clone https://github.com/ahmkah/Cosmos-SDK-Port-Degistirme.git && cd Cosmos-SDK-Port-Degistirme && chmod +x port_degistirme.sh && ./port_degistirme.sh
```

VPS'inizde aktif olan portlar degismediyse port degistirmek istediginiz node'a manuel olarak restart atin 
Ornegin: sudo systemctl restart nibid 

Kontrol edin

```
lsof -i -P -n | grep LISTEN
```

