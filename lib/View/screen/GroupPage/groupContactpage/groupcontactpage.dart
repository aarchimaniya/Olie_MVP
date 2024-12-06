import 'package:flutter/material.dart';
import 'package:olie_mvp_app/View/screen/video_call/video_callpage.dart';

class GroupContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "My Groups",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroupCallScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search for a group",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Favorite groups",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            GroupTile(
              groupName: "Sunday Riders",
              imageUrl: "assets/sunday_riders.png", // replace with your image
              lastMessage: "",
              isFavorite: true,
            ),
            GroupTile(
              groupName: "Bikers",
              imageUrl: "assets/bikers.png", // replace with your image
              lastMessage: "Awesome time last weekend!",
              time: "17:46",
              isFavorite: true,
            ),
          ],
        ),
      ),
    );
  }
}

class GroupTile extends StatelessWidget {
  final String groupName;
  final String imageUrl;
  final String lastMessage;
  final String time;
  final bool isFavorite;

  GroupTile({
    required this.groupName,
    required this.imageUrl,
    this.lastMessage = "",
    this.time = "",
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imageUrl),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  groupName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                if (lastMessage.isNotEmpty)
                  Text(
                    lastMessage,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
              ],
            ),
          ),
          if (time.isNotEmpty)
            Text(
              time,
              style: TextStyle(color: Colors.grey),
            ),
          if (isFavorite)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Text(
                  '5',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AddGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Group"),
      ),
      body: Center(
        child: Text("This is the Add Group Page"),
      ),
    );
  }
}
