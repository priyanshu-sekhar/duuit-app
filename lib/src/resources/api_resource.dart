import 'dart:convert';
import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:http/http.dart';

// final _root = 'duuit.io/v2/';
final _root = 'localhost:5000';

class ApiResource implements Source {
  Client client = Client();

  addUser(UserArgs args) async {
    final response = await client.post(
      Uri.http(_root, '/v2/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UID': args.userId,
        'Name': args.userName!,
        'Bio': args.userBio!,
      }),
    );
  }
}