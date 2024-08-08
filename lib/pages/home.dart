import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_suitmedia/const/route.dart';
import 'package:test_suitmedia/controllers/home_controller.dart';

class Home extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HomeController _homeController = Get.find<HomeController>();
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _sentenceC = TextEditingController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/images/ic_photo.png'),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameC,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: Color(0xff6867775C)),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _sentenceC,
                    decoration: InputDecoration(
                      hintText: "Palindrome",
                      hintStyle: TextStyle(color: Color(0xff6867775C)),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a sentence';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildButton(() {
                    if (_formKey.currentState?.validate() ?? false) {
                      bool isPalindrome =
                          _homeController.checkPalindrome(_sentenceC.text);
                      Get.defaultDialog(
                        title: "Palindrome Check",
                        middleText:
                            isPalindrome ? "isPalindrome" : "Not Palindrome",
                      );
                    }
                  }, "Check"),
                  SizedBox(height: 10),
                  _buildButton(() {
                    if (_formKey.currentState?.validate() ?? false) {
                      Get.toNamed(
                        MyRoute.second,
                        parameters: {'name': _nameC.text},
                      );
                    }
                  }, "NEXT")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildButton(VoidCallback onPresed, String label) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff2B637B),
          foregroundColor: Colors.white,
        ),
        onPressed: onPresed,
        child: Text(label),
      ),
    );
  }
}
