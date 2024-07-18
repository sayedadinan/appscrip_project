import 'package:appscrip_project/model/user_data.dart';
import 'package:appscrip_project/services/data_fetching.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final UserService _userService = UserService();
  List<User> _users = [];
  List<User> _filteredUsers = [];
  bool _isLoading = false;
  String _errorMessage = '';
  String _searchQuery = '';

  List<User> get users => _filteredUsers.isNotEmpty ? _filteredUsers : _users;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
    _applySearchFilter();
  }

//from here function is communicating to backend and storing to the list and notifying that for everywhere
  Future<void> fetchUsers() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _users = await _userService.fetchUsers();
      _applySearchFilter();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _applySearchFilter() {
    if (_searchQuery.isEmpty) {
      _filteredUsers = [];
    } else {
      _filteredUsers = _users.where((user) {
        return user.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.username.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.email.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
