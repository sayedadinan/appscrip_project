import 'package:flutter/material.dart';
import 'package:appscrip_project/model/user_data.dart';
import 'package:appscrip_project/utils/app_text.dart';

class UserDetailModal extends StatelessWidget {
  final User user;

  const UserDetailModal({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 51, 50, 50),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AppText(
              text: 'User Details',
              size: 0.05,
              weight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          AppText(
            text: 'Name:  ${user.name}',
            size: 0.04,
          ),
          AppText(
            text: 'Username:  ${user.username}',
            size: 0.04,
          ),
          AppText(
            text: 'Email:  ${user.email}',
            size: 0.04,
          ),
          AppText(
            text: 'Phone:  ${user.phone}',
            size: 0.04,
          ),
          AppText(
            text: 'City:  ${user.city}',
            size: 0.04,
          ),
        ],
      ),
    );
  }
}
