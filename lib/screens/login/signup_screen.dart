import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shaur_chat_app/main.dart';
import 'package:shaur_chat_app/screens/Admin/admin.dart';
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
  TextEditingController _adPassCon = TextEditingController();
    bool obscure = true;


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
                          TextField(
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
                              hintText: 'Name',
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
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
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white),
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
                          onPressed: () {
                            if (_groupvalue == "Admin" && _adPassCon != null) {
                              if (_adPassCon.text == "shaur") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Admin()));
                              } else {}
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
