import 'package:flutter/material.dart';
import 'package:gift2grow/models/filter.dart';
import 'package:gift2grow/models/search_preload.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({Key? key, required this.filter}) : super(key: key);
  final Filter filter;
  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
            decoration:  BoxDecoration(
               boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25), // Shadow color
                blurRadius: 10.0, // Spread radius
                offset: const Offset(0, 4), // Shadow offset
              ),
            ],
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: const Color(0xFFE2E2E2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
               
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      
                      widget.filter.search = value;
                      if (SearchPreload.homeReload != null) {
                        SearchPreload.homeReload!();
                      }
                    },
                    style: const TextStyle(fontSize: 14),
                    cursorColor: Colors.black87,
                    decoration: const InputDecoration(
                      hintText: "Type something...",
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                  const Icon(
                  Icons.search,
                  color: Color(0xFF9468AC),
                ),
              ],
            ),
          );
  }
}