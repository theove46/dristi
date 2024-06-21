import 'package:equatable/equatable.dart';

enum FavouritesStatus { initial, loading, success, failure }

class FavouritesState<T> extends Equatable {
  const FavouritesState({
    this.status = FavouritesStatus.initial,
    this.data = const {},
    this.errorMessage,
  });

  final FavouritesStatus status;
  final Set<String> data;
  final String? errorMessage;

  FavouritesState copyWith({
    FavouritesStatus? status,
    Set<String>? data,
    String? errorMessage,
  }) {
    return FavouritesState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
