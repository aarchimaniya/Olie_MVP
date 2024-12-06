import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth_controller/auth_controller.dart';

class ResetLoginPass extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to dark
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/logo.png', height: 100), // Add logo
            const SizedBox(height: 20),
            const Text(
              'Never ride alone',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: phoneController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(() => TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        authController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        authController.togglePasswordVisibility();
                      },
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: !authController.isPasswordVisible.value,
                )),
            SizedBox(height: 20),
            Obx(() => CheckboxListTile(
                  title: Text('Remember Me',
                      style: TextStyle(color: Colors.white)),
                  value: authController.isRememberMeChecked.value,
                  onChanged: (newValue) {
                    authController.toggleRememberMe(newValue!);
                  },
                  checkColor: Colors.white,
                  activeColor: Color(0xFF00C2C2),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF00C2C2), // Set text color
              ),
              onPressed: () {
                // Handle phone number login
              },
              child: Text('Log in'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
