m="\033[1;31m"   # Merah
h="\033[1;32m"   # Hijau
k="\033[1;33m"   # Kuning
b="\033[1;34m"   # Biru
bl="\033[1;36m"  # Biru Muda
p="\033[1;37m"   # Putih
u="\033[1;35m"   # Ungu
pu="\033[1;30m"  # Abu-abu
c="\033[1;96m"   # Cyan Terang
bg_m="\033[41m"  # Latar Belakang Merah
bg_h="\033[42m"  # Latar Belakang Hijau
bg_k="\033[43m"  # Latar Belakang Kuning
bg_b="\033[44m"  # Latar Belakang Biru
bg_bl="\033[46m" # Latar Belakang Biru Muda
bg_p="\033[47m"  # Latar Belakang Putih
bg_u="\033[45m"  # Latar Belakang Ungu
bg_pu="\033[40m" # Latar Belakang Abu-abu
res="\033[0m"    # Reset semua atribut

e="-e"
e="echo -e "
s="sleep 1"
ss="sleep 2"
sss="sleep 3"

clear
echo -e "$u╔══════════════════════════════════════════════╗$res"
echo -e "$u║$m    WELCOME TO HOZOO WHITE HAT TOOLS IMUT     $u║$res"
echo -e "$u╚══════════════════════════════════════════════╝$res"
sleep  1
clear
echo -e "$b╔══════════════════════════════════════════════╗$res"
echo -e "$b║$h    WELCOME TO HOZOO WHITE HAT TOOLS IMUT     $b║$res"
echo -e "$b╚══════════════════════════════════════════════╝$res"
sleep  1
clear
echo -e "$u╔══════════════════════════════════════════════╗$res"
echo -e "$u║$m    WELCOME TO HOZOO WHITE HAT TOOLS IMUT     $u║$res"
echo -e "$u╚══════════════════════════════════════════════╝$res"
sleep  2
#!/bin/bash

# Definisikan warna
b="\033[1;34m"  # Biru
m="\033[1;31m"  # Merah
h="\033[1;32m"  # Hijau
k="\033[1;33m"  # Kuning
res="\033[0m"    # Reset

# Fungsi untuk loading progress
loading() {
    echo -e "$k[■■■■■■■■■■]$res"
    sleep 0.5
    echo -e "$k[■■■■■■■■■■ ]$res"
    sleep 0.5
    echo -e "$k[■■■■■■■■■■ ]$res"
    sleep 0.5
    echo -e "$k[■■■■■■■■■■■■]$res"
    sleep 0.5
    echo -e "$k[■■■■■■■■■■■■■■■]$res"
      echo -e "$k[■■■■■■■■■■■■■■■■■■■■■■■■■]$res"

}

# Tampilan login
clear
echo -e "$u╔══════════════════════════════════════════════╗$res"
echo -e "$u║$h    WELCOME TO HOZOO WHITE HAT TOOLS IMUT     $u║$res"
echo -e "$u╚══════════════════════════════════════════════╝$res"
# Meminta username dan password
read -p "Username: " username
read -sp "Password: " password
echo

# Mengecek username dan password
if [[ "$username" == "hozoo" && "$password" == "imut" ]]; then
    echo -e "$h Login successful! $res"
    loading
    echo -e "$h Welcome, $username! $res"
else
    echo -e "$h  password salah silakan beli dulu api key nya harga 50k. $res"
fi

clear
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $bg_m IP : 170.0.0.0                                               $u║$res"
$e "$u║ $b Author :$u HOZOO WHITE HAT                                     $u║$res"
$e "$u║ $b LIRIS :$u 2025-01-27 JANUARI                                   $u║$res"
$e "$u║ $b ID TERMUX :$m VPN                                             $u║$res"
$e "$u║ $b SEKARANG : $h ONLINE                                           $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
m="\033[1;31m"   # Merah
h="\033[1;32m"   # Hijau
k="\033[1;33m"   # Kuning
b="\033[1;34m"   # Biru
bl="\033[1;36m"  # Biru Muda
p="\033[1;37m"   # Putih
u="\033[1;35m"   # Ungu
pu="\033[1;30m"  # Abu-abu
c="\033[1;96m"   # Cyan Terang
bg_m="\033[41m"  # Latar Belakang Merah
bg_h="\033[42m"  # Latar Belakang Hijau
bg_k="\033[43m"  # Latar Belakang Kuning
bg_b="\033[44m"  # Latar Belakang Biru
bg_bl="\033[46m" # Latar Belakang Biru Muda
bg_p="\033[47m"  # Latar Belakang Putih
bg_u="\033[45m"  # Latar Belakang Ungu
bg_pu="\033[40m" # Latar Belakang Abu-abu
res="\033[0m"    # Reset semua atribut

e="-e"
e="echo -e "
s="sleep 1"
ss="sleep 2"
sss="sleep 3"
clear


