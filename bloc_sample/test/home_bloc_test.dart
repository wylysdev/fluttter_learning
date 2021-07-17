import 'package:bloc_sample/home/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  HomeBloc bloc = HomeBloc();
  test("Test Bloc", () {
    expect(bloc.output, emits(1));
    bloc.input.add(1);
  });
}
