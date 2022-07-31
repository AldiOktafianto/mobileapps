import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix_/screens/authService.dart';
import 'package:netflix_/screens/bottom_navi.dart';



var name;

class formRegister extends StatefulWidget {
  const formRegister({Key key}) : super(key: key);

  @override
  State<formRegister> createState() => _formRegister();
}

class _formRegister extends State<formRegister> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),

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
                    hintText: "New Email",
                    labelText: "NEW EMAIL",
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                TextFormField(
                  controller: password,
                  obscureText: true ,
                  decoration: new InputDecoration(
                    hintText: "New Password",
                    labelText: "NEW PASSWORD",
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
                    if (await service.signUp(email: email.text, password: password.text)) {
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
                  child: Text("SignUp"),
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 255, 0, 17)),
                ),
                SizedBox(
                  height: 10,
                ),

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
//  }
  // Future<void> daftar() {

  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     return signUp();
  //   }));



  // }



}

