import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shaur_chat_app/main.dart';
import 'package:shaur_chat_app/screens/Admin/admin.dart';
import 'package:shaur_chat_app/screens/home/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  String? _groupvalue;
  String? _classvalue;
  TextEditingController _adPassCon = TextEditingController();
  TextEditingController _nameCon = TextEditingController();
  TextEditingController _phoneCon = TextEditingController();
  TextEditingController _OtpCon = TextEditingController();
  bool obscure = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;

  String verificationID = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/logo/logoBig.ico',
              height: 150,
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.only(left: 35, top: 80),
          //   child: const Text(
          //     "Create\nAccount",
          //     style: TextStyle(color: Colors.white, fontSize: 33),
          //   ),
          // ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Column(children: [
                DropdownButton(
                    hint: _groupvalue == null
                        ? Text(
                            'You are',
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(
                            _groupvalue!,
                            style: TextStyle(color: Colors.black),
                          ),
                    isExpanded: true,
                    elevation: 0,
                    iconSize: 30.0,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                    items: ['Teacher', 'Admin', 'Student'].map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _groupvalue = val!;
                          print(val);
                        },
                      );
                    }),
                _groupvalue != "Admin"
                    ? Column(
                        children: [
                          // TextField(
                          //   decoration: InputDecoration(
                          //     focusedBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //       borderSide:
                          //           const BorderSide(color: Colors.black),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //       borderSide:
                          //           const BorderSide(color: Colors.white),
                          //     ),
                          //     hintText: 'Name',
                          //     hintStyle: const TextStyle(color: Colors.white),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          TextField(
                            controller: _phoneCon,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              hintText: 'phone Number',
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            child: TextField(
                              controller: _OtpCon,
                              decoration: InputDecoration(
                                hintText: 'OTP',
                                prefix: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(''),
                                ),
                              ),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                            ),
                            visible: otpVisibility,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          TextField(
                            controller: _adPassCon,
                            obscureText: obscure,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              hintText: 'password',
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: obscure,
                                onChanged: (value) {
                                  setState(() {
                                    obscure = value!;
                                  });
                                },
                              ),
                              const Text("Hide or Show password")
                            ],
                          ),
                        ],
                      ),

                const SizedBox(
                  height: 20,
                ),
                // const SizedBox(
                //   height: 30,
                // ),

                // TextField(
                //   decoration: InputDecoration(
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: const BorderSide(color: Colors.black),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: const BorderSide(color: Colors.white),
                //     ),
                //     hintText: 'Enter your $_groupvalue Id',
                //     hintStyle: const TextStyle(color: Colors.white),
                //   ),
                // ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            if (_groupvalue == "Admin" && _adPassCon != null) {
                              if (_adPassCon.text == "shaur") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Admin()));
                              }
                            } else if (_groupvalue == "Student") {
                              print("object");
                              await FirebaseFirestore.instance
                                  .collection('UsersPhones')
                                  .get()
                                  .then((QuerySnapshot querySnapshot) {
                                querySnapshot.docs.forEach((doc) async {
                                  // print(doc["num"].toString());
                                  if (otpVisibility == false) {
                                    if (_phoneCon.text ==
                                        doc['num']
                                            .toString()
                                            .replaceAll(' ', '')) {
                                      print('success');
                                      auth.verifyPhoneNumber(
                                        phoneNumber: "+92" + _phoneCon.text,
                                        verificationCompleted:
                                            (PhoneAuthCredential
                                                credential) async {
                                          await auth
                                              .signInWithCredential(credential)
                                              .then((value) {
                                            print(
                                                "You are logged in successfully");
                                          });
                                        },
                                        verificationFailed:
                                            (FirebaseAuthException e) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpScreen()));
                                          print(e.message);
                                        },
                                        codeSent: (String verificationId,
                                            int? resendToken) {
                                          otpVisibility = true;
                                          verificationID = verificationId;
                                          setState(() {});
                                        },
                                        codeAutoRetrievalTimeout:
                                            (String verificationId) {
                                          print(verificationId);
                                        },
                                      );
                                      Fluttertoast.showToast(
                                          msg:
                                              'Wait for a while, so the app will send you verification code',
                                          fontSize: 20,
                                          backgroundColor: Colors.green);
                                    }
                                  } else {
                                    print("this is verifyOtp");
                                    PhoneAuthCredential credential =
                                        PhoneAuthProvider.credential(
                                            verificationId: verificationID,
                                            smsCode: _OtpCon.text);
                                    await auth
                                        .signInWithCredential(credential)
                                        .then(
                                      (value) {
                                        print("You are logged in successfully");
                                        Fluttertoast.showToast(
                                          msg: "You are logged in successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      },
                                    ).whenComplete(
                                      () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      },
                                    );
                                  }
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomePage()));
                                });
                              });
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 40,
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
