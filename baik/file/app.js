const express = require('express');
const axios = require('axios');
const fs = require('fs');
const readline = require('readline');
const app = express();
const port = 8080;

app.use(express.static('public')); // Serve static files (HTML, CSS, JS)
app.use(express.urlencoded({ extended: true }));

class Spam {
    constructor(nomer) {
        this.nomer = nomer;
    }

    async kitabisa() {
        try {
            const response = await axios.get(`https://core.ktbs.io/v2/user/registration/otp/${this.nomer}`);
            if (response.status === 200) {
                return `Spamm kitabisa ${this.nomer} Success!`;
            } else {
                return `Spamm kitabisa ${this.nomer} Fail!`;
            }
        } catch (error) {
            return `Spamm kitabisa ${this.nomer} Fail!`;
        }
    }

    // Add other platform methods here (Tokopedia, PHD, etc.)
    // Similar to your original code for each platform's specific request logic
}

// Handle form submission from the client
app.post('/spam', async (req, res) => {
    const { phoneNumber, choice } = req.body;
    const spam = new Spam(phoneNumber);

    let result;

    switch (choice) {
        case '1':
            result = await spam.kitabisa();
            break;
        // Add cases for other platforms
        default:
            result = 'Invalid choice';
    }

    res.send(result); // Send the result back to the client
});

// Serve the HTML page at the root
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/index.html');
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
