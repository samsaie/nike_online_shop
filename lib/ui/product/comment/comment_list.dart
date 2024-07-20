import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_online_shop/data/reo/comment_repository.dart';
import 'package:nike_online_shop/ui/product/comment/bloc/commentlistbloc_bloc.dart';
import 'package:nike_online_shop/ui/product/comment/comment.dart';
import 'package:nike_online_shop/ui/widgets/error.dart';

class CommentList extends StatelessWidget {
  final int productId;

  const CommentList({Key? key, required this.productId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final CommentListBloc bloc = CommentListBloc(
            productId: productId, repository: commentRepository);
               bloc.add(CommentListStarted());
        return bloc;
      },
      child: BlocBuilder<CommentListBloc, CommentListState>(
          builder: (context, state) {
        if (state is CommentListSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CommentItem(
                comment: state.comments[index],
              );
            }, childCount: state.comments.length),
          );
        } else if (state is CommentListLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CommentListError) {
          return SliverToBoxAdapter(
            child: AppErrorWidget(
              exception: state.exception,
              onPressed: () {
                BlocProvider.of<CommentListBloc>(context)
                    .add(CommentListStarted());
              },
            ),
          );
        } else {
          throw Exception('state is not supported');
        }
      }),
    );
  }
}

