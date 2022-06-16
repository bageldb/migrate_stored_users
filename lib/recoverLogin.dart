import 'package:bagel_auth_app/bageldb-0.1.23/src/bage_db_shared_prefs.dart';
import 'prev_localstore.dart';

class MigrateStoredUser {
  String dbPath;

  final _db = LocalStore.instance;
  SP sp = SP();
  MigrateStoredUser({this.dbPath = ''}) {
    LocalStore.open(dbPath);
  }

  List<Map<String, String>> data = [
    {"collection": "user", "doc": "user"},
    {"collection": "access", "doc": "access"},
    {"collection": "access", "doc": "nonce"}
  ];

  Future<void> init() async {
    await sp.init();
    for (Map item in data) {
      dynamic doc =
          await _db.collection(item["collection"]).doc(item["doc"]).get();
      if (doc != null) {
        sp.set(item["doc"], doc);
      }
    }
  }
}
