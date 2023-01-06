import 'package:comments_app/constants/colors.dart';
import 'package:comments_app/models/comment.dart';
import 'package:comments_app/screens/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentCard extends ConsumerWidget {
  final Comment comment;
  final bool maskEmail;
  const CommentCard({required this.comment, this.maskEmail = false, super.key});

  String maskString( String email){
    String partOne = email.split("@")[0];
    if(partOne.length > 3){
      String partTwo = partOne.substring(3);
    String temp = "";
    for (int i = 0; i < partOne.substring(3).length; i++) {
      temp += "*";
    }
    partTwo.replaceRange(0, partTwo.length - 1, temp);
    return "${partOne.substring(0,3)}${partTwo.replaceRange(0,null, temp)}@${email.split("@")[1]}";
    } else {
      return email;
    }
    
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.all(8),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          ),
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: grey,
            child: Text(
              comment.name![0].toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: 'Name : ',
                    style: GoogleFonts.poppins(
                        color: grey,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: comment.name ?? "-",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: 'Email : ',
                    style: GoogleFonts.poppins(
                        color: grey,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: maskEmail ? maskString(comment.email ?? "") : comment.email,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                LimitedBox(
                  maxWidth: MediaQuery.of(context).size.width - 98,
                  child: Text(
                    comment.body ?? "No Comments",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
