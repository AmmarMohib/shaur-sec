import 'package:flutter/material.dart';
import 'package:shaur_chat_app/screens/Admin/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(6, 49, 70, 1),
            leading: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Image.asset('assets/logo/logoSmall.ico')),
            title: const Center(
                child: Text(
              "Shaur Educational Complex",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            )),
            actions: [
              PopupMenuButton(
                  onSelected: (result) {
                    if (result == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminLogin()));
                    } else if (result == 1) {
                      // Fluttertoast.showToast(msg: 'group');
                    }
                  },
                  color: Colors.white,
                  itemBuilder: (context) => [
                        const PopupMenuItem<int>(
                          value: 1,
                          child: Text("Admin"),
                        ),
                        const PopupMenuItem<int>(
                          value: 2,
                          child: Text("Settings"),
                        ),
                        const PopupMenuItem<int>(
                          value: 3,
                          child: Text("About"),
                        ),
                      ]),
            ],
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("Groups"),
              ),
              Tab(
                child: Text("Chats"),
              ),
            ]),
          ),
          // body: TabBarView(
          //   // children: [Chats(), Chats(), Contacts()],
          // ),
        ));
  }
}
