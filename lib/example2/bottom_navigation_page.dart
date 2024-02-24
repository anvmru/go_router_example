import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/utils/logger.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({super.key, required this.child});

  final StatefulNavigationShell child;
//
//   @override
//   State<BottomNavigationPage> createState() => _BottomNavigationPageState();
// }
//
// class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    logd('** BottomNavigationPage.build, index:${child.currentIndex}');
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Navigator Shell')),
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: child.currentIndex,
        onTap: (index) {
          child.goBranch(
            index,
            initialLocation: index == child.currentIndex,
          );
          //setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
