import 'package:english_mbti_test_app/presentation/blocs/exam/exam_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => ExamBloc());
}