$e "$u╔════════════════════════════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $bg_k  🌍 IP : 170.0.0.0                 $bg_m $bg_m       $bg_m    $k  $bg_k $bg_k                                        $u║$res"
$e "$u║ $bg_k 💃Author :$u HOZOO WHITE HAT         $bg_m              $bg_k                                         $u║$res"
$e "$u║ $bg_k 🗓️ LIRIS :$u 2025-01-27 JANUARI       $bg_p              $bg_k  tanggal=$(date +"%A, %d %B %Y")        $u║$res"
$e "$u║ $bg_k ID TERMUX :$m VPN                    $bg_p              $bg_k  waktu=$(date +"%H:%M:%S")⠀         ⠀              $u║$res"
$e "$u║ $bg_k SEKARANG : $bg_h ONLINE $bg_k $u                                                                      $u║$res"
$e "$u╚════════════════════════════════════════════════════════════════════════════════════════════╝$res"
sleep 2
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [01]. MENU SPAM FOR SMS                                           $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [02]. MENU SPAM TERMINAL UNBAN FOR BAN WA                         $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [03]. MENU CAMPHIS FOR ZXPHISZER AKUN PHISING                     $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [04]. MENU DDOS                                                   $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [05]. MENU BUG TERMUX                                             $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [06]. MENU VPN TERMUX                                             $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [07]. MENU INSTALL KALI LINUX 2020                                $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [08]. MENU SCAN URL VIRUS FOR NO VIRUS                            $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [09]. MENU DEFACE GITHUB HOSTING WEB ONLINE                       $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [10]. MENU MENGHEMAT BATATERAI CPU ANDROID                        $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [11]. MENU OSINT                                                  $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [12]. MENU BOT WA                                                 $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [13]. MENU CHAT ROOM V.3.0.7                                      $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [14]. MENU TXT UNBAN FOR BAN WHATS APP                            $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [15]. MENU LAGU MUSIC                                             $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [16]. MENU RAT BOT TELEGRAM                                       $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [17]. MENU SPAM BOT TELE MASUKIN LINK                             $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [18]. DONASI HOZOO WHITE HAT                                      $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [19]. UPDATE TOOLS HOZOO WHITE HAT IMUT GEMOY                     $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$u╔═════════════════════════════════════════════════════════════════════╗$res"
$e "$u║ $h $bg_m [20]. LAPOR BUG                                                   $u║$res"
$e "$u╚═════════════════════════════════════════════════════════════════════╝$res"
$e "$bg_m ╭─[ $bg_m HOZOO_WHITE_HAT_IMUT_GENOY@localhost ~/home $res"
sleep 1
read -p "╰─$" updt
if [ $updt = 1 ] || [ $updt = 01 ]
then
pkg update
clear
fi
if [ $updt = 2 ] || [ $updt = 02 ]
then
pkg update
clear
fi

if [ $updt = 3 ] || [ $updt = 03 ]
then
pkg update
clear
fi
if [ $updt = 4 ] || [ $updt = 04 ]
then
pkg update
clear

fi
if [ $updt = 5 ] || [ $updt = 05 ]
then
pkg update
clear
fi
if [ $updt = 6 ] || [ $updt = 06 ]
then
pkg update
clear
fi
if [ $updt = 7 ] || [ $updt = 07 ]
then
pkg update
clear
fi
if [ $updt = 8 ] || [ $updt = 08 ]
then
pkg update
clear
fi
if [ $updt = 9 ] || [ $updt = 09 ]
then
pkg update
clear
fi
if [ $updt = 10 ] || [ $updt = 10 ]
then
pkg update
clear
fi
if [ $updt = 11 ] || [ $updt = 11 ]
then
pkg update
cd

clear

git clone https://github.com/hozoowhitehat/HOZOO_WHITE_HAT

clear

cd HOZOO_WHITE_HAT clear

cd file

clear

chmod +x OSINT.sh

./OSIMT
fi
if [ $updt = 12 ] || [ $updt = 12 ]
then
pkg update
clear
fi
if [ $updt = 13 ] || [ $updt = 13 ]
then
pkg update
clear
fi
if [ $updt = 14 ] || [ $updt = 14 ]
then
pkg update
clear
fi
if [ $updt = 15 ] || [ $updt = 15 ]
then
pkg update
clear
fi
if [ $updt = 16 ] || [ $updt = 16 ]
then
pkg update
clear
fi
if [ $updt = 17 ] || [ $updt = 17 ]
then
pkg update
clear
fi
if [ $updt = 18 ] || [ $updt = 18 ]
then
pkg update
clear
fi
if [ $updt = 19 ] || [ $updt = 19 ]
then
pkg update
fi
if [ $updt = 20 ] || [ $updt = 20 ]
then
clear
$e "$u ================================= $u"
$e "$u == $bg_m [ $bg_h lapor bug   $$m = $u"
$e "$u ================================== $u"
xdg-open "https://www.tiktok.com/@systemumbrelladrakk999?_t=ZS-8tPqhH85ZMy&_r=1"
fi

