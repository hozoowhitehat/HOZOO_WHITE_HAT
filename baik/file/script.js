document.getElementById('spam-form').addEventListener('submit', async (event) => {
    event.preventDefault();

    const phoneNumber = document.getElementById('phone-number').value;
    const choice = document.getElementById('spam-type').value;

    const response = await fetch('/spam', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `phoneNumber=${phoneNumber}&choice=${choice}`
    });

    const result = await response.text();
    document.getElementById('result').textContent = result;
});
