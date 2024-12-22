// makeup_cubit.dart
import 'package:beautyapp/cubit/makeup_state.dart';
import 'package:beautyapp/models/makeup_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class MakeupCubit extends Cubit<MakeupState> {
  final Dio _dio = Dio();
  List<Makeup> makeups = [];
  MakeupCubit() : super(MakeupInitial());

  Future<void> fetchMakeup() async {
    emit(MakeupLoading());
    try {
      final response = await _dio.get(
        'https://makeup-api.herokuapp.com/api/v1/products.json',
        queryParameters: {'brand': 'maybelline'},
      );
      final List<dynamic> data = response.data;
      final List<Makeup> makeups = data.map((json) => Makeup.fromJson(json)).toList();
      emit(MakeupLoaded(makeups));
    } catch (e) {
      emit(MakeupError(e.toString()));
    }
  }
  /*void searchMakeup(String query) {
    final currentState = state;
    if (currentState is MakeupLoaded) {
      final filteredMakeupList = currentState.makeups
          .where((makeup) => makeup.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(MakeupLoaded(filteredMakeupList));
    }
  }*/
  void searchProducts(String query) {
    final results = makeups.where((product) {
      final nameLower = product.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
    emit(results as MakeupState);
  }
}
