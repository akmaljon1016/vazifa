part of 'network_cubit.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();
}

class NetworkInitial extends NetworkState {
  @override
  List<Object> get props => [];
}

class NetworkLoading extends NetworkState {
  @override
  List<Object> get props => [];
}

class NetworkSuccess extends NetworkState {
  final Post post;

  const NetworkSuccess(this.post);

  @override
  List<Object> get props => [post];
}

class NetworkError extends NetworkState {
  final String message;

  const NetworkError(this.message);

  @override
  List<Object> get props => [message];
}
