import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keep_notes/Views/note_view.dart';
class MyNote extends StatelessWidget{
  final Box<dynamic> box = Hive.box('myBox3');
  final Map<dynamic,dynamic>? data;
  MyNote({super.key,required this.data});
  void deleteNote() {
    if (data != null && data!['key'] != null) {
      final keyToDelete = data!['key'];
      box.delete(keyToDelete);
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(
          title: data!['title'].toString(),
          description: data!['value'].toString(),)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: data!['color']
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                data!['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(7),
              child: Text(
                '11/aug/2023',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
