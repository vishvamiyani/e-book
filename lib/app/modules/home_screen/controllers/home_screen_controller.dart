import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  final count = 0.obs;
  var name ="";
  String _img = "";

  String get img => _img;

  set img(String value) {
    _img = value;
    update();
  }

  @override
  void onInit() {
    getsave();
    super.onInit();
  }

  getsave() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')!;
    img = prefs.getString("Image") ?? "";
    update();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
