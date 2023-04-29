import 'package:flutter_test/flutter_test.dart';
import 'package:wowpet/app/modules/home_pr/home_pr_store.dart';

void main() {
  late HomePrStore store;

  setUpAll(() {
    store = HomePrStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
