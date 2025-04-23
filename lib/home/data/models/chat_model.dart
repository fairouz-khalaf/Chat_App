class ChatModel {
  final String name;
  final String? message;
  final String? time;
  final dynamic icon;
  final bool? isGroup;
  final String? status;
  final bool? isSelected;

  ChatModel({
    required this.name,
    this.message,
    this.time,
    required this.icon,
    this.isGroup,
    this.status,
    this.isSelected = false,
  });
}
