import 'package:equatable/equatable.dart';

enum SavedItemsStatus { initial, loading, success, failure }

class SavedItemsState<T> extends Equatable {
  const SavedItemsState({
    this.status = SavedItemsStatus.initial,
    this.data = const {},
    this.errorMessage,
  });

  final SavedItemsStatus status;
  final Set<String> data;
  final String? errorMessage;

  SavedItemsState copyWith({
    SavedItemsStatus? status,
    Set<String>? data,
    String? errorMessage,
  }) {
    return SavedItemsState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
