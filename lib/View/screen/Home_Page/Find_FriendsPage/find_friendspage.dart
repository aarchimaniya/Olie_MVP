import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../modals/Add_Freinds/add_friends_modal.dart';

class FindFriendsPage extends StatefulWidget {
  @override
  _FindFriendsPageState createState() => _FindFriendsPageState();
}

class _FindFriendsPageState extends State<FindFriendsPage> {
  final List<Contact> contacts = [
    Contact(
        name: 'Adam Flores',
        avatar: 'lib/assets/images/profile1.png',
        status: 'online'),
    Contact(name: 'Addison Black', avatar: 'lib/assets/images/profile2.png'),
    Contact(
        name: 'Adrian McCoy',
        avatar: 'lib/assets/images/profile3.png',
        status: 'online'),
    Contact(
        name: 'Alan Cooper',
        avatar: 'lib/assets/images/profile4.png',
        status: 'online'),
    Contact(
        name: 'Barnard Henry',
        avatar: 'lib/assets/images/profile2.png',
        status: 'online'),
    Contact(name: 'Barry Fisher', avatar: 'lib/assets/images/profile4.png'),
    Contact(
        name: 'Baxter Williamson', avatar: 'lib/assets/images/profile1.png'),
    Contact(name: 'Brooklyn Simmons', avatar: 'lib/assets/images/profile3.png'),
    Contact(
        name: 'Cameo Russell',
        avatar: 'lib/assets/images/profile4.png',
        status: 'online'),
    Contact(name: 'Caryl Lane', avatar: 'lib/assets/images/profile2.png'),
    Contact(
        name: 'Chadwick Steward',
        avatar: 'lib/assets/images/profile3.png',
        status: 'online'),
    Contact(
        name: 'Charlie Robertson', avatar: 'lib/assets/images/profile4.png'),
  ];

  List<Contact> filteredContacts = [];
  List<Contact> selectedContacts = [];

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

  void _toggleSelectContact(Contact contact) {
    setState(() {
      if (selectedContacts.contains(contact)) {
        selectedContacts.remove(contact);
        contact.selected = false;
      } else {
        selectedContacts.add(contact);
        contact.selected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.teal, fontSize: 15.sp),
            ),
          ),
        ),
        leadingWidth: 80.w,
        title: Text(
          "Add Contacts",
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
                "Add",
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterContacts,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffF3F3F3),
                filled: true,
              ),
            ),
          ),
          if (selectedContacts.isNotEmpty)
            Container(
              height: 80,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedContacts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(selectedContacts[index].avatar),
                            ),
                            Positioned(
                              top: -11,
                              right: -10,
                              child: IconButton(
                                icon: Icon(Icons.cancel,
                                    color: Color(0xFF2DBFBD), size: 20),
                                onPressed: () {
                                  _toggleSelectContact(selectedContacts[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          selectedContacts[index].name.split(' ')[0],
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          Expanded(
            child: ListView(
              children: _buildContactList(),
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  letter,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: contacts
                      .map((contact) => _buildContactRow(contact))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
    });

    return contactWidgets;
  }

  Widget _buildContactRow(Contact contact) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(contact.avatar),
      ),
      title: Text(contact.name),
      trailing: GestureDetector(
        onTap: () {
          _toggleSelectContact(contact);
        },
        child: Icon(
          contact.selected ? Icons.check_circle : Icons.radio_button_unchecked,
          color: contact.selected ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
