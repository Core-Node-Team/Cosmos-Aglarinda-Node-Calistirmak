# Sync (Senkronize olmak) Nedir?
> ### Kurduğunuz düğümün (ağa yeni katılan) blokzincir ile (diğer tüm düğümler) aynı blok yüksekliğine ulaşması ağ ile senkronize olması demektir.
> ### Düğümünüz hangi blok yüksekliğine ulaştıysa o bloğa kadar olan blozincir verisine sahiptir.
> ### Güncel blokzincir verisine sahip olamak ve ağa işlem gönderebilmek için senkronize olmak gerekir.
# Senkronizasyon nasıl sağlanır?
> ### Düğümü kurup başlattıysanız ve peer bulup diğer düğümler ile eşleştiyse blokları indirip senkronize olmaya başlar.
> ### Ağa katıldığınız zamanki blok yüksekliğine, blokların boyutuna, blok oluşma süresine göre senkronize olma süresi çok değişkenlik gösterir.
# Peer nedir?
> ### Kısacası peer ağdaki düğümlerin adresleridir. Bu adresler ile iletişim kurarlar. Peer adresleri `nodeid@ipadresi:portnumarası` formatındadır.
> ### Düğümünüzü diğerlerine eşleşme isteği gönderebilmesi için bu adresleri düğümünüze tanımlamanız gerekir.
> ### Genelde kurulum aşamasında peer ekleme işlemini yaparız fakat bazen düğümünüz peerler ile eşleşmekte zorlanır. Böyle durumlarda yeni peerler eklememiz gerekebilir.
## Peer nasıl eklenir?
> ### İlk olarak `peer` isimli bir değişken oluşturup bu değişkene peer adreslerini atayın.
> ### " " içinde ve aralarında virgül olacak şekilde yazmanız gerekiyor.
```
peers="peer,peer,peer"
```
> Örnek
 > - Bu örneği kullanmayın :)
 ```
 peers="558a27774a8734a1d6c755bf52e734e9994c038d0@34.175.184.161:26656,b899e1d16cafe87e35cb8a0f6d58c9d268632b2b@34.175.240.242:26656,d17c8f39fd87733940ab929ac7a664c99f9f4cc8@34.175.188.173:26656,96cee5276d8bd33be06ceda5eb4dbad20b43e1b4@159.203.62.247:26656"
 ```
 > ### Sıradaki komut ile peer adreslerini config dosyasında ilgili yere kaydedin.
 >  - Bu komutta değiştirmeniz gereken tek yer `.NODEİSMİ`
 >    - Nibiru için `.nibid` Quasar için `.quasarnode` Gitopia için `.gitopiad` vs...
 ```
 sed -i 's|^persistent_peers *=.*|persistent_peers = "'$peers'"|' $HOME/.NODEİSMİ/config/config.toml
 ```
 > ### Son olarak düğümü yeniden başlatın `sudo systemctl restart nodeismi`
 > ## Peer adresinizi öğrenmek için bu komutu kullanabilirsiniz.
```
echo $(NODEİSMİ tendermint show-node-id)'@'$(curl -s ifconfig.me)':'$(cat $HOME/.NODEİSMİ/config/config.toml | sed -n '/Address to listen for incoming connection/{n;p;}' | sed 's/.*://; s/".*//')
```

# Nasıl hızlı senkronize olunur?
> ### Düğümünüz peer buldu blokları indiriyor fakat güncel bloğun çok uzağında ve senkronize olması uzun sürecekse; daha hızlı senksonize olmak için ***snapshot kullanabilir*** veya ***state sync*** yapabilirsiniz.
> ### Her zaman tavsiye edilen; tüm blokları tek tek indirip normal şeklide senkronize olmaktır.
> ### Snapshot veya state sync yapabilmek için bunu sağlayan bir düğüm bulmanız gerekir.
 ## Snapshot nedir?
> ### Belirli bir blok yüksekliğine kadar olan tüm blokları tek seferde bir kaynaktan indirmek ve bu sayede büyük bir blok yüksekliğine daha hızlı ulaşmak.
> ### Snapshot uyguladığınızda düğümünüzün indirdiği blokzincir verisini siler ardından snapshot dosyasını indirirsiniz ve düğümünüz indirdiğiniz yükseklikten itibaren diğer bloklar ile yine tek tek senkronize olmaya devam eder.
> ### Snapshot kullanan düğümler fullnode olmaya devam eder. (tabi indirdiğiniz veri güvenilirse:))

## State Sync nedir?
> ### Belirli bir blok yüksekliğinde anlık görüntüsü alınmış başka bir düğüme bağlanma geri kalan bloklar için bu düğüme güvenme ve bu blok yüksekliğinden itibaren ağa katılmaktır.
> ### State sync yaptığınızda blokzincirin datasını tutmazsınız bunun yerine datayı tutan ve ağ ile senkronize durumdaki başka bir düğüme güvenip ona bağlanırsınız.
> ### Bağlandığınız düğümde bir sorun olması durumunda veya senkronizasyonu bozulduğunda sizin düğümünüzde aynı şekilde etkilenir.
> ### State sync yapan düğümler fullnode olmazlar. (blokzincir datasını tutmadıkları için)
> ### Yapılması genellikle tavsiye edilmez. Hatalara sebebiyet verebilir.
> ### Testnetler için bunu kullanmanın çok sakıncası yoktur. Genellikle datayı tutmak için yeterli depolama alanı kalmadığında bunu kullanırız. Ama aktif sette bir validatörseniz state sync uygulamayın. 







