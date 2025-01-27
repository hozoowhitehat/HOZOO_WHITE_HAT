const { default: makeWASocket, useMultiFileAuthState, DisconnectReason } = require('@adiwajshing/baileys');
const { Boom } = require('@hapi/boom');
const qrcode = require('qrcode-terminal');

const startBot = async () => {
    // Menggunakan multi-file auth state untuk menyimpan sesi
    const { state, saveCreds } = await useMultiFileAuthState('./auth_info');
    const sock = makeWASocket({
        auth: state,
        printQRInTerminal: true, // QR Code akan muncul di terminal
    });

    // Event: Saat terhubung
    sock.ev.on('connection.update', (update) => {
        const { connection, lastDisconnect } = update;
        if (connection === 'close') {
            const shouldReconnect =
                (lastDisconnect.error)?.output?.statusCode !== DisconnectReason.loggedOut;
            console.log('Koneksi terputus. Reconnecting:', shouldReconnect);
            if (shouldReconnect) startBot();
        } else if (connection === 'open') {
            console.log('Bot terhubung ke WhatsApp!');
        }
    });

    // Event: Saat menerima pesan
    sock.ev.on('messages.upsert', async (m) => {
        const msg = m.messages[0];
        if (!msg.message) return;

        const sender = msg.key.remoteJid;
        const messageContent = msg.message.conversation || msg.message.extendedTextMessage?.text;

        console.log(`Pesan dari ${sender}: ${messageContent}`);

        // Perintah: Tambah user ke grup
        if (messageContent?.startsWith('!add ')) {
            const number = messageContent.split(' ')[1];
            const userId = `${number}@s.whatsapp.net`;
            await sock.groupParticipantsUpdate(sender, [userId], 'add');
            sock.sendMessage(sender, { text: `Berhasil menambahkan ${number} ke grup!` });
        }

        // Perintah: Kick user dari grup
        if (messageContent?.startsWith('!kick ')) {
            const number = messageContent.split(' ')[1];
            const userId = `${number}@s.whatsapp.net`;
            await sock.groupParticipantsUpdate(sender, [userId], 'remove');
            sock.sendMessage(sender, { text: `Berhasil menghapus ${number} dari grup!` });
        }

        // Perintah: Set pesan selamat datang (watermark)
        if (messageContent?.startsWith('!welcome ')) {
            const welcomeMessage = messageContent.replace('!welcome ', '');
            sock.sendMessage(sender, { text: `Pesan selamat datang diatur ke:\n${welcomeMessage}` });
        }
    });

    // Simpan sesi saat ada perubahan
    sock.ev.on('creds.update', saveCreds);
};

startBot();
                                       
