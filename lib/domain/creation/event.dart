abstract class Event {}

class SubmitEvent extends Event {
  final String tag;
  final String title;
  final String description;

  SubmitEvent(this.tag, this.title, this.description);
}
