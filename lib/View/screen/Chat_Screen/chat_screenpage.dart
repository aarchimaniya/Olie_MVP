import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../helper/location_services.dart';

class ChatScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF35DAD7),
          ),
          onPressed: () {
            // Handle back button action
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/assets/images/img_20.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Bike PROS',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF8BF4FD).withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.circle,
              color: Color(0xFF8BF4FD),
              size: 15,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ChatBubble(
                        text:
                            'Did you have a great time with the squad last weekend? 😋',
                        isCurrentUser: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ChatBubble(
                        text: 'Are you guys up for BBQ tonight?',
                        isCurrentUser: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ChatBubble(
                        text:
                            'Yeah, we had a great time, indeed. Alexandra and Daniel were there also. I think you could know them from the festival last week. 🕺',
                        isCurrentUser: true,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ChatBubble(
                        text: 'Dude!!! Yeah! 🕺',
                        isCurrentUser: false,
                      ),
                    ),
                  ],
                ),
              ),
              MessageInput(),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isCurrentUser;

  ChatBubble({required this.text, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(maxWidth: 250),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.lightBlue[50] : Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(isCurrentUser ? 15 : 0),
          bottomRight: Radius.circular(isCurrentUser ? 0 : 15),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final LocationService _locationService =
      LocationService(); // Initialize the location service

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Handle the selected image file (pickedFile.path)
      // You can display the image or upload it to the server
    }
  }

  Future<void> _captureImageWithCamera(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Handle the captured image file (pickedFile.path)
      // You can display the image or upload it to the server
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: double.infinity,
      height: 60,
      borderRadius: 0,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 0,
      linearGradient: LinearGradient(
        colors: [
          Color(0xFFF2F2F7).withOpacity(0.1),
          Color(0xFFF2F2F7).withOpacity(0.05)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.add, color: Color(0xFF35DAD7)),
              onPressed: () => _showCupertinoAlertDialog(context),
            ),
            SizedBox(width: 10),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(color: Color(0xFF35DAD7)),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.camera_alt_outlined, color: Color(0xFF35DAD7)),
              onPressed: () => _captureImageWithCamera(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showCupertinoAlertDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoTheme(
        data: const CupertinoThemeData(brightness: Brightness.dark),
        child: CupertinoActionSheet(
          actions: [
            GlassmorphicContainer(
              width: double.infinity,
              height: 250,
              borderRadius: 20,
              blur: 20,
              border: 0,
              linearGradient: LinearGradient(
                colors: [
                  Color(0xFF2B2B2B).withOpacity(0.5),
                  Color(0xFF2B2B2B).withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: const LinearGradient(
                colors: [Colors.transparent, Colors.transparent],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        _pickImageFromGallery(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.photo, color: Color(0xFF35DAD7)),
                          SizedBox(width: 10),
                          Text(
                            'Photo & Video Library',
                            style: TextStyle(color: Color(0xFF35DAD7)),
                          ),
                        ],
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        _locationService.requestLocationPermission().then((_) {
                          _locationService
                              .getCurrentLocation()
                              .then((position) {
                            if (position != null) {
                              _locationService.openLocationInMap(position);
                            }
                          });
                        });
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xFF35DAD7)),
                          SizedBox(width: 10),
                          Text(
                            'Share Location',
                            style: TextStyle(color: Color(0xFF35DAD7)),
                          ),
                        ],
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.cancel, color: Color(0xFF35DAD7)),
                          SizedBox(width: 10),
                          Text(
                            'Cancel',
                            style: TextStyle(color: Color(0xFF35DAD7)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
