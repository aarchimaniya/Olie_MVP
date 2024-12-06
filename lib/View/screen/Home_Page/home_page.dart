import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/HomepageGroup/group_controller.dart';
import '../../../modals/HomePage_Group/group_modal.dart';
import '../GroupPage/group_pge.dart';
import 'Freiends_Page/friends_page.dart';

class DeviceScreenType {
  static const int mobile = 480;
  static const int tablet = 768;
  static const int desktop = 1024;
  static const int largeDesktop = 1440;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  final List<String> imgList = [
    'lib/assets/images/main.png',
    'lib/assets/images/carousel2.png',
    'lib/assets/images/carousel3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GroupController(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F3F3),
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/images/myimage.jpg'),
            ),
          ),
          leadingWidth: 45.w,
          title: Text(
            'Hello Aarchi!',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5.sp,
            ),
          ),
          actions: [
            Image.asset(
              'lib/assets/images/blacklogo.png',
              height: 45.h,
              width: 45.w,
            ),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xFFDEDEDE),
                    Color(0xFFFFFFFF),
                    Color(0xFFE5E5E5)
                  ])),
              child: IconButton(
                // style: ButtonStyle(
                //   fixedSize: WidgetStateProperty.all(
                //     Size(25.sp, 25.sp),
                //   ),
                // ),
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 25.sp,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 16.w,
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFF3F3F3),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    ),
                    onPressed: () {},
                    child: Text(
                      'New',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  Container(
                    height: 38.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff171717),
                      ),
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Friends',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.sp),
                        ),
                        Icon(
                          Icons.group,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: 356.sp,
                  height: 200.sp, // Adjusted height
                  padding: EdgeInsets.all(8.sp),
                  margin: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.black.withOpacity(0.5),
                    image: DecorationImage(
                      image: AssetImage(imgList[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.sp),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Container(
                          height: 30.sp,
                          width: 100.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 260.sp,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.65,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              carouselController: _carouselController,
            ),

            // Gradient dot indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imgList.length, (index) {
                return Container(
                  width: 24.sp,
                  height: 2.sp,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.sp, horizontal: 2.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: index == _currentIndex
                        ? LinearGradient(
                            colors: [Colors.blue, Colors.green],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : LinearGradient(
                            colors: [Colors.black, Colors.black],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.sp,
                left: 10.sp,
              ),
              child: Text(
                'Recent groups',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900),
              ),
            ),
            Expanded(
              child: Consumer<GroupController>(
                builder: (context, controller, child) {
                  return ListView.builder(
                    padding: EdgeInsets.all(8.sp),
                    itemCount: controller?.groups.length,
                    itemBuilder: (context, index) {
                      final group = controller.groups[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.sp),
                        child: Center(
                          child: Card(
                            margin: EdgeInsets.all(3.sp),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.sp)),
                            shadowColor: Colors.transparent,
                            color: Colors.white,
                            elevation: 3.sp,
                            child: Container(
                              height: 66.sp,
                              width: 356.sp,
                              padding: EdgeInsets.all(0),
                              child: ListTile(
                                leading: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    CircleAvatar(
                                      radius: 24.sp, // Adjusted radius
                                      backgroundImage: AssetImage(group.image),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 10.sp, // Adjusted radius
                                        backgroundColor:
                                            const Color(0xffFF3B6C),
                                        child: Center(
                                          child: Text(
                                            "2",
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  group.name,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                  ),
                                ),
                                trailing: (index % 2 != 0)
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FriendsPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 30.sp,
                                          width: 70.sp,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.sp),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xff35DAD7),
                                                Color(0xff018A87),
                                              ],
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Join",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        width: 70
                                            .sp, // Consistent width with the join button
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              right: 0,
                                              child: CircleAvatar(
                                                radius: 11.sp,
                                                backgroundImage: const AssetImage(
                                                    "lib/assets/images/profile3.png"),
                                              ),
                                            ),
                                            Positioned(
                                              right: 12.sp,
                                              child: CircleAvatar(
                                                radius: 11.sp,
                                                backgroundImage: const AssetImage(
                                                    "lib/assets/images/profile2.png"),
                                              ),
                                            ),
                                            Positioned(
                                              right: 24.sp,
                                              child: CircleAvatar(
                                                radius: 11.sp,
                                                backgroundImage: const AssetImage(
                                                    "lib/assets/images/profile1.png"),
                                              ),
                                            ),
                                            Positioned(
                                              right: 36.sp,
                                              child: CircleAvatar(
                                                radius: 11.sp,
                                                backgroundImage: const AssetImage(
                                                    "lib/assets/images/profile1.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: Colors.black,
        //   unselectedItemColor: Colors.black,
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Container(
        //         padding: EdgeInsets.all(8.sp),
        //         decoration: BoxDecoration(
        //           color: _currentIndex == 0 ? Colors.white : Colors.transparent,
        //           borderRadius: BorderRadius.circular(20.sp),
        //           boxShadow: [
        //             if (_currentIndex == 0)
        //               BoxShadow(
        //                 color: Colors.black12,
        //                 blurRadius: 4.sp,
        //                 offset: Offset(0, 2.sp),
        //               ),
        //           ],
        //         ),
        //         child: Row(
        //           children: [
        //             Icon(Icons.home, size: 24.sp),
        //           ],
        //         ),
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Container(
        //         padding: EdgeInsets.all(8.sp),
        //         decoration: BoxDecoration(
        //           color: _currentIndex == 1 ? Colors.white : Colors.transparent,
        //           borderRadius: BorderRadius.circular(20.sp),
        //           boxShadow: [
        //             if (_currentIndex == 1)
        //               BoxShadow(
        //                 color: Colors.black12,
        //                 blurRadius: 4.sp,
        //                 offset: Offset(0, 2.sp),
        //               ),
        //           ],
        //         ),
        //         child: Row(
        //           children: [
        //             Icon(Icons.person, size: 24.sp),
        //           ],
        //         ),
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Container(
        //         padding: EdgeInsets.all(8.sp),
        //         decoration: BoxDecoration(
        //           color: _currentIndex == 2 ? Colors.white : Colors.transparent,
        //           borderRadius: BorderRadius.circular(20.sp),
        //           boxShadow: [
        //             if (_currentIndex == 2)
        //               BoxShadow(
        //                 color: Colors.black12,
        //                 blurRadius: 4.sp,
        //                 offset: Offset(0, 2.sp),
        //               ),
        //           ],
        //         ),
        //         child: Row(
        //           children: [
        //             Icon(Icons.nights_stay, size: 24.sp),
        //           ],
        //         ),
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Container(
        //         padding: EdgeInsets.all(8.sp),
        //         decoration: BoxDecoration(
        //           color: _currentIndex == 3 ? Colors.white : Colors.transparent,
        //           borderRadius: BorderRadius.circular(20.sp),
        //           boxShadow: [
        //             if (_currentIndex == 3)
        //               BoxShadow(
        //                 color: Colors.black12,
        //                 blurRadius: 4.sp,
        //                 offset: Offset(0, 2.sp),
        //               ),
        //           ],
        //         ),
        //         child: Row(
        //           children: [
        //             Text(
        //               "Connect",
        //               style: TextStyle(
        //                 fontSize: 14.sp,
        //                 color: _currentIndex == 3 ? Colors.black : Colors.grey,
        //               ),
        //             ),
        //             SizedBox(width: 0.sp),
        //             Icon(Icons.power_settings_new,
        //                 size: 23.sp, color: Colors.cyan),
        //           ],
        //         ),
        //       ),
        //       label: '',
        //     ),
        //   ],
        //   currentIndex: _currentIndex,
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //       if (index == 3) {
        //         // Navigate to the ConnectPage when the "Connect" item is tapped
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => GroupPage()),
        //         );
        //       }
        //     });
        //   },
        // ),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GroupPage()),
                          );
                        },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
