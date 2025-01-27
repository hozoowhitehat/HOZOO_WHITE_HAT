sock.ev.on('group-participants.update', async (update) => {
    if (update.action === 'add') {
        const user = update.participants[0];
        sock.sendMessage(update.id, {
            text: `Selamat datang, @${user.split('@')[0]}!`,
            mentions: [user],
        });
    }
});
