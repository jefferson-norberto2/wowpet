import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/modules/home/register_imunization_screen.dart';
import 'package:wowpet/app/modules/home/reporter_screen.dart';
import '../../config/custom_colors.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeStore store;
  int _selectedIndex = 0;
  bool _showDenuncie = true;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Tela 1'),
    ReporterScreen(),
    ResgisterImunizationScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  void dispose() {
    Modular.dispose<HomeStore>();
    super.dispose();
  }

  Widget _buildFloatingActionButton() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Denuncie'),
              backgroundColor: CustomColors.customPrimaryColor,
            )
          : const SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.customPrimaryColor,
        title: const Text('Início'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Reporte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.customPrimaryColor,
        onTap: _onItemTapped,
      ),
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: store,
        onState: (context, counter) {
          return Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          );
        },
        onError: (context, error) => const Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
        onLoading: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }
}
