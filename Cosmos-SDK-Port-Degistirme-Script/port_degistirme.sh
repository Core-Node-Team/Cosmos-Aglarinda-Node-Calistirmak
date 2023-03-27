#!/bin/bash
echo -e ''
echo -e '\e[0;36m'
echo -e '           /$$                     /$$                 /$$       '
echo -e '          | $$                    | $$                | $$       '
echo -e '  /$$$$$$ | $$$$$$$  /$$$$$$/$$$$ | $$   /$$  /$$$$$$ | $$$$$$$  '
echo -e ' |____  $$| $$__  $$| $$_  $$_  $$| $$  /$$/ |____  $$| $$__  $$ '
echo -e '  /$$$$$$$| $$  \ $$| $$ \ $$ \ $$| $$$$$$/   /$$$$$$$| $$  \ $$ '
echo -e ' /$$__  $$| $$  | $$| $$ | $$ | $$| $$_  $$  /$$__  $$| $$  | $$ '
echo -e '|  $$$$$$$| $$  | $$| $$ | $$ | $$| $$ \  $$|  $$$$$$$| $$  | $$ '
echo -e ' \_______/|__/  |__/|__/ |__/ |__/|__/  \__/ \_______/|__/  |__/ '
echo " COSMOS SDK NODE'LAR ICIN PORT DEGISTIRME VE PORTU OTOMATIK AKTIF ETME SCRIPTI "                                                         
echo -e '\e[0m'
echo -e ''

GREEN="\e[32m"
NC="\e[0m"
BINARY=$(uname -m)

#!/bin/bash

sleep 2

echo "Proje Adı: "
read PROJE
echo "Prox_App Port(Default- 26658) :"
read PROXY
echo "Laddr_Port(Default-26657) :"
read LADDR
echo "Proof_Laddr Port(Default-6060) :"
read PROOF
echo  "Laddr2 Port(26656):"
read LADDR2
echo "Prometheus Port (Defaul-26660 ):"
read PROM
DATA=("."$PROJE)
echo "App.toml Port 1 (Default-9090):"
read APP1
echo "App.Toml Port 2 (Default-9091):"
read APP2
echo "Node Port(Default-26657):"
read NODE
sed -i.bak -e "s%^proxy_app = \"tcp://127.0.0.1:26658\"%proxy_app = \"tcp://127.0.0.1:$PROXY\"%; s%^laddr = \"tcp://127.0.0.1:26657\"%laddr = \"tcp://127.0.0.1:$LADDR\"%; s%^pprof_laddr = \"localhost:6060\"%pprof_laddr = \"localhost:$PROOF\"%; s%^laddr = \"tcp://0.0.0.0:26656\"%laddr = \"tcp://0.0.0.0:$LADDR2\"%; s%^prometheus_listen_addr = \":26660\"%prometheus_listen_addr = \":$PROM\"%" $HOME/$DATA/config/config.toml

sed -i.bak -e "s%^address = \"0.0.0.0:9090\"%address = \"0.0.0.0:$APP1\"%; s%^address = \"0.0.0.0:9091\"%address = \"0.0.0.0:$APP2\"%" $HOME/$DATA/config/app.toml

sed -i.bak -e "s%^node = \"tcp://localhost:26657\"%node = \"tcp://localhost:$NODE\"%" $HOME/$DATA/config/client.toml

systemctl stop $PROJE"d"
systemctl start $PROJE"d"

echo " "

echo "--------------------------------"
echo "İşlem başarılı..."
echo "--------------------------------"

sleep 2

sleep 3 

echo " Simdi Değişen Portlar Otomatik Olarak Aktif Ediliyor son olarak y yazıp entera basin "
sudo apt install -y ufw
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow 26658
sudo ufw allow 26657
sudo ufw allow 6060
sudo ufw allow 26656
sudo ufw allow 26660
sudo ufw allow 9090
sudo ufw allow 9091
sudo ufw allow $PROJE
sudo ufw allow $PROXY
sudo ufw allow $LADDR
sudo ufw allow $LADDR2
sudo ufw allow $PROOF
sudo ufw allow $PROM
sudo ufw allow $APP1 
sudo ufw allow $APP2
sudo ufw allow $NODE
sudo ufw enable

sleep 3 
