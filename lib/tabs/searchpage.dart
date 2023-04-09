import 'package:flutter/material.dart';
import 'package:you_you/youcard.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> searchPosts = Persons.posts;

  void updateList(String value) {
    setState(() {
      searchPosts = Persons.posts
          .where((element) =>
              element['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => updateList(value),
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 237, 237, 237),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Bir şeyler yaz...',
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
          Expanded(
            child: searchPosts.length == 0
                ? Center(
                    child: Text(
                      'Sonuç Bulunamadı',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: searchPosts.length,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      title: Text(searchPosts[index]['name']),
                      leading: CircleAvatar(
                        radius: 20.0,
                        backgroundImage:
                            NetworkImage(searchPosts[index]['imageUrl']),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
