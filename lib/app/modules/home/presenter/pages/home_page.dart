import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../config/custom_colors.dart';
import '../../../login/domain/entities/user.dart';
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

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 0){
      Modular.to.navigate('/home/initial_module/', arguments: widget.user);
    }

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
                icon: const Icon(Icons.exit_to_app),
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
              if (index == 0){
                Modular.to.navigate('/home/initial_module/', arguments: widget.user);
              } else if (index == 1){
                Modular.to.navigate('/home/report_animal_module/', arguments: widget.user);
              } else if (index == 2){
                Modular.to.navigate('/home/verify_animal_module/', arguments: widget.user);
              } else if (index == 3){
                Modular.to.navigate('/home/perfil_module/', arguments: widget.user);
              }
              _onItemTapped(index);
            },
          ),
          body: const Center(
            child: RouterOutlet() //_widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
    );
  }
}
