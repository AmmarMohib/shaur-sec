import 'package:flutter/material.dart';
import 'package:shaur_chat_app/screens/Admin/admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool obscure = true;
  TextEditingController _PassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color.fromRGBO(6, 49, 70, 1.0),
              )),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Image.asset(
                'assets/logo/logoBig.ico',
                height: 150,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Welcome Back Admin, You need to enter \n Password below to Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(6, 49, 70, 1.0), fontSize: 17),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: _PassController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Admin Password',
                  ),
                  obscureText: obscure,
                  onFieldSubmitted: ((value) => {
                        if (_PassController.text == "secShaur")
                          {
                            print("succesful"),
                                Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Admin()))
                            }
                        else
                          {print("wrong Password")}
                      }),
                ),
              ),
              
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    if (_PassController.text == "secShaur") {
                      print("succesful");
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Admin()));
                    } else {
                      print("wrong Password");
                    }
                  },
                  child: Text("Continue as Admin"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(6, 49, 70, 1.0)),
                      elevation: MaterialStateProperty.all(0)),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
