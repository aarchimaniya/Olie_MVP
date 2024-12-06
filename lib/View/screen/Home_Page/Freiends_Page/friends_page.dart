import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olie_mvp_app/View/screen/Home_Page/AddFriendsPage/add_firends.dart';
import 'package:olie_mvp_app/View/screen/Home_Page/Find_FriendsPage/find_friendspage.dart';

class FriendsPage extends StatefulWidget {
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.teal),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/blacklogo.png"),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Find Friends',
                        style: TextStyle(
                            fontSize: 30.sp, fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person_search_rounded,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'New',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Friends',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(width: 5.w),
                            Icon(Icons.group, size: 18.sp),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Colors.grey.shade300),
            SizedBox(height: 45.h),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 70.h), // Spacing for the CircleAvatar
                        Text(
                          'Grow your contacts list!',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF333333),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FindFriendsPage()),
                                );
                              },
                              child: Text('Find Friends'),
                            ),
                            SizedBox(width: 10.w),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF333333),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddFriendsPage()),
                                );
                              },
                              child: Text('Add Friends'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20.h,
                    left: 55.w, // Adjust positioning as needed
                    child: CircleAvatar(
                      radius: 40.sp,
                      backgroundImage:
                          AssetImage('lib/assets/images/img_4.png'),
                    ),
                  ),
                  Positioned(
                    top: -20.h,
                    right: 55.w, // Adjust positioning as needed
                    child: CircleAvatar(
                      radius: 40.sp,
                      backgroundImage:
                          AssetImage('lib/assets/images/img_3.png'),
                    ),
                  ),
                  Positioned(
                    top: -50
                        .h, // Positioning the large CircleAvatar above the container
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black38,
                          width: 5.sp,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 60.sp,
                        backgroundImage:
                            AssetImage('lib/assets/images/img_2.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Social media',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // Enables horizontal scrolling
                    child: Row(
                      children: [
                        // Facebook Button
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.sp),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/assets/images/facebook.png',
                                height: 25.sp,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "Facebook",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.w),

                        // Contacts Button
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.sp),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/assets/images/contact.png',
                                height: 25.sp,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "Contacts",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.w),

                        // Instagram Button
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.sp),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 2,
                            //     blurRadius: 5,
                            //     offset: Offset(0, 3),
                            //   ),
                            // ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/assets/images/instagram.png',
                                height: 25.sp,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "Instagram",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suggested Friends',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 60.sp,
                              backgroundImage:
                                  AssetImage('lib/assets/images/profile.png'),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: 25.sp, top: 10.sp), // Adjust padding for overall space
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Home Icon
              Container(
                height: 50.h,
                width: 70.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0x00FFFFFF), // Transparent white
                      Color(0xFFFFFFFF), // Solid white
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(3, 3), // Shadow position
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.home,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10.w),

              // Profile Icon
              Container(
                height: 50.h,
                width: 70.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0x00DEDEDE), // Transparent white
                      Color(0xFFFFFFFF), // Solid white
                      Color(0xFFE5E5E5), // Solid white
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(3, 3), // Shadow position
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.person,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10.w),

              // Dark Mode Icon
              Container(
                height: 50.h,
                width: 70.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0x00FFFFFF), // Transparent white
                      Color(0xFFFFFFFF), // Solid white
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(3, 3), // Shadow position
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.dark_mode_outlined,
                  color: Colors.black,
                ),
              ),

              // Connect Button
              Expanded(
                // Make it take up the remaining space
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45.h,
                    width: 75.w,
                    margin: EdgeInsets.only(left: 10.sp),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0x00FFFFFF), // Transparent white
                          Color(0xFFFFFFFF), // Solid white
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(3, 3), // Shadow position
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Connect",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.power_settings_new,
                          color: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
