import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/modules/home/pages/home_screen.dart';
import 'package:wowpet/app/modules/home/pages/perfil_page.dart';
import 'package:wowpet/app/modules/home/pages/reporter_screen.dart';
import 'package:wowpet/app/modules/home/pages/verify_nfc_page.dart';
import '../../../config/custom_colors.dart';
import '../../login/domain/entities/user.dart';
import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  final User user;

  const HomePage({Key? key, required this.user, this.title = 'Home'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final store = HomeStore();
  late Disposer disposer;
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ReporterScreen(),
    const VerifyNfcPage(),
    const PerfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    disposer = store.observer(onState: print);
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  // Widget _buildFloatingActionButton() {
  //   return AnimatedSwitcher(
  //     duration: const Duration(milliseconds: 200),
  //     child: _selectedIndex == 0
  //         ? FloatingActionButton.extended(
  //             onPressed: () {},
  //             label: const Text('Denuncie'),
  //             backgroundColor: CustomColors.customPrimaryColor,
  //           )
  //         : const SizedBox(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.customPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: CustomColors.customPrimaryColor,
            title: Text('Bem-vindo ${widget.user.name}'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                    color: _selectedIndex == 0
                        ? CustomColors.customPrimaryColor
                        : Colors.black54),
                label: 'Inicial',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.report,
                    color: _selectedIndex == 1
                        ? CustomColors.customPrimaryColor
                        : Colors.black54),
                label: 'Reporte',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.nfc,
                    color: _selectedIndex == 2
                        ? CustomColors.customPrimaryColor
                        : Colors.black54),
                label: 'Verificar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: _selectedIndex == 3
                        ? CustomColors.customPrimaryColor
                        : Colors.black54),
                label: 'Perfil',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: CustomColors.customPrimaryColor,
            onTap: (index){
              // if (index == 0){
              //   Modular.to.pushNamed('/home/initial2/');
              // }else{
              //   _onItemTapped(index);
              // }
              _onItemTapped(index);
            },
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
    );
  }
}
