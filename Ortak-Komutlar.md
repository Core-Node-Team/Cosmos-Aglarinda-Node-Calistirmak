

## Cosmos SDK projelerinin hepsi aynı altyapı üzerine kurulmuştur ve node çalıştırırken aynı komutları kullanırız fakat bu komutlarda bazı değişkenler vardır bunlar:
* ###  node ismi: tamamına yakınında projenin isminin sonuna d eklenmiş hali node ismidir sei için seid, gitopia için gitopiad, stride için strided...
* ###  token ismi: her ağın bir tokeni vardır ve bu bu tokenin ismi genelde ağın ismi ile aynıdır fakat komutlarda bir tokenin milyonda biri birimi ile kullanırız bunun için de token isminin başına u eklenir . sei için usei gitopia için utlore stride için ustride...
* ###  chain-id: her zincirin bir chain id'si vardır, bunu proje ekibi kafasına göre belirliyor sanırım, nodunu kurduğunuz ağın chain id'sini bilirsiniz zaten
* ### cüzdanismi: cüzdan oluştururken ismini belirlersiniz
* ###  moniker: bu da validatörünüzün ismidir ve kendiniz belirlersiniz


## senkronizasyon durumu:
```
nodeismi status 2>&1 | jq .SyncInfo
```
## validatör durumu:
```
nodeismi status 2>&1 | jq .ValidatorInfo
```
## node durumu:
```
nodeismi status 2>&1 | jq .NodeInfo
```
# Cüzdan Komutları
## cüzdan oluşturma
```
nodeismi keys add cüzdanismi
```
> bu komuttan sonra şifre oluşturmanızı ister (cüzdan şifresi)
## var olan cüzdanı recover (geri getirmek) etmek : 
```
nodeismi keys add cüzdanismi -–recover
```
> bu komuttan sonra mnemonic girmenizi ister
## mevcut cüzdan(lar)ı listeleme : 
```
nodeismi keys list
```
## cüzdan silme:
```
nodeismi keys delete cüzdanismi
```
## cüzdan bakiyesini öğrenme: 
```
nodeismi query bank balances cüzdan adresi
```
# Transaction komutları
> Transaction komutlarından sonra cüzdan şifresi ister şifreyi girdikten sonra işlemi onaylıyor musunuz diye sorar y/n. y dedikten sonra bir txhash verir bunu explorerda arattığınızda SUCCESS (başarılı) veya FAİLED (başarısız) olduğunu görürsünüz. Başarısız olan işlemlerin hata mesajında sebebi yazar.
## validatör oluşturma:
> bu komuta opsiyonel olarak `--website` `--identity` `--details` flaglarını da ekleyebilirsiniz. `--amount`kısmındaki miktarı cüzdanınızdaki bakiyeye göre belirlersiniz.
```
nodeismi tx staking create-validator \
  --amount 000000tokenismi \
  --from cüzdanismi \
  --commission-max-change-rate "0.01" \
  --commission-max-rate "0.2" \
  --commission-rate "0.07" \
  --min-self-delegation "1" \
  --pubkey  $(nodeismi tendermint show-validator) \
  --moniker moniker \
  --chain-id chain id \
  --fees 250tokenismi
  ```
> ###  örnek olarak gitopiada validatör oluşturmak için kullandığım komut:
```
gitopiad tx staking create-validator \
  --amount 8000000utlore \
  --from socrates \
  --commission-max-change-rate "0.01" \
  --commission-max-rate "0.2" \
  --commission-rate "0.06" \
  --min-self-delegation "1" \
  --pubkey  $(gitopiad tendermint show-validator) \
  --moniker Socrates \
  --website "https://twitter.com/0xSocrates_"
  --identity 52B4347D67822C
  --chain-id gitopia-janus-testnet-2
  ```
## delegate:
> valoper adresini explorerdan öğrenebilirsiniz
```
nodeismi tx staking delegate valoperadresi 0000000tokenismi --from cüzdanismi --chain-id chain id --fees 250tokenismi --gas auto
```  
> ###  örnek
```
gitopiad tx staking delegate gitopiavaloper1n55ayalxs0vmx2xqzgeav45x5qwa5qwezdlt7r 1000000utlore --from socrates --chain-id gitopia-janus-testnet-2 --fees 250utlore --gas auto
```  
## redelegate:
> `1.valoperadresi` tokenlerin stakede bulunduğu adres `2.valoperadresi` ise redelegate etmek istediğiniz adres
```
nodeismi tx staking redelegate 1.valoperaddresi 2.valoperadres 0000000tokenismi --from cüzdanismi --chain-id chain id --fees 250tokenismi --gas auto
```
> ###  örnek gitopia için kullandığım komut:
```
gitopiad tx staking redelegate gitopiavaloper1n55ayalxs0vmx2xqzgeav45x5qwa5qwezdlt7r gitopiavaloper1vpxhyqh3qug8zyv7n89vwm3hvhfw7mxpe2dg28 1000000utlore --from socrates --chain-id gitopia-janus-testnet-2 --fees 250utlore --gas auto
```
## başka cüzdana transfer:
> eğer komut hata verirse cüzdanismi yerine cüzdan adresini yazarak deneyin
```
nodeismi tx bank send cüzdanismi hedefcüzdanadresi 000000tokenismi --from cüzdanismi --chain-id chain id --fees 250tokenismi --gas auto
```
> ### örnek:
```
gitopiad tx bank send socrates gitopia1u4tpzghqkumfa8dza6zl028jfxex6nkl7pj6ta 10utlore --chain-id gitopia-janus-testnet-2 --fees 250utlore --gas auto
```
## kendi validatörünüze ait komisyon ve ödülleri çekme: 
```
nodeismi tx distribution withdraw-rewards valoperadresiniz --commission --from cüzdanismi --chain-id chain id --fees 250tokenismi --gas auto
```
## bütün validatörlerden ödülleri çekme(başka validatöre delege ettiyseniz): 
```
nodeismi tx distribution withdraw-all-rewards --from cüzdanismi --chain-id chain id --fees 250tokenismi --gas auto
```
## validatör unjail komutu (jailden kurtulma): 
```
nodeismi tx slashing unjail --from cüzdanismi --chain-id chain id --gas auto
```
## proposallarda oy kullanma: 
* bu komuttaki `1` proposal numarasıdır kaçıncı proposala oy veriyorsanız onun numarsını yazarsınız. `yes` kısmı ise kullandığınız oy no yazabilirsiniz
```
nodeismi tx gov vote 1 yes --from cüzdanismi --chain-id chain id  --gas auto –y  
```
