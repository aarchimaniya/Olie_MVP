import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olie_mvp_app/View/screen/GroupPage/Group_List/group_list_page.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  int _currentIndex = 0;
  int _current = 0;

  final List<Widget> _favoriteGroups = [
    FavoriteGroupWidget(),
    FavoriteGroupWidget(),
    FavoriteGroupWidget(),
  ];

  final List<Group> groups = [
    Group(
        image:
            'https://s3-alpha-sig.figma.com/img/78f8/f3dd/0ef9a30193ae437495c55cd678e27374?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FqSj~FKTb7WdrmwlKtwd2MEr4sWPztaXCkV5umdiBGcdg5M8BWSThv86hzL5l2FTmUor7psnKu8eJBvVc7QYG7VGrDj~euhDbDa~QR-~ye-R2fP291IJ2rszrkBuJwoSOLRikb~ZckuqhrGS7e6o-xDI47ljRTHUDYXxojsjumKgZFCnzSqrlHqBhbjiZ9sl1hwco-B90uaa0K74GQCANhedmuVHoBIrsL-CPhZpPPlSRsjUDT8xWpEVg-YzlitDlFX7fzka9YsIKoRigxu3X7HpGdD4xVTRvzRGYV0g~NVw-6AkIb5Uu~o30r1-lqd--wyG7nnbXQra6tjIUxI8PQ__',
        name: 'Climbing',
        time: '17:46',
        notifications: 8,
        likes: 5,
        comments: 12),
    Group(
        image:
            'https://s3-alpha-sig.figma.com/img/78f8/f3dd/0ef9a30193ae437495c55cd678e27374?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FqSj~FKTb7WdrmwlKtwd2MEr4sWPztaXCkV5umdiBGcdg5M8BWSThv86hzL5l2FTmUor7psnKu8eJBvVc7QYG7VGrDj~euhDbDa~QR-~ye-R2fP291IJ2rszrkBuJwoSOLRikb~ZckuqhrGS7e6o-xDI47ljRTHUDYXxojsjumKgZFCnzSqrlHqBhbjiZ9sl1hwco-B90uaa0K74GQCANhedmuVHoBIrsL-CPhZpPPlSRsjUDT8xWpEVg-YzlitDlFX7fzka9YsIKoRigxu3X7HpGdD4xVTRvzRGYV0g~NVw-6AkIb5Uu~o30r1-lqd--wyG7nnbXQra6tjIUxI8PQ__',
        name: 'Hiking',
        time: '18:30',
        notifications: 0,
        likes: 8,
        comments: 7),
    Group(
        image:
            'https://s3-alpha-sig.figma.com/img/78f8/f3dd/0ef9a30193ae437495c55cd678e27374?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FqSj~FKTb7WdrmwlKtwd2MEr4sWPztaXCkV5umdiBGcdg5M8BWSThv86hzL5l2FTmUor7psnKu8eJBvVc7QYG7VGrDj~euhDbDa~QR-~ye-R2fP291IJ2rszrkBuJwoSOLRikb~ZckuqhrGS7e6o-xDI47ljRTHUDYXxojsjumKgZFCnzSqrlHqBhbjiZ9sl1hwco-B90uaa0K74GQCANhedmuVHoBIrsL-CPhZpPPlSRsjUDT8xWpEVg-YzlitDlFX7fzka9YsIKoRigxu3X7HpGdD4xVTRvzRGYV0g~NVw-6AkIb5Uu~o30r1-lqd--wyG7nnbXQra6tjIUxI8PQ__',
        name: 'Cycling',
        time: '19:10',
        notifications: 3,
        likes: 2,
        comments: 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
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
      body: Column(
        children: [
          // Full-width container with search bar, carousel slider, and indicators
          Padding(
            // padding: const EdgeInsets.all(8.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

            child: Row(
              children: [
                Text(
                  'My Groups',
                  style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupListPage()),
                        );
                      },
                      icon: Icon(
                        Icons.person_search_rounded,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for a group',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CarouselSlider(
                  items: _favoriteGroups,
                  options: CarouselOptions(
                    height: 120,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.65,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _favoriteGroups.map((url) {
                    int index = _favoriteGroups.indexOf(url);
                    return Container(
                      width: 40.0,
                      height: 4.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _current == index
                            ? const Color(0xFF333333)
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final group = groups[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: NetworkImage(group.image),
                        ),
                        if (group.notifications > 0)
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundColor: const Color(0xffFF3B6C),
                              child: Center(
                                child: Text(
                                  "${group.notifications}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Text(group.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Awesome time last weekend!'),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(group.time),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.thumb_up,
                                size: 16.0, color: Colors.grey),
                            SizedBox(width: 4.0),
                            Text('${group.likes}',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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

class Group {
  final String image;
  final String name;
  final String time;
  final int notifications;
  final int likes;
  final int comments;

  Group(
      {required this.image,
      required this.name,
      required this.time,
      required this.notifications,
      required this.likes,
      required this.comments});
}

class FavoriteGroupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(35.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.w,
                  backgroundImage:
                      const AssetImage("lib/assets/images/img_15.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      'Sunday Riders',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14.sp,
                          backgroundImage:
                              const AssetImage("lib/assets/images/img_16.png"),
                        ),
                        Transform.translate(
                          offset: const Offset(-8, 0),
                          child: CircleAvatar(
                            radius: 14.sp,
                            backgroundImage: const AssetImage(
                                "lib/assets/images/img_17.png"),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-12, 0),
                          child: CircleAvatar(
                            radius: 14.sp,
                            backgroundImage: const AssetImage(
                                "lib/assets/images/img_18.png"),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-18, 0),
                          child: CircleAvatar(
                            radius: 14.sp,
                            backgroundColor: Color(0xFF35DAD7),
                            child: const Text(
                              "+7",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SmallColoredCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: Colors.primaries[
          (DateTime.now().millisecondsSinceEpoch % Colors.primaries.length)],
    );
  }
}
