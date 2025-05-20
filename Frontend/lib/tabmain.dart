import 'package:flutter/material.dart';
import 'styles/styles.dart';
import 'tabs/ornamental.dart';
import 'tabs/medicinal.dart';
import 'tabs/forestal.dart';
import 'tabs/ground.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sistema de Inventarios',
            style: AppStyles.appBarTitle,
          ),
          backgroundColor: AppStyles.primaryColor,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            labelStyle: AppStyles.tabSelected,
            unselectedLabelStyle: AppStyles.tabUnselected,
            tabs: [
              Tab(icon: Icon(Icons.eco), text: 'Ornamental'),
              Tab(icon: Icon(Icons.local_hospital), text: 'Medicinal'),
              Tab(icon: Icon(Icons.grass), text: 'Forestal'),
              Tab(icon: Icon(Icons.terrain), text: 'Tierra'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabNavigator(const OrnamentalScreen()),
            _buildTabNavigator(const MedicinalScreen()),
            _buildTabNavigator(const ForestalScreen()),
            _buildTabNavigator(const GroundScreen()),
          ],
        ),
      ),
    );
  }

  // 👇 Este método envuelve cada tab en su propio Navigator
  static Widget _buildTabNavigator(Widget screen) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => screen);
      },
    );
  }
}
