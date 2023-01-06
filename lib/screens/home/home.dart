// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:comments_app/constants/colors.dart';
import 'package:comments_app/models/comment.dart';
import 'package:comments_app/screens/home/components/comment_card.dart';
import 'package:comments_app/screens/home/controller.dart';
import 'package:comments_app/screens/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  
  List<Comment> comments = [];
  bool isCommentsLoading = true;
  bool maskEmail = false;
  getComments() async {
    List<Comment>? temp = await fetchComments(context);
    if (temp != null) {
      setState(() {
        comments = temp;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong. Please try again later.",
          ),
        ),
      );
    }

    setState(() {
      isCommentsLoading = false;
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: blue,
              expandedHeight: 55.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsetsDirectional.only(start: 16, bottom: 18),
                centerTitle: false,
                title: Text(
                  "Comments",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: isCommentsLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CommentCard(comment: comments[index],maskEmail: ref.watch(homeProvider.notifier).fetchVal() ,);
                  },
                ),
        ),
      ),
    );
  }
}
