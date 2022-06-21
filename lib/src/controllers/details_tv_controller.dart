import 'package:consumindo_api/src/models/details_tv.dart';
import 'package:consumindo_api/src/repositories/details_tv_repository.dart';

class DetailsTvController {
  final DetailsTvRepository _repository;

  DetailsTvController(this._repository);

  DetailsTv detailsTv = DetailsTv();

  Future<void> getTvDetails({int? idTv}) async {
    detailsTv = await _repository.featchDetailsTv(idTv: idTv);
  }
}
