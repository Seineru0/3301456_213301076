import 'package:flutter/material.dart';
import 'tabs/homepage.dart';

class Persons {
  static List<Map<String, dynamic>> posts = [
    {
      'name': 'Ayşe',
      'imageUrl':
          'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg',
      'age': '23',
      'location': 'İstanbul',
      'isFav': false,
    },
    {
      'name': 'Fatma',
      'imageUrl':
          'https://images.pexels.com/photos/3992656/pexels-photo-3992656.png',
      'age': '24',
      'location': 'Afrika',
      'isFav': false,
    },
    {
      'name': 'Hayriye',
      'imageUrl':
          'https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg',
      'age': '18 (Ucuz Yırttık)',
      'location': 'Ankara',
      'isFav': false,
    },
    {
      'name': 'Teyp',
      'imageUrl': 'https://imgrosetta.mynet.com.tr/file/15533329/1200x824.jpg',
      'age': 'Yorumsuz',
      'location': 'Türkiye',
      'isFav': false,
    },
    {
      'name': 'CocaCola',
      'imageUrl': 'https://static.dw.com/image/45022275_605.jpg',
      'age': '131',
      'location': 'Atlanta',
      'isFav': false,
    },
    {
      'name': 'OyPusulası',
      'imageUrl':
          'https://im.haberturk.com/2018/02/22/ver1519299216/1848837_73a9f8369536833065acad8c5a78d6fa.jpg',
      'age': '14 Mayıs 1950 Doğumlu hesapla işte',
      'location': 'Türkiye',
      'isFav': false,
    },
  ];
  static void updatePersonFavorite(String name, bool isFav) {
    final person = posts.firstWhere((p) => p['name'] == name);
    person['isFav'] = isFav;
  }
}

class YouCard extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String age;
  final String location;
  bool isFav; // sınıfın üye değişkeni olarak tanımladık

  YouCard({
    required this.name,
    required this.imageUrl,
    required this.age,
    required this.location,
    this.isFav = false, // varsayılan olarak false
    Key? key,
  }) : super(key: key);

  @override
  State<YouCard> createState() => _YouCardState();
}

class _YouCardState extends State<YouCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.fromLTRB(70, 15, 70, 15),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight * 0.4,
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 0),
                      child: IconButton(
                        icon: Icon(
                          widget.isFav ? Icons.favorite : Icons.favorite_border,
                        ),
                        color: widget.isFav ? Colors.red : null,
                        onPressed: () {
                          setState(() {
                            if (widget.isFav) {
                              // Favorilerden çıkar
                              removeFromFavorites();
                            } else {
                              // Favorilere ekle
                              addToFavorites();
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Text(
                  '${widget.age}, ${widget.location}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

 void addToFavorites() {
  setState(() {
    widget.isFav = true;
    Persons.updatePersonFavorite(widget.name, true);
    
  });
}

void removeFromFavorites() {
  setState(() {
    widget.isFav = false;
    Persons.updatePersonFavorite(widget.name, false);
  });
}
}
