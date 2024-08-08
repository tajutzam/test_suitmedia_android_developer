import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedUsername = ''.obs;
  List<String> usernames = ["user1", "user2", "user3", "user4"];

  bool checkPalindrome(String sentence) {
    String cleaned = sentence.replaceAll(RegExp(r'\W'), '').toLowerCase();
    String reversed = cleaned.split('').reversed.join('');
    return cleaned == reversed;
  }
}
