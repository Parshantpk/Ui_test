part of 'me_bloc.dart';

abstract class MeEvent extends Equatable {
  const MeEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadMeEvent extends MeEvent {}

class UpdateProfileEvent extends MeEvent {
  final List<Profile> profile;

  const UpdateProfileEvent(this.profile);
  @override
  // TODO: implement props
  List<Object?> get props => [profile];
}

class UpdateMyCatEvent extends MeEvent {
  final List<Cat> myCats;

  const UpdateMyCatEvent(this.myCats);
  @override
  // TODO: implement props
  List<Object?> get props => [myCats];
}

class MeBlocRemoveEvent extends MeEvent {
  final int index;

  const MeBlocRemoveEvent({required this.index});
}