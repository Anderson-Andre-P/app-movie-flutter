import 'package:consumindo_api/src/models/details.dart';
import 'package:consumindo_api/src/repositories/details_repository.dart';

class DetailsController {
  final DetailsRepository repository;
  Details details = Details();

  DetailsController(this.repository);

  Future<void> getDetails({int? idMovie}) async {
    details = await repository.featchDetails(
      idMovie: idMovie,
    );
  }
}
