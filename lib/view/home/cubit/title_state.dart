part of 'title_cubit.dart';

abstract class TitleState extends Equatable {
  const TitleState();

  @override
  List<Object> get props => [];
}

class TitleInitial extends TitleState {}

class TitleDateTime extends TitleState {
  final DateTime dateNow;
  final bool isNight;
  final String sessionsDay;

 const  TitleDateTime(this.dateNow, this.isNight, this.sessionsDay);
 @override
  List<Object> get props => [dateNow,isNight,sessionsDay];

}
