import 'dart:math';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pages = const [Page1(), Page2(), Page3(), Page5(), Page6()];
  final _navigatorKeyList =
      List.generate(5, (index) => GlobalKey<NavigatorState>());
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !(await _navigatorKeyList[_currentIndex]
            .currentState!
            .maybePop());
      },
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: _pages.map(
              (page) {
                int index = _pages.indexOf(page);
                return CustomNavigator(
                  page: page,
                  navigatorKey: _navigatorKeyList[index],
                );
              },
            ).toList(),
          ),
          bottomNavigationBar: TabBar(
            isScrollable: false,
            indicatorPadding: const EdgeInsets.only(bottom: 74),
            automaticIndicatorColorAdjustment: true,
            onTap: (index) => setState(() {
              _currentIndex = index;
            }),
            tabs: const [
              Tab(
                icon: Icon(Icons.home, color: Colors.amber),
                text: '플라토',
              ),
              Tab(
                icon: Icon(Icons.calendar_today, color: Colors.blueAccent),
                text: '캘린더',
              ),
              Tab(
                icon: Icon(
                  Icons.email,
                  color: Colors.yellow,
                ),
                text: '쪽지',
              ),
              Tab(
                icon: Icon(Icons.approval, color: Colors.red),
                text: '이뭐지',
              ),
              Tab(
                icon: Icon(Icons.backpack, color: Colors.black38),
                text: '아몰랑',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
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
            icon: Icon(Icons.shopping_cart),
            onPressed: () => {print("hi2")},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {print("hi3")},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Kang"),
              accountEmail: Text("asdf123@naver.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.pink,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text("Home"),
              onTap: () => {print("to go home!")},
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: Text("Setting"),
              onTap: () => {print("to go settings!")},
              trailing: Icon(Icons.add),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page4()));
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

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
        centerTitle: true,
      ),
      body: const WebView(
        initialUrl: 'https://www.naver.com',
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
        centerTitle: true,
      ),
      body: const WebView(
        initialUrl: 'https://www.google.com',
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 5'),
        centerTitle: true,
      ),
      body: const WebView(
        initialUrl: 'https://op.gg',
      ),
    );
  }
}

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 6'),
        centerTitle: true,
      ),
      body: const WebView(
        initialUrl: 'https://lolchess.gg',
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page4'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Text('Page4');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class CustomNavigator extends StatefulWidget {
  final Widget page;
  final Key navigatorKey;
  const CustomNavigator(
      {Key? key, required this.page, required this.navigatorKey})
      : super(key: key);

  @override
  _CustomNavigatorState createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (_) =>
          MaterialPageRoute(builder: (context) => widget.page),
    );
  }
}
