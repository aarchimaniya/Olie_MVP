import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:olie_mvp_app/View/screen/GroupPage/Group_List/group_list_page.dart';
import 'package:olie_mvp_app/View/screen/GroupPage/groupContactpage/groupcontactpage.dart';

class CreateGroupPage extends StatefulWidget {
  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String groupName = '';

  Future<void> _showPickerDialog(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    setState(() {
      _image = pickedImage;
    });
  }

  List<Map<String, dynamic>> participants = [];

  void _addGroupToList() {
    if (groupName.isNotEmpty || _image != null) {
      setState(() {
        participants.add({
          'name': groupName.isNotEmpty ? groupName : 'Unnamed Group',
          'image': _image != null ? File(_image!.path) : null,
          'isAdmin': true,
        });
        groupName = '';
        _image = null;
      });
    }
  }

  void _removeParticipant(int index) {
    setState(() {
      participants.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F7),
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GroupListPage()),
            );
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.teal, fontSize: 15.sp),
          ),
        ),
        leadingWidth: 120.w,
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
              onPressed: () {
                Get.to(GroupContactPage());
              },
              child: Text(
                "Create",
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 20.sp,
              bottom: 20.sp,
              left: 20.sp,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _showPickerDialog(context),
                  child: CircleAvatar(
                    radius: 40.w,
                    backgroundColor: const Color(
                      0xffF2F2F7,
                    ),
                    child: _image == null
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.black,
                          )
                        : ClipOval(
                            child: Image.file(
                              File(_image!.path),
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      TextField(
                        onChanged: (value) {
                          groupName = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Group Name',
                          hintStyle: GoogleFonts.lato(
                            color: const Color(0xff9B9B9B),
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'PARTICIPANTS',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB6B6B6),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
              ),
              child: ListView.separated(
                itemCount: participants.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => _removeParticipant(index),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: participants[index]['image'] != null
                            ? FileImage(participants[index]['image'])
                            : const AssetImage('assets/default_avatar.png')
                                as ImageProvider,
                      ),
                      title: Text(participants[index]['name']),
                      trailing: participants[index]['isAdmin'] == true
                          ? const Text("Admin",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14))
                          : null,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                  ),
                  child: Divider(
                    color: Color(0xffE1E1E1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
