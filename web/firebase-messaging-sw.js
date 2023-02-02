importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts(
  "https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js"
);

const firebaseConfig = {
  apiKey: "AIzaSyDuaoyhHpJzXyv-MrnKpu1_X93OOrnmUUI",
  authDomain: "vnvc-notification.firebaseapp.com",
  projectId: "vnvc-notification",
  storageBucket: "vnvc-notification.appspot.com",
  messagingSenderId: "319354946505",
  appId: "1:319354946505:web:1b1167d0997f37e49f1e18",
  measurementId: "G-ZVLWMXXRCZ",
};
firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();
console.log(messaging);
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});
