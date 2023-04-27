import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    int value = state + 1;
    if (value < 5) {
      update(value);
    } else {
      setError(Exception('Error: state not can be > 4'));
    }

    setLoading(false);
  }

  Future<void> decrement() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    int value = state - 1;
    if (value >= 0) {
      update(value);
    } else {
      setError(Exception('Error: state not can be < 0'));
    }

    setLoading(false);
  }

  Future<void> reset() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    update(0);

    setLoading(false);
  }

  Future<void> goToInit() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    Modular.to.pop();
    setLoading(false);
  }
}
