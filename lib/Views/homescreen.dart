import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keep_notes/Components/mynote.dart';
import 'package:keep_notes/Views/addnote.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Box<dynamic> box = Hive.box('myBox3');

  List<MyNote> notesList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();
  }
    void refresh(){
    notesList.clear();
    for(int i=0;i<box.length;i++){
      Map<dynamic,dynamic>? noteData = box.getAt(i);
      MyNote currNote = MyNote(data: noteData,);
      notesList.add(currNote);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.black12,
        actions: [
          const Icon(CupertinoIcons.search),
          SizedBox(width: MediaQuery.of(context).size.width * 0.06,
          ),
        ],
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        shadowColor: Colors.grey,
      ),
      body: MasonryGridView.count(
        dragStartBehavior: DragStartBehavior.start,
        itemCount: notesList.length,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          crossAxisCount: 2,
          itemBuilder: (context,index){
            return notesList[index];
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNote()));
          },
        hoverColor: Colors.purple,
        child: const Icon(CupertinoIcons.add,color: Colors.blue,),
      ),
    );
  }
}
