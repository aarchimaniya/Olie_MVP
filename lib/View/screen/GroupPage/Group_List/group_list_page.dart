import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olie_mvp_app/View/screen/GroupScreen/CreateGroupPage/create_group_page.dart';
import 'package:olie_mvp_app/View/screen/video_call/video_callpage.dart';

import '../../../../modals/Add_Freinds/add_friends_modal.dart';

class GroupListPage extends StatefulWidget {
  @override
  _AddFriendsPageState createState() => _AddFriendsPageState();
}

class _AddFriendsPageState extends State<GroupListPage> {
  final List<Contact> contacts = [
    Contact(
        name: 'Adam Flores',
        avatar: 'lib/assets/images/img_5.png',
        status: 'online'),
    Contact(name: 'Addison Black', avatar: 'lib/assets/images/img_4.png'),
    Contact(
        name: 'Adrian McCoy',
        avatar: 'lib/assets/images/img_6.png',
        status: 'online'),
    Contact(
        name: 'Alan Cooper',
        avatar: 'lib/assets/images/img_7.png',
        status: 'online'),
    Contact(
        name: 'Barnard Henry',
        avatar: 'lib/assets/images/img_8.png',
        status: 'online'),
    Contact(name: 'Barry Fisher', avatar: 'lib/assets/images/img_9.png'),
    Contact(name: 'Baxter Williamson', avatar: 'lib/assets/images/img_10.png'),
    Contact(name: 'Brooklyn Simmons', avatar: 'lib/assets/images/img_11.png'),
    Contact(
        name: 'Cameo Russell',
        avatar: 'lib/assets/images/img_12.png',
        status: 'online'),
    Contact(name: 'Caryl Lane', avatar: 'lib/assets/images/img_13.png'),
    Contact(
        name: 'Chadwick Steward',
        avatar: 'lib/assets/images/img_3.png',
        status: 'online'),
    Contact(name: 'Charlie Robertson', avatar: 'lib/assets/images/img_14.png'),
  ];

  List<Contact> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void _filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.teal, fontSize: 15.sp),
          ),
        ),
        leadingWidth: 80.w,
        title: Text(
          "Contacts",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Next",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: _filterContacts,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color(0xFFF3F3F3),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon:
                      Icon(Icons.add_circle, color: Colors.black, size: 30.sp),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateGroupPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: ListView(
                children: _buildContactList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContactList() {
    Map<String, List<Contact>> groupedContacts = {};

    for (var contact in filteredContacts) {
      String firstLetter = contact.name[0].toUpperCase();
      if (groupedContacts[firstLetter] == null) {
        groupedContacts[firstLetter] = [];
      }
      groupedContacts[firstLetter]!.add(contact);
    }

    List<Widget> contactWidgets = [];

    groupedContacts.forEach((letter, contacts) {
      contactWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: contacts
                    .map((contact) => _buildContactRow(contact))
                    .toList(),
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      );
    });

    return contactWidgets;
  }

  Widget _buildContactRow(Contact contact) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(contact.avatar),
              ),
              title: Text(
                contact.name,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    contact.selected = !contact.selected;
                  });
                },
                child: Icon(
                  contact.selected ? Icons.check_circle : Icons.circle_outlined,
                  color: contact.selected ? Colors.teal : Colors.grey,
                ),
              ),
            ),
            Divider(
              height: 1.0,
              thickness: 1.0,
              color: Colors.grey[300],
            ),
          ],
        );
      },
    );
  }
}
