import 'dart:convert';

import 'package:comments_app/models/comment.dart';
import 'package:comments_app/services/network_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<List<Comment>?> fetchComments(context) async {
  try {
    if (await checkConnectivity()) {
      Response data =
          await getData("https://jsonplaceholder.typicode.com/comments");
      if (data.statusCode == 200) {
        List<Comment> list = [];
        json.decode(data.body).forEach((item) {
          list.add(Comment.fromJson(item));
        });
        return list;
      } else {
        throw Exception();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Please connect to internet and then try again.",
          ),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Something went wrong. Please try again later.",
        ),
      ),
    );
  }
  return null;
}
