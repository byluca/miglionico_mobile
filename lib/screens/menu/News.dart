import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notizie e Aggiornamenti'),
        backgroundColor: Colors.teal,
      ),
      body: const NewsFeed(),
    );
  }
}

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  final List<Map<String, String>> _posts = [
    {
      'title': 'Evento Medievale',
      'content': 'Un grande evento medievale si terrà a Miglionico questo fine settimana! Non mancare!',
      'image': 'https://via.placeholder.com/400x200',
    },
    {
      'title': 'Aggiornamento sulla viabilità',
      'content': 'La strada principale sarà chiusa per lavori fino al 15 gennaio.',
      'image': 'https://via.placeholder.com/400x200',
    },
    {
      'title': 'Nuova iniziativa ecologica',
      'content': 'Partecipa alla giornata di raccolta rifiuti il 20 gennaio.',
      'image': 'https://via.placeholder.com/400x200',
    },
    {
      'title': 'Offerta speciale Prodotti Locali',
      'content': 'Scopri le offerte imperdibili sui prodotti locali al mercato di Miglionico.',
      'image': 'https://via.placeholder.com/400x200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsPost(
          title: post['title']!,
          content: post['content']!,
          imageUrl: post['image']!,
        );
      },
    );
  }
}

class NewsPost extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;

  const NewsPost({
    Key? key,
    required this.title,
    required this.content,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // Aggiungi funzionalità di "Mi Piace"
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.comment_outlined),
                        onPressed: () {
                          // Aggiungi funzionalità di commento
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        onPressed: () {
                          // Aggiungi funzionalità di condivisione
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
