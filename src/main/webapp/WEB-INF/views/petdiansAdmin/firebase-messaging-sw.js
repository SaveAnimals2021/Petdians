// Get registration token. Initially this makes a network call, once retrieved
// subsequent calls to getToken will return from cache.
// messaging.getToken({ vapidKey: 'BNBLn3FDBERRj4AgSm5vFJKkvnB9oa0NFMSp9u5YYp9W5mHoYeJiaNwYXAGArpTzH7TqocVSvakjDZ1v4wKzzPc' }).then((currentToken) => {
//     console.log('getToken');
//     if (currentToken) {
//         // Send the token to your server and update the UI if necessary
//         // ...
//         console.log('All is well.');
//     } else {
//         // Show permission request UI
//         console.log('No registration token available. Request permission to generate one.');
//         // ...
//     }
// }).catch((err) => {
//     console.log('An error occurred while retrieving token. ', err);
//     // ...
// });