import 'package:hive/hive.dart';
import 'package:flutter/cupertino.dart';

class DefinedTagsProvider extends ChangeNotifier {
  List<String> get definedTags {
    return Hive.box<String>("definedTags").keys.toList() as List<String>;
  }

  static Future<void> createDefinedTagsBox() async {
    await Hive.openBox<String>("definedTags");
    Hive.box<String>("definedTags").put("all", "");
    Hive.box<String>("definedTags").put("once", "");
  }

  void addDefinedTag(String tag) {
    Hive.box<String>("definedTags").put(tag, "");
    notifyListeners();
  }

  void removeDefinedTag(String tag) {
    Hive.box<String>("definedTags").delete(tag);
    notifyListeners();
  }
}
