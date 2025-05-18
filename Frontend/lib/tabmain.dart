import 'package:flutter/material.dart';
import 'styles/styles.dart';
import 'tabs/ornamental.dart';

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
            style: AppStyles.appBarTitle, // 👈 Usa el estilo del AppBar
          ),
          backgroundColor: AppStyles.primaryColor,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            labelStyle:
                AppStyles.tabSelected, // 👈 Usa estilo para pestaña activa
            unselectedLabelStyle:
                AppStyles.tabUnselected, // 👈 Pestaña inactiva
            tabs: [
              Tab(icon: Icon(Icons.eco), text: 'Ornamental'),
              Tab(icon: Icon(Icons.local_hospital), text: 'Medicinal'),
              Tab(icon: Icon(Icons.grass), text: 'Forestal'),
              Tab(icon: Icon(Icons.terrain), text: 'Tierra'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrnamentalScreen(),
            Center(
              child: Text(
                'Contenido de Perfil',
                style: AppStyles.tabContentText,
              ),
            ),
            Center(
              child: Text(
                'Contenido de Ajustes',
                style: AppStyles.tabContentText,
              ),
            ),
            Center(
              child: Text(
                'Contenido de Tierra',
                style: AppStyles.tabContentText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
