import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';

abstract class ChatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final bool data;

  ChatLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class ChatSended extends ChatState {
  final bool data;

  ChatSended({required this.data});

  @override
  List<Object?> get props => [data];
}

class ChatFailure extends ChatState {
  final Failure failure;

  ChatFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
