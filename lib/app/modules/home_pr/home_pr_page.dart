import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/modules/home_pr/home_pr_screen.dart';
import 'package:wowpet/app/modules/home_pr/register_pr_nfc.dart';
import 'package:wowpet/app/modules/home_pr/reporter_pr_screen.dart';
import 'package:wowpet/app/modules/home_pr/verify_pr_nfc.dart';
import '../../config/custom_colors.dart';
import 'home_pr_store.dart';

class HomePrPage extends StatefulWidget {
  final String title;
  const HomePrPage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  HomePrPageState createState() => HomePrPageState();
}

class HomePrPageState extends State<HomePrPage> {
  final store = HomePrStore();
  late Disposer disposer;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePrScreen(),
    ReporterPrScreen(),
    VerifyPrNfc(),
    RegisterPrNfc(),
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
    return Container(
      color: CustomColors.customPrimaryColor,
      child: SafeArea(
        child: Scaffold(
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
                label: 'Ler NFC',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add,
                    color: _selectedIndex == 3
                        ? CustomColors.customPrimaryColor
                        : Colors.black54),
                label: 'Cadastrar',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: CustomColors.customPrimaryColor,
            onTap: _onItemTapped,
          ),
          body: ScopedBuilder<HomePrStore, int>(
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
        ),
      ),
    );
  }
}
