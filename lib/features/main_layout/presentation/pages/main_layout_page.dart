import 'package:flutter/material.dart';
import 'package:smart_expense/features/analytics/presentation/pages/analytics_page.dart';
import 'package:smart_expense/features/expenses/presentation/pages/transactions_page.dart';
import 'package:smart_expense/features/home/presentation/pages/home_page.dart';
import 'package:smart_expense/features/main_layout/presentation/widgets/custom_bottom_nav.dart';
import 'package:smart_expense/features/profile/presentation/pages/profile_page.dart';

 class MainLayoutPage extends StatefulWidget {
  const MainLayoutPage({super.key});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  int currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = const [
      HomePage(),
      TransactionsPage(),
      AnalyticsPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

     bottomNavigationBar: SafeArea(child:
     CustomBottomNav(
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
          ), 
      ),
    );
  }
}