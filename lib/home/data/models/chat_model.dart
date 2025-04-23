class ChatModel {
  final String name;
  final String message;
  final String time;
  final dynamic icon;
  final bool isGroup;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.icon,
    required this.isGroup,
  });
}
