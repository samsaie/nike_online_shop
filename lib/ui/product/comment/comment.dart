import 'package:flutter/material.dart';
import 'package:nike_online_shop/data/comment.dart';

class CommentItem extends StatelessWidget {
  final CommentEntity comment;

  const CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: themeData.dividerColor, width: 1),
          borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.title),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    comment.email,
                    style: themeData.textTheme.bodySmall,
                  ),
                ],
              ),
              Text(
                comment.date,
                style: themeData.textTheme.bodySmall,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(comment.content),
        ],
      ),
    );
  }
}
