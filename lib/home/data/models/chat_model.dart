import 'package:flutter/material.dart';

class ChatModel {
  final String name;
  final String? message;
  final String? time;
  final IconData icon;
  final bool? isGroup;
  final String? status;

  bool? isSelected;
  final int? id;

  ChatModel({
    required this.name,
    this.message,
    this.time,
    required this.icon,
    this.isGroup,
    this.status,
    this.isSelected = false,
    this.id,
  });
}
