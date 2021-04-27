// const visitor = document.getElementById('visitor');

const apiUrl = "https://func-jbtresume-prod-001.azurewebsites.net/api/VisitorCounter?code=";
const appendUrl = "Erm6RLbtmGXPKytsrDRS5tJPOb5m5IqaaGuGXPA4D24gSOD7qrFWGQ==";

fetch([apiUrl, appendUrl].join(''))
    .then(response => {
        return response.json();
    })
    .then (response => {
        console.log('Fetch succeeded to function.');
        console.log(response);
        count = response.VisitorCount;
        document.getElementById('visitor').innerHTML = 'You are visitor ' + count + '.';
    })
    .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
    });
