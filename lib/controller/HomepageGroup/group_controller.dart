import 'package:flutter/material.dart';

import '../../modals/HomePage_Group/group_modal.dart';

class GroupController with ChangeNotifier {
  final List<Group> _groups = [
    Group(
        id: 1,
        image: 'lib/assets/images/profile1.png',
        name: 'Family',
        members: 7),
    Group(
        id: 2,
        image: 'lib/assets/images/profile2.png',
        name: 'Biker Friends',
        members: 12),
    Group(
        id: 3,
        image: 'lib/assets/images/profile3.png',
        name: 'Book Club',
        members: 5),
    Group(
      id: 4,
      image: 'lib/assets/images/profile4.png',
      name: 'John',
      members: 8,
    ),
  ];

  List<Group> get groups => _groups;

  void addGroup(Group group) {
    _groups.add(group);
    notifyListeners();
  }

  void removeGroup(Group group) {
    _groups.remove(group);
    notifyListeners();
  }

  Future<void> startVideoCall(int groupId) async {
    // Mock API call to start a video call
    await Future.delayed(Duration(seconds: 2));
    // Normally you would call your video call API here and handle the response
    print('Video call started for group $groupId');
    // Notify listeners if you need to update the UI based on the API response
  }
}
