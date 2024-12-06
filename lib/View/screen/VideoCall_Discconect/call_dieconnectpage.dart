import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:olie_mvp_app/View/screen/Chat_Screen/chat_screenpage.dart';
import 'package:olie_mvp_app/View/screen/GroupPage/Group_List/group_list_page.dart';
import 'package:olie_mvp_app/View/screen/GroupPage/group_pge.dart';

class DisconnectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171717),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Text(
                'The Peaky Riders',
                style: TextStyle(color: Colors.white, fontSize: 19.sp),
              ),
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
                    backgroundImage:
                        const AssetImage("lib/assets/images/img_17.png"),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-12, 0),
                  child: CircleAvatar(
                    radius: 14.sp,
                    backgroundImage:
                        const AssetImage("lib/assets/images/img_18.png"),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-18, 0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to another page when + avatar is clicked
                      Get.to(GroupListPage());
                    },
                    child: CircleAvatar(
                      radius: 14.sp,
                      backgroundColor: Colors.grey.shade800,
                      child: const Text(
                        "+2",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xFF35DAD7),
                    Color(0xFF018A87),
                  ])),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  Get.to(ChatScreenPage());
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF262626),
                child: IconButton(
                  icon: const Icon(Icons.grid_view, color: Color(0xFFACACAC)),
                  onPressed: () {},
                ),
              ),
              CircleAvatar(
                backgroundColor: const Color(0xFF262626),
                child: IconButton(
                  icon: const Icon(Icons.music_note, color: Color(0xFFACACAC)),
                  onPressed: () {},
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF262626),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Sports Mode',
                  style: TextStyle(color: Color(0xFFACACAC)),
                ),
              ),
              CircleAvatar(
                backgroundColor: const Color(0xFF262626),
                child: IconButton(
                  icon: const Icon(Icons.mic_off, color: Color(0xFFACACAC)),
                  onPressed: () {},
                ),
              ),
              CircleAvatar(
                backgroundColor: const Color(0xFF262626),
                child: IconButton(
                  icon: const Icon(Icons.volume_up, color: Color(0xFFACACAC)),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
          Text(
            'Addison',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(flex: 2),
          Stack(
            children: [
              Transform.translate(
                offset: Offset(-40.w, 80.h),
                child: CircleAvatar(
                  radius: 40.w,
                  backgroundImage:
                      const AssetImage("lib/assets/images/img_4.png"),
                ),
              ),
              Transform.translate(
                offset: Offset(160.w, 10.h),
                child: CircleAvatar(
                  radius: 35.w,
                  backgroundImage:
                      const AssetImage("lib/assets/images/img_5.png"),
                ),
              ),
              Transform.translate(
                offset: Offset(145.w, 130.h),
                child: CircleAvatar(
                  radius: 33.w,
                  backgroundColor: const Color(0xFF605F5F),
                  child: const Text(
                    '+5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade900,
                    width: 5.sp,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('lib/assets/images/img_2.png'),
                ),
              ),
            ],
          ),
          const Spacer(flex: 3),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF232323), // Start color
                  Color(0xFF313131), // End color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .transparent, // Background color is transparent to show gradient
                shadowColor: Colors
                    .transparent, // Removes the shadow to keep gradient visible
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.teal,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Get.to(GroupPage());
              },
              icon: const Icon(Icons.power_settings_new, color: Colors.teal),
              label: Text(
                'Disconnect ',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
