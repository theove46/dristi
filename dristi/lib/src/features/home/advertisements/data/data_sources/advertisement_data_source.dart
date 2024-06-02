import 'package:dristi/src/features/home/advertisements/data/data_sources/advertisement_data_source_impl.dart';
import 'package:dristi/src/features/home/advertisements/data/model/advertisement_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final advertisementDataSourceProvider = Provider<AdvertisementDataSource>(
  (ref) {
    return AdvertisementDataSourceImp();
  },
);

abstract class AdvertisementDataSource {
  Future<AdvertisementResponseModel> advertisementComponents();
}
