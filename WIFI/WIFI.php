<?php
// IP Router dan Community String SNMP
$router_ip = '192.168.1.1'; // Ganti dengan IP Router Anda
$community = 'public';

// Menjalankan SNMP untuk mengambil informasi
$devices = snmpwalk($router_ip, $community, "1.3.6.1.2.1.4.22.1.2");

if ($devices === false) {
    echo "Gagal mendapatkan daftar perangkat.";
} else {
    echo "Daftar perangkat yang terhubung ke jaringan:\n";
    foreach ($devices as $device) {
        echo "$device\n";
    }
}
?>
