var firebaseConfig = {
    apiKey: "AIzaSyCkVvqvnv-QxCKcL1CYRT1wT_dsg2epioE",
    authDomain: "focused-elysium-308503.firebaseapp.com",
    projectId: "focused-elysium-308503",
    storageBucket: "focused-elysium-308503.appspot.com",
    messagingSenderId: "907968763197",
    appId: "1:907968763197:web:d1fcf378adf80192dda154",
    measurementId: "G-ZM6QQTCPG1"
};
firebase.initializeApp(firebaseConfig);
firebase.analytics();

var vap = 'BHRkjMoh0w2x_E2AwGorWXhPS3SJVdNa0Yvf2A4qLiIDmDFgMa3wTsiwCwc_ctykue6NkAmb6DIl6fc6-rQa0-4'



admin.initializeApp({
    credential: admin.credential.applicationDefault(),
    databaseURL: 'https://mytestproject-b66b1-default-rtdb.firebaseio.com'
});