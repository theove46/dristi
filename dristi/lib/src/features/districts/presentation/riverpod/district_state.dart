import 'package:equatable/equatable.dart';

enum DistrictStatus { initial, loading, success, failure }

class DistrictState<T> extends Equatable {
  const DistrictState({
    this.status = DistrictStatus.initial,
    this.data,
    this.errorMessage,
  });

  final DistrictStatus status;
  final T? data;
  final String? errorMessage;

  DistrictState copyWith({
    DistrictStatus? status,
    T? data,
    String? errorMessage,
  }) {
    return DistrictState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
