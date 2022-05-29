import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'filaments_state.dart';

class FilamentsCubit extends Cubit<FilamentsState> {
  FilamentsCubit()
      : super(const FilamentsState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const FilamentsState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('Filament')
        .orderBy('rating', descending: true)
        .snapshots()
        .listen((data) {
      emit(
        FilamentsState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          FilamentsState(
            documents: [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
