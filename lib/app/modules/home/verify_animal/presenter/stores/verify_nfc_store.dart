import 'package:flutter_triple/flutter_triple.dart';
import 'package:nfc_manager/nfc_manager.dart';
import '../../../presenter/components/record.dart';

class VerifyNfcStore extends Store<bool> with MementoMixin {
  VerifyNfcStore() : super(false);
  final _nfcManager = NfcManager.instance;
  final key = [''];

  Future<void> initNFC() async {
    setLoading(true);
    if (await _nfcManager.isAvailable()) {
      await _nfcManager.startSession(
        onDiscovered: (NfcTag tag) async {
          Ndef? ndef = Ndef.from(tag);
          if (ndef != null) {
            final cache = ndef.cachedMessage;

            if (cache != null) {
              for (var record in cache.records) {
                final info = Record.fromNdef(record);
                if (info is WellknownTextRecord) {
                  key[0] = info.text;
                  update(true);
                  setLoading(false);
                } else {
                  update(true);
                  setLoading(false);
                }
              }
            }
          } else {
            update(false);
            setLoading(false);
          }
        },
      );
    } else {
      update(false);
      setError('NFC não está disponível', force: true);
      setLoading(false);
    }
  }

  void cancelNfc() {
    update(true);
    update(false);
    _nfcManager.stopSession();
    setLoading(false);
  }
}
