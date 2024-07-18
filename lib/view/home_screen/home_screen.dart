import 'package:appscrip_project/utils/app_text_field.dart';
import 'package:appscrip_project/utils/mediaquery.dart';
import 'package:appscrip_project/view_model/user_viewmodel.dart';
import 'package:appscrip_project/widget/home_appbar.dart';
import 'package:appscrip_project/widget/home_list_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appscrip_project/utils/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<UserViewModel>(context, listen: false).fetchUsers());
  }

  Future<void> _refreshUsers() async {
    await Provider.of<UserViewModel>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.09, context)),
          child: const HomeAppbar()),
      body: Consumer<UserViewModel>(
        builder: (context, userViewModel, child) {
          if (userViewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (userViewModel.errorMessage.isNotEmpty) {
            return Center(
                child: AppText(
              text: 'Error: ${userViewModel.errorMessage}',
              size: 0.04,
            ));
          } else if (userViewModel.users.isEmpty) {
            return const Center(
                child: AppText(
              text: 'No users found',
              size: 0.03,
            ));
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Inputfield(
                    controller: _searchController,
                    onChanged: (value) {
                      Provider.of<UserViewModel>(context, listen: false)
                          .searchQuery = value;
                    },
                    hinttext: 'Search users...',
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refreshUsers,
                    child: ListView.builder(
                      itemCount: userViewModel.users.length,
                      itemBuilder: (context, index) {
                        final user = userViewModel.users[index];
                        return UserDataContainer(user: user);
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
