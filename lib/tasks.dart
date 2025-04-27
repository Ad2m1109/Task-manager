import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _tasks();
}

class _tasks extends State<Tasks> {
  List<String> tasks = [];
  List<bool> ischecked = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tasks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text("Create your categorized tasks",
                  style: TextStyle(fontSize: 15, color: Colors.grey))
            ],
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.blue,
                    )))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {},
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Delete task!",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              content: Text("do you want to delete this task?",textAlign: TextAlign.center,),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          tasks.remove(tasks[index]);
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text(
                                        "delete",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "cancel",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                    )
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Expanded(
                          child: Text(
                            tasks[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Checkbox(
                            value: ischecked[index],
                            onChanged: (bool? value) {
                              setState(() {
                                ischecked[index] = !ischecked[index];
                              });
                            })
                      ]),
                    ),
                  ),
                );
              }),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController tec = TextEditingController();
                      return AlertDialog(
                        title: Center(child: Text("add task",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),)),
                        content: TextField(
                          controller: tec,
                          decoration: InputDecoration(
                              hintText: "write your task please"),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  String task = tec.text.trim();
                                  if (task.isNotEmpty) {
                                    setState(() {
                                      tasks.add(task);
                                      ischecked.add(false);
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                child: Text("add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),)
                            ],
                          )

                        ],
                      );
                    });
              },
              child: Icon(
                Icons.add,
                size: 50,
              )),
        ),
      ),
    );
  }
}
