import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Tarefas',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                itemCount: tarefas.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tarefas[index],
                    ),
                    onLongPress: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
              onPressed: () {
                if (_textEditingController.text.isNotEmpty) {
                  setState(() {
                    tarefas.add(_textEditingController.text);
                  });
                  _textEditingController.clear();
                }
              },
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            child: const Icon(Icons.remove),
            onPressed: () {
              
                setState(() {
                  tarefas = [];
                });
                _textEditingController.clear();
              
            },
          ),
        ],
      ),
    );
  }
}
