import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smartwork/presentation/utils/formatter.dart';

part 'title_state.dart';

class TitleCubit extends Cubit<TitleState> {
  TitleCubit() : super(TitleInitial());

  void titleDateTime() {
    bool isNight = false;
    String sessionsDay = 'Good morning';
    final stream = Stream<DateTime>.periodic(
        const Duration(seconds: 10), (count) => DateTime.now());

    stream.listen(
      (value) {
        final timeNow = Formatter.hourD(value);

        if (timeNow != null && timeNow < 18) {
          isNight = false;
          if (timeNow < 18 && timeNow > 12) {
            sessionsDay = 'Good afternoon';
          } else {
            sessionsDay = 'Good morning';
          }
        } else {
          isNight = true;
          sessionsDay = 'Good evening';
        }
        emit(TitleDateTime(value, isNight, sessionsDay));
      },
    );
  }
}
