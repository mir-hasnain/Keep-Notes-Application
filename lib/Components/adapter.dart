import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final typeId = 1; // You can choose any unique positive integer as typeId

  @override
  Color read(BinaryReader reader) {
    int value = reader.readInt();
    return Color(value);
  }

  @override
  void write(BinaryWriter writer, Color color) {
    writer.writeInt(color.value);
  }
}
