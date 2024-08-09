import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_suitmedia/model/user.dart';

class UserController extends GetxController {
  var users = <User>[].obs; 
  var isLoading = false.obs; 
  var hasMore = true.obs; 
  var page = 1.obs; 
  final int perPage = 20; 

  var selectedUser = Rxn<User>();

  @override
  void onInit() {
    fetchUsers(); // Fetch initial data
    super.onInit();
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (refresh) {
      page.value = 1; // Reset page for refresh
    }

    if (isLoading.value || !hasMore.value)
      return; // Avoid loading if already loading or no more data

    isLoading(true);
    try {
      final response = await http.get(Uri.parse(
          'https://reqres.in/api/users?page=${page.value}&per_page=${perPage}'));

         print(response.body); 
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
    

        final List<User> newUsers =
            (data['data'] as List).map((item) => User.fromJson(item)).toList();
        if (newUsers.isEmpty) {
          hasMore(false); // No more data available
        } else {
          users.addAll(newUsers);
          page.value++; // Increment page for next load
        }
      } else {
        hasMore(false); // Handle error or no more data
      }
    } finally {
      isLoading(false);
    }
  }

  void selectUser(User user) {
    selectedUser.value = user;
  }
}
