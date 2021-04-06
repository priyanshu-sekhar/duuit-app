import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  static const String route = '/chats';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(),
    );
  }

  _buildHeader() {}
}