part of 'filaments_cubit.dart';

@immutable
class FilamentsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const FilamentsState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
