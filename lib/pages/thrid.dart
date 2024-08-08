import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_suitmedia/const/route.dart';
import 'package:test_suitmedia/controllers/user_controller.dart';

class ThridScreen extends StatelessWidget {
  const ThridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller.fetchUsers();
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff554AF0),
            )),
        title: Text(
          'Thrid Screen',
          style: TextStyle(
              color: Color(0xff04021D),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.users.isEmpty) {
          return Center(child: Text('No users available.'));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              // Refresh data
              await controller.fetchUsers(refresh: true);
            },
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (context, index) => Divider(),
              controller: scrollController,
              itemCount: controller.users.length +
                  1, // Add 1 for loading indicator at the end
              itemBuilder: (context, index) {
                if (index == controller.users.length) {
                  // Show loading indicator at the end of the list
                  return controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox.shrink(); // Empty widget if no loading
                }
                final user = controller.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  onTap: () {
                    controller.selectUser(user);
                    Get.back();
                  },
                );
              },
            ),
          );
        }
      }),
    );
  }
}
