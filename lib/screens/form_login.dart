import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:netflix_/screens/bottom_navi.dart';
import 'package:netflix_/screens/dumy_data.dart';
import 'package:netflix_/screens/authService.dart';
import 'package:netflix_/screens/form_registred.dart';

import '../main.dart';



var name;

class formlogin extends StatefulWidget {
  const formlogin({Key key}) : super(key: key);

  @override
  State<formlogin> createState() => _formloginState();
}

class _formloginState extends State<formlogin> {

  @override
  void initState() {
    // TODO: implement initState
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('= ${message.notification?.body}');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // await launchUrl(Uri.parse('google.com'));
      print('A new onMessageOpenedApp event was published!');
    });
    super.initState();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vstream'),

        centerTitle: true,

        backgroundColor: Color.fromARGB(255, 3, 3, 3),
      ),
      backgroundColor: Color.fromARGB(255, 196, 196, 196),
      body: getBody(),
    );
  }
  Widget getBody(){
    return Scaffold(
      body: Center(child: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
              TextFormField(
              controller: email,
              decoration: new InputDecoration(
              hintText: "Masukan Email",
              labelText: "EMAIL",
              icon: Icon(Icons.person),
              border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
               ),
              ),
              TextFormField(
              controller: password,
              obscureText: true ,
              decoration: new InputDecoration(
              hintText: "Password",
              labelText: "PASSWORD",
              icon: Icon(Icons.password),
              border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
               ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  AuthServices service = AuthServices(FirebaseAuth.instance);
                  if (await service.logIn(email: email.text, password: password.text)) {
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => bottomNav()
                  ));
                  } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                  content: Text('email or password invalid'),
                  ),
                  );
                  }




                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 255, 0, 17)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum Memiliki akun?"),
                    TextButton(onPressed: () {
                      daftar();
                    },
                    child: Text("Daftar Disini"),
                    ),
                  ],
                ),
              )
             ]),
            ),
          ],
        ),
      )
    ),
  );
}
// Future<void> login() async{
//   if(cek()){
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//       return bottomNav();
//     }));
//
//   }else{
//     Get.defaultDialog(
//       title: "Gagal",
//       middleText: "USERNAME ATAU PASSWORD SALAH"
//     );
//
//   }
//  }
//  bool cek(){
//   for (Map<String, dynamic> item in DummyData.data){
//     if(item ['username'] == email.text && item ['password'] == password.text){
//       name = item['nama'];
//       print(name);
//       return true;
//
//     }
//     return false;
//
//   }
//
//
// //  }
 Future<void> daftar() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return formRegister();
    }));



 }


// Future signIn () async{

//    await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: username.text.trim(), 
//     password: password.text.trim());

//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//       return signUp();
//     }));
// }


}

