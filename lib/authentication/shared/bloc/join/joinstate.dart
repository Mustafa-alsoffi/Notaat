abstract class JoinState {}

class JoinInitialState extends JoinState {}

class JoinLoadingState extends JoinState {}

class JoinSuccessState extends JoinState {}

class JoinErorrState extends JoinState {
  final String erorr;

  JoinErorrState(this.erorr);
}

class CrrateSuccessState extends JoinState {}

class CreateErorrState extends JoinState {
  final String erorr;

  CreateErorrState(this.erorr);
}
