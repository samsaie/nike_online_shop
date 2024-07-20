import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_online_shop/common/exceptions.dart';
import 'package:nike_online_shop/data/comment.dart';
import 'package:nike_online_shop/data/reo/comment_repository.dart';

part 'commentlistbloc_event.dart';
part 'commentlistbloc_state.dart';


class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  final ICommentRepository repository;
  final int productId;
  CommentListBloc({
    required this.repository, 
    required this.productId
    })
      : super(CommentListLoading()) {
    on<CommentListEvent>((event1, emit) async {
      if (event1 is CommentListStarted) {
        emit(CommentListLoading());
        try {
          final comments = await repository.getAll(productId: productId);
          emit(CommentListSuccess(comments));
        } catch (e) {
          emit(CommentListError(AppException()));
        }
      } 
    });
  }
}