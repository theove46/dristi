import 'package:equatable/equatable.dart';

enum AccommodationsListStatus { initial, loading, success, failure }

class AccommodationsListState<T> extends Equatable {
  const AccommodationsListState({
    this.status = AccommodationsListStatus.initial,
    this.data,
    this.errorMessage,
  });

  final AccommodationsListStatus status;
  final T? data;
  final String? errorMessage;

  AccommodationsListState copyWith({
    AccommodationsListStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return AccommodationsListState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
