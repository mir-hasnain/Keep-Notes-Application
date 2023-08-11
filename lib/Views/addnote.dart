import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_notes/Components/componenets.dart';
import 'package:keep_notes/Views/homescreen.dart';
class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final Box<dynamic> box = Hive.box('myBox3');
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 4,
                    )
                  ),
                    contentPadding: EdgeInsets.all(20)
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Description',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                maxLines: 1,
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 4,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            GestureDetector(
              onTap: ()async{
                Map<dynamic,dynamic> map = {
                  'title': titleController.text,
                  'value': descriptionController.text,
                  'color' : MyComponents.colors[MyComponents.iterator],
                };
                MyComponents.iterator++;
                try{
                  await box.add(map);
                }
                catch(e){
                  print('error in adding $e');
                }
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                    child: Text('Save',
                      style: TextStyle(fontSize: 20),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

