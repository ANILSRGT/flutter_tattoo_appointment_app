import 'package:flutter/material.dart';
import 'package:tattoo_appointment/presentation/pages/appointments/appointments_page.dart';
import 'package:tattoo_appointment/presentation/pages/home/home_page.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  final List<Widget> _pages = const [
    HomePage(),
    AppointmentsPage(),
    Scaffold(body: Center(child: Text('Profile'))),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (_, index) => _pages[index],
        onPageChanged: (index) => _selectedIndex.value = index,
      ),
    );
  }

  Widget get _bottomNavigationBar {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (_, int selectedIndex, __) {
        return BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
