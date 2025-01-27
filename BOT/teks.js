const fs = require('fs');
fs.appendFileSync('bot-log.txt', `Log: Pesan dari ${sender}: ${messageContent}\n`);
