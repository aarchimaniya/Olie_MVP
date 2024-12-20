import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olie_mvp_app/View/screen/Chat_Screen/chat_screenpage.dart';
import 'View/screen/ConfirmCode_Page/confirmcode_page.dart';
import 'View/screen/CreateAcc_Page/createaccount_page.dart';
import 'View/screen/GroupPage/Group_List/group_list_page.dart';
import 'View/screen/GroupPage/groupContactpage/groupcontactpage.dart';
import 'View/screen/GroupPage/group_pge.dart';
import 'View/screen/GroupScreen/CreateGroupPage/create_group_page.dart';
import 'View/screen/Home_Page/AddFriendsPage/add_firends.dart';
import 'View/screen/Home_Page/Find_FriendsPage/find_friendspage.dart';
import 'View/screen/Home_Page/Freiends_Page/friends_page.dart';
import 'View/screen/Home_Page/home_page.dart';
import 'View/screen/Intro_Page/intro_page.dart';
import 'View/screen/Login_Page/login_page.dart';
import 'View/screen/Main_Login_Page/main_login_page.dart';
import 'View/screen/Phone_Numberlogin_Page/phone_numberlogin_page.dart';
import 'View/screen/Reset_Password_Page/ResertLoginpasspage/resert_login_pass.dart';
import 'View/screen/Reset_Password_Page/reset_password_page.dart';
import 'View/screen/VideoCall_Discconect/call_dieconnectpage.dart';
import 'View/screen/video_call/video_callpage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(w, h),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login App',
          initialRoute: '/login',
          getPages: [
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/main_login', page: () => MainLoginPage()),
            GetPage(name: '/create_account', page: () => CreateAccountPage()),
            GetPage(name: '/confirm_code', page: () => ConfirmCodePage()),
            GetPage(
                name: '/phone_number_login',
                page: () => PhoneNumberLoginPage()),
            GetPage(name: '/reset_password', page: () => ResetPasswordPage()),
            GetPage(name: '/resetloginpassword', page: () => ResetLoginPass()),
            GetPage(name: '/intropage', page: () => IntroPage()),
            GetPage(name: '/home', page: () => HomePage()),
            GetPage(name: '/friends_page', page: () => FriendsPage()),
            GetPage(name: '/add_friends', page: () => AddFriendsPage()),
            GetPage(name: '/find_friends', page: () => FindFriendsPage()),
            GetPage(name: '/group_page', page: () => GroupPage()),
            GetPage(name: '/group_list_page', page: () => GroupListPage()),
            GetPage(name: '/create_group_page', page: () => CreateGroupPage()),
            GetPage(name: '/video_page', page: () => GroupCallScreen()),
            GetPage(name: '/group_contactpage', page: () => GroupContactPage()),
            GetPage(name: '/disconnect_page', page: () => DisconnectPage()),
            GetPage(name: '/chat_screen', page: () => ChatScreenPage()),
          ],
        );
      },
    );
  }
}
