import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shaur_chat_app/main.dart';
import 'package:shaur_chat_app/screens/home/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shaur_chat_app/screens/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  String? _groupvalue;
  String? _classvalue;


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
                  top: MediaQuery.of(context).size.height * 0.27),
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
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Name',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
            
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Enter your $_groupvalue Id',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   var user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //           Future.delayed(Duration.zero, () {
  //       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
  //     });
  //   }
  //   return Center(
  //     child: PhoneInputScreen(
  //       headerBuilder: (context, constraints, shrinkOffset) {
  //         return Padding(
  //           padding: const EdgeInsets.all(20),
  //           child: Icon(
  //             Icons.phone,
  //             color: Colors.blue,
  //             size: constraints.maxWidth / 4 * (1 - shrinkOffset),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget build(BuildContext context) {
  //   // ignore: unnecessary_null_comparison

  //   return Scaffold(
  //  appBar: AppBar(
  //           backgroundColor: const Color.fromRGBO(6, 49, 70, 1),
  //           leading: Image.asset('assets/logo/logoSmall.ico'),
  //           title: const Center(
  //               child: Text(
  //             "Shaur Educational Complex",
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //                 fontFamily: 'Roboto'),
  //           )),

  //         ),
  //     body: Container(
  //       margin: EdgeInsets.all(10),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text("please enter your id and Password", style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),),
  //           TextField(
  //             // controller: phoneController,
  //             decoration: InputDecoration(
  //               hintText: 'Phone Number',
  //               prefix: Padding(
  //                 padding: EdgeInsets.all(4),
  //                 child: Text('+92'),
  //               ),
  //             ),
  //             maxLength: 10,
  //             keyboardType: TextInputType.phone,
  //           ),
  //           Visibility(
  //             child: TextField(
  //               // controller: otpController,
  //               decoration: InputDecoration(
  //                 hintText: 'OTP',
  //                 prefix: Padding(
  //                   padding: EdgeInsets.all(4),
  //                   child: Text(''),
  //                 ),
  //               ),
  //               maxLength: 6,
  //               keyboardType: TextInputType.number,
  //             ),
  //             // visible: otpVisibility,
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           MaterialButton(
  //             color: Colors.indigo[900],
  //             onPressed: () {
  //               // if (otpVisibility) {
  //               //   verifyOTP();
  //               // } else {
  //               //   loginWithPhone();
  //               // }
  //             },
  //             child: Text(
  //               "Login",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // void loginWithPhone() async {
  // //   auth.verifyPhoneNumber(
  // //     // phoneNumber: ,
  // //     verificationCompleted: (PhoneAuthCredential credential) async {
  // //       await auth.signInWithCredential(credential).then((value) {
  // //         print("You are logged in successfully");
  // //       });
  // //     },
  // //     verificationFailed: (FirebaseAuthException e) {
  // //       Navigator.of(context)
  // //           .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  // //       print(e.message);
  // //     },
  // //     codeSent: (String verificationId, int? resendToken) {
  // //       otpVisibility = true;
  // //       verificationID = verificationId;
  // //       setState(() {});
  // //     },
  // //     codeAutoRetrievalTimeout: (String verificationId) {
  // //       print(verificationId);
  // //     },
  // //   );
  // //   Fluttertoast.showToast(
  // //       msg: 'Wait for a while, so the app will send you verification code',
  // //       fontSize: 20,
  // //       backgroundColor: Colors.green);
  // // }

  // // void verifyOTP() async {
  // //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  // //       verificationId: verificationID, smsCode: otpController.text);
  // //   await auth.signInWithCredential(credential).then(
  // //     (value) {
  // //       print("You are logged in successfully");
  // //       Fluttertoast.showToast(
  // //         msg: "You are logged in successfully",
  // //         toastLength: Toast.LENGTH_SHORT,
  // //         gravity: ToastGravity.CENTER,
  // //         timeInSecForIosWeb: 1,
  // //         backgroundColor: Colors.red,
  // //         textColor: Colors.white,
  // //         fontSize: 16.0,
  // //       );
  // //     },
  // //   ).whenComplete(
  // //     () {
  // //       Navigator.of(context)
  // //           .push(MaterialPageRoute(builder: (context) => GetInfo()));
  // //     },
  // //   );
  // }

}
