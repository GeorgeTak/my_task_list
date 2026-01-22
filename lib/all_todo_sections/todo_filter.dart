import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_model.dart';
import 'todo_provider.dart';

class TodoFilter extends StatefulWidget {
  const TodoFilter({super.key});

  @override
  State<TodoFilter> createState() => _TodoFilterState();
}

class _TodoFilterState extends State<TodoFilter> {

  TodoCategory? _filterDropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, padding: const EdgeInsets.all(16.0), color: Colors.grey[100],
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<TodoCategory?>(
                  isExpanded: true,
                  value: _filterDropdownValue,
                  hint: const Text("Select Category"),
                  items: [
                    const DropdownMenuItem<TodoCategory?>(
                      value: null,
                      child: Text("All"),
                    ),
                    ...TodoCategory.values.map((category) {
                      return DropdownMenuItem<TodoCategory?>(
                        value: category,
                        child: Text(category.name),
                      );
                    }),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      _filterDropdownValue = newValue;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {
              context.read<TodoProvider>().setFilter(_filterDropdownValue);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.search, color: Colors.black54),
            label: const Text("Search", style: TextStyle(color: Colors.black87),),
          ),
        ],
      ),
    );
  }
}