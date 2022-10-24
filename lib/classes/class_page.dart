import 'package:flutter/material.dart';
import 'package:make_some_screens/users/profile_page.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "운동 시설",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () => {print("hi1")},
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => {print("hi2")},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => {print("hi3")},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Kang"),
              accountEmail: Text("asdf123@naver.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.pink,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: const Text("Home"),
              onTap: () => {print("to go home!")},
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: const Text("Setting"),
              onTap: () => {print("to go settings!")},
              trailing: const Icon(Icons.add),
            )
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return TextButton(
                child: const Text('Next page'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
