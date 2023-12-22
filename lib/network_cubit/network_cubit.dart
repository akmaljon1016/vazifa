import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:vazifa/model/post.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit() : super(NetworkInitial());

  Dio dio = Dio();

  void yuklash(String id) async {
    emit(NetworkLoading());
    try {
      var response =
          await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
      if (response.statusCode == 200) {
        emit(NetworkSuccess(Post.fromJson(response.data)));
      } else {
        emit(NetworkError("error"));
      }
    } catch (e) {
      emit(NetworkError(e.toString()));
    }
  }
}
