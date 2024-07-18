import 'package:appscrip_project/widget/home_details_modal.dart';
import 'package:flutter/material.dart';
import 'package:appscrip_project/model/user_data.dart';
import 'package:appscrip_project/utils/mediaquery.dart';
import 'package:appscrip_project/utils/app_text.dart';

class UserDataContainer extends StatelessWidget {
  final User user;

  const UserDataContainer({super.key, required this.user});

  void _showUserDetailModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return UserDetailModal(user: user);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showUserDetailModal(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: mediaqueryheight(0.08, context),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 53, 47, 47),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: AppText(text: user.id.toString(), size: 0.03),
            ),
            title: AppText(text: user.name, size: 0.04),
            subtitle: AppText(text: user.email, size: 0.03),
          ),
        ),
      ),
    );
  }
}
