import 'package:flutter/material.dart';
import 'styles/styles.dart';
import 'tabs/ornamental.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sistema de Inventarios'),
          backgroundColor: AppStyles.primaryColor,
          bottom: const TabBar(
            labelColor: Colors.white, // Color del texto seleccionado
            unselectedLabelColor: Colors.white70, // Color del texto no seleccionado
            indicatorColor: Colors.white, // Línea bajo la pestaña activa
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
            Center(child: Text('Contenido de Perfil')),
            Center(child: Text('Contenido de Ajustes')),
          ],
        ),
      ),
    );
  }
}
