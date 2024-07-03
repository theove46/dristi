import 'package:dristi/src/features/hotels_list/data/data_sources/hotels_list_data_source.dart';
import 'package:dristi/src/features/hotels_list/domain/entities/hotels_list_entity.dart';
import 'package:dristi/src/features/hotels_list/domain/repositories/hotels_list_repositories.dart';

class HotelsListRepositoryImp implements HotelsListRepository {
  const HotelsListRepositoryImp({
    required this.dataSource,
  });

  final HotelsListDataSource dataSource;

  @override
  Future<List<HotelsListEntity>> getHotelsListComponents(
      String appLanguage) async {
    final response = await dataSource.getHotelsListComponents(appLanguage);

    return response.hotelsItems;
  }
}
