import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keep_notes/Views/homescreen.dart';
class NoteView extends StatefulWidget {
  final String title,description;
  const NoteView({super.key, required this.title, required this.description});
  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Box<dynamic> box = Hive.box('myBox3');
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(CupertinoIcons.delete_solid),
            onPressed: () {
            Map<dynamic,dynamic> temp;
              for (int i = 0;i<box.length;i++) {
                temp = box.getAt(i);
                if(temp['title'].toString() == titleController.text.toString()
                && temp['value'].toString() == descriptionController.text.toString()){
                  box.deleteAt(i);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                  return;
                }
              }
            },
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .05,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Title',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                    titleController.text.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Description: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .01,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  descriptionController.text.toString(),
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
          ],
        ),
      ),
    );
  }
}














