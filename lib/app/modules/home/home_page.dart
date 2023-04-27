import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeStore store;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: store,
        onState: (context, counter) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$counter'),
                TextButton(
                  onPressed: store.goToInit,
                  child: const Text('Go to Init'),
                ),
              ],
            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
