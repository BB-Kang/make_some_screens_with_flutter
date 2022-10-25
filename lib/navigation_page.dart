import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:make_some_screens/memberships/member_page.dart';
import 'package:make_some_screens/reservations/reservation_page.dart';

import 'Classes/class_page.dart';
import 'Users/influencer_page.dart';
import 'Users/profile_page.dart';
import 'utils/custom_navigator.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

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
  final _pages = const [
    ClassPage(),
    ReservationPage(),
    MembershipPage(),
    ProfilePage(),
    InfluencerPage()
  ];
  final _navigatorKeyList =
      List.generate(5, (index) => GlobalKey<NavigatorState>());
  int _currentIndex = 0;
  static const defaultColor = Colors.blueAccent;
  static const selectedColor = Colors.amberAccent;

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
            tabs: [
              Tab(
                icon: Icon(Icons.fitness_center,
                    color: _currentIndex == 0 ? selectedColor : defaultColor),
                text: '운동시설',
              ),
              Tab(
                icon: Icon(Icons.check_box,
                    color: _currentIndex == 1 ? selectedColor : defaultColor),
                text: '예약현황',
              ),
              Tab(
                icon: Icon(
                  Icons.shopping_basket,
                  color: _currentIndex == 2 ? selectedColor : defaultColor,
                ),
                text: '멤버십',
              ),
              Tab(
                icon: Icon(Icons.stars,
                    color: _currentIndex == 3 ? selectedColor : defaultColor),
                text: '인플루언서',
              ),
              Tab(
                icon: Icon(Icons.account_circle,
                    color: _currentIndex == 4 ? selectedColor : defaultColor),
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
