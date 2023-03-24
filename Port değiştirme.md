<div align="center">

<h1> Cosmos Nodelerinde Port Değiştirme </h1>

  <h3>
    
   </div>   
  
# Port nedir
> ### Nodeların diğer nodeler ile haberleşmek ve blok zinciri verilerini senkronize etmek için belirli bir port numarası kullanırlar. Her blockchain ağı farklı bir port numarası kullanabilir. Bu port numaraları, düğümün diğer düğümlerle iletişim kurabilmesi için açık olması gereken ağ portlarıdır. Blockchain ağına katılmak isteyen bir düğüm, diğer düğümlerle haberleşmek için belirli bir port numarasını açarak blok zinciri verilerini senkronize edebilir ve yeni işlemleri yayabilir. 
# Ne için port değiştirilir
> ### Arkadaşlar bazen bir sunucuya birden fazla node kurmak isteyebiliriniz. Bu durumda karşınıza çıkabilecek problemlerden biri, iki nodenin kullandığı portların ortak olması sebebiyle birinin çalışmaması. Çözümü nodelardan birinin kullandığı portu değiştirmek.
> ### Bu rehberde bir Cosmos SDK nodenin kullandığı portları nasıl değiştireceğinizi açıklayacağım.
# Nasıl değiştirilir
> ### İlk olarak `YENI_PORT`isimli bir değişkene değer atayın.
>  - `30`yazan yere 40 50 60  da yazabilirsiniz farketmez
```  
YENI_PORT=30
```
> ### Sed komutu ile `config.toml`ve `app.toml`dosyalarındaki port numaralarını atadığınız değişken ile değiştirin.
> - Bu iki komutta değiştirmeniz gereken tek yer `.NODEİSMİ` yazan yer
> - nibiru için `nibid`gitopia için `.gitopiad` quasar için `.quasarnode` vs...  
```
sed -i.bak -e "s%^proxy_app = \"tcp://127.0.0.1:26658\"%proxy_app = \"tcp://127.0.0.1:${YENI_PORT}658\"%; s%^laddr = \"tcp://127.0.0.1:26657\"%laddr = \"tcp://127.0.0.1:${YENI_PORT}657\"%; s%^pprof_laddr = \"localhost:6060\"%pprof_laddr = \"localhost:${YENI_PORT}060\"%; s%^laddr = \"tcp://0.0.0.0:26656\"%laddr = \"tcp://0.0.0.0:${YENI_PORT}656\"%; s%^prometheus_listen_addr = \":26660\"%prometheus_listen_addr = \":${YENI_PORT}660\"%" $HOME/.NODEİSMİ/config/config.toml
```
```
sed -i.bak -e "s%^address = \"tcp://0.0.0.0:1317\"%address = \"tcp://0.0.0.0:${YENI_PORT}317\"%; s%^address = \":8080\"%address = \":${YENI_PORT}080\"%; s%^address = \"0.0.0.0:9090\"%address = \"0.0.0.0:${YENI_PORT}090\"%; s%^address = \"0.0.0.0:9091\"%address = \"0.0.0.0:${YENI_PORT}091\"%" $HOME/.NODEİSMİ/config/app.toml
```
>  ### Son olarak nodeyi tekrar başatın
> `sudo systemctl restart nodeismi`  
