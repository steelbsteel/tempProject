import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 83, 58, 113),
      appBar: AppBar(
        backgroundColor: Color(0xFF3F3D56),
        title: Container(
          width: 250,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Поиск 3D-моделей...',
              hintStyle: TextStyle(
                color: Colors.grey[400],
              ), 
              fillColor: Colors.white, 
              filled: true, 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ), 
                borderSide: BorderSide.none, 
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ), 
            ),
            style: TextStyle(color: Colors.black), 
            cursorColor: Colors.purple, 
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {}, 
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {}, 
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {}, 
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildCard('assets/cyberpunk_girl.png', 'author_name'),
          _buildCard('assets/cyberpunk_girl.png', 'author_name'),
          _buildCard('assets/cyberpunk_girl.png', 'author_name'),
          _buildCard('assets/cyberpunk_girl.png', 'author_name'),
          _buildCard('assets/cyberpunk_girl.png', 'author_name'),
        ],
      ),
    );
  }
}

Widget _buildCard(String imagePath, String authorName) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFF5C5787),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {
                  ;
                },
              ),
              Text(
                authorName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.download, color: Colors.white),
                onPressed: () {}, 
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
