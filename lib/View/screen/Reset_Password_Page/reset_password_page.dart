import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../ConfirmCode_Page/confirmcode_page.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Color(0xff272626),
      appBar: AppBar(
        backgroundColor: Color(0xff272626),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'lib/assets/images/Logo.png',
              height: 100.h,
            ),
            SizedBox(height: 10.h),
            Text(
              'Never ride alone',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 16.sp),
            ),
            Spacer(flex: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone Number',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 14.sp),
              ),
            ),
            SizedBox(height: 5.h),
            TextField(
              controller: phoneController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'New Password',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 14.sp),
              ),
            ),
            SizedBox(height: 5.h),
            Obx(
              () => TextField(
                controller: newPasswordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      authController.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      authController.togglePasswordVisibility();
                    },
                  ),
                ),
                obscureText: !authController.isPasswordVisible.value,
              ),
            ),
            SizedBox(height: 80.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle password reset and navigate to ConfirmCodePage
                  Get.to(() => ());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00C2C2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
                  minimumSize: Size(290.w, 50.h), // Set minimum size
                ),
                child: Text(
                  'Reset Password',
                  style: GoogleFonts.lato(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: ResetPasswordPage(),
  ));
}
