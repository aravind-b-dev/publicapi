

import 'package:flutter/cupertino.dart';
import 'package:publicapiapp/features/comments/domain/entities/comment.dart';
import 'package:publicapiapp/features/comments/domain/repositories/comment_repository.dart';

class CommmentProvider extends ChangeNotifier{
  final CommentRepository repository;

  CommmentProvider(this.repository);

  List<Comment> _comments = [];
  bool _isLoading = false;
  String? _error;
  Comment? _selectedComment;


  List<Comment> get comments => _comments;
  Comment? get selectedComment => _selectedComment;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchComments() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try{
      _comments = await repository.getComments();
    }catch(e){
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }


  Future<void> fetchCommentDetails(int id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try{
      _selectedComment = await repository.getCommentById(id);
    }catch(e){
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

}