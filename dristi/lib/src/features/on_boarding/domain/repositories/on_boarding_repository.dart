import 'package:dristi/src/features/on_boarding/data/data_sources/on_boarding_data_source.dart';
import 'package:dristi/src/features/on_boarding/data/repositories/on_boarding_repository_impl.dart';
import 'package:dristi/src/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardingRepositoryProvider = Provider<OnBoardingRepository>(
  (ref) {
    final dataSource = ref.read(onBoardingDataSourceProvider);
    return OnBoardingRepositoryImp(dataSource: dataSource);
  },
);

abstract class OnBoardingRepository {
  Future<void> setFirstTimeStatusFalse();

  Future<bool> getFirstTimeStatus();

  Future<List<OnBoardingEntity>> getOnBoardingComponents();

  Future<(String, dynamic)> buttonSubmit();
}
