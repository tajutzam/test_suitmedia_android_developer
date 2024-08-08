import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_suitmedia/const/route.dart';
import 'package:test_suitmedia/controllers/home_controller.dart';
import 'package:test_suitmedia/controllers/user_controller.dart';

class SecondScreen extends StatelessWidget {
  final String name;

  const SecondScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();

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
          'Second Screen',
          style: TextStyle(
              color: Color(0xff04021D),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff2B637B),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(MyRoute.thrid);
            },
            child: Text("Chose a User"),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome'),
            SizedBox(height: 20),
            Text(
              '$name',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Obx(() {
                  final user = controller.selectedUser.value;
                  return Text(
                    textAlign: TextAlign.center,
                    user != null
                        ? '${controller.selectedUser.value!.firstName} ${controller.selectedUser.value!.lastName}'
                        : "Selected User Name",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
