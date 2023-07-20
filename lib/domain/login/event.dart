abstract class Event {}

class LoginEvent extends Event {
  final String email;

  LoginEvent({required this.email});
}
