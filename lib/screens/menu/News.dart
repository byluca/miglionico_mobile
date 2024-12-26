import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Manteniamo la struttura: Scaffold + AppBar + body con NewsFeed
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notizie e Aggiornamenti'),
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
      'content':
      'Un grande evento medievale si terrà a Miglionico questo fine settimana! Non mancare!',
      'image': 'https://via.placeholder.com/400x200',
    },
    {
      'title': 'Aggiornamento sulla viabilità',
      'content':
      'La strada principale sarà chiusa per lavori fino al 15 gennaio.',
      'image': 'https://via.placeholder.com/400x200',
    },
    {
      'title': 'Nuova iniziativa ecologica',
      'content': 'Partecipa alla giornata di raccolta rifiuti il 20 gennaio.',
      'image': 'https://via.placeholder.com/400x200',
    },
    {
      'title': 'Offerta speciale Prodotti Locali SKRT SKRT SKRT',
      'content':
      'Scopri le offerte imperdibili sui prodotti locali al mercato di Miglionico.',
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
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Card(
        // Forma e ombra più morbide
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Immagine con bordi arrotondati in alto
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Contenuto testuale
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    content,
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Pulsanti Like/Comment/Share
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.redAccent,
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
