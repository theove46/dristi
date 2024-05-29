import 'package:dristi/src/features/on_boarding/data/data_sources/on_boarding_data_source.dart';
import 'package:dristi/src/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:dristi/src/features/on_boarding/domain/repositories/on_boarding_repository.dart';

class OnBoardingRepositoryImp implements OnBoardingRepository {
  OnBoardingRepositoryImp({
    required this.dataSource,
  });

  final OnBoardingDataSource dataSource;

  @override
  Future<void> setFirstTimeStatusFalse() async {
    await dataSource.setFirstTimeStatusFalse();
  }

  @override
  Future<bool> getFirstTimeStatus() async {
    final response = dataSource.getFirstTimeStatus();

    return response;
  }

  @override
  Future<List<OnBoardingEntity>> getOnBoardingComponents() async {
    final response = await dataSource.onBoardingComponents();

    return response.onBoardingItems;
  }

  @override
  Future<(String, dynamic)> buttonSubmit() async {
    final response = await dataSource.buttonSubmit();

    return Future.value((response.statusMessage!, true));
  }
}
