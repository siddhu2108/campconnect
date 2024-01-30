import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post {
  final int postId;
  final List<String> imageUrls;
  final String description;
  final DateTime postDateTime;
  final String postedBy;

  Post({
    required this.postId,
    required this.imageUrls,
    required this.description,
    required this.postDateTime,
    required this.postedBy,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List to keep track of saved posts
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
          10,
          (index) {
            // Creating a sample DateTime for the post
            DateTime postDateTime =
                DateTime.now().subtract(Duration(days: index * 5));

            // Alternate between single and multiple images
            List<String> imageUrls = index.isEven
                ? [
                    'https://images.unsplash.com/photo-1521856729154-7118f7181af9?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ]
                : [
                    'https://images.unsplash.com/photo-1433086966358-54859d0ed716?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bmF0dXJlfGVufDB8fDB8fHww',
                    'https://images.unsplash.com/photo-1546410531-bb4caa6b424d?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                  ];

            return CustomPostWidget(
              post: Post(
                postId: index,
                imageUrls: imageUrls,
                description:
                    'A camera is an optical instrument used to capture and store images and videos. ',
                postDateTime: postDateTime,
                postedBy: 'User ABC',
              ),
              onSave: (postId) {
                // Toggle save status for the post
                setState(() {
                  handleSave(postId);
                });
              },
            );
          },
        ),
      ),
    );
  }

  void handleSave(int postId) {
    if (posts.any((post) => post.postId == postId)) {
      posts.removeWhere((post) => post.postId == postId);
    } else {
      posts.add(
        Post(
          postId: postId,
          imageUrls: ['url'],
          description: 'description',
          postDateTime: DateTime.now(),
          postedBy: 'ABC',
        ),
      );
    }
  }
}

class CustomPostWidget extends StatefulWidget {
  final Post post;
  final Function(int postId) onSave;

  const CustomPostWidget({
    Key? key,
    required this.post,
    required this.onSave,
  }) : super(key: key);

  @override
  _CustomPostWidgetState createState() => _CustomPostWidgetState();
}

class _CustomPostWidgetState extends State<CustomPostWidget> {
  int likeCount = 0;
  bool isLiked = false;
  bool isSaved = false;
  bool showFullDescription = false;
  final int screenHeight = 300;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Posted by ${widget.post.postedBy}',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Posted on ${DateFormat.yMMMd().add_jm().format(widget.post.postDateTime)}',
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: widget.post.imageUrls.length == 1
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.post.imageUrls[0],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      aspectRatio: 3 / 10,
                      enlargeCenterPage: true,
                    ),
                    items: widget.post.imageUrls.map((url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                url,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // Show only the first three lines initially
                    showFullDescription
                        ? widget.post.description
                        : widget.post.description
                            .split('\n')
                            .take(3)
                            .join('\n'),
                    style: TextStyle(fontSize: 12.0),
                  ),
                  // Add a "Read more" button
                  if (!showFullDescription)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showFullDescription = true;
                        });
                      },
                      child: Text(''),
                    ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: isLiked
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        likeCount += isLiked ? 1 : -1;
                      });
                    },
                  ),
                  Text('$likeCount'),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(post: widget.post),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Handle share button press
                    },
                  ),
                ],
              ),
              IconButton(
                icon: isSaved
                    ? Icon(Icons.bookmark, color: Colors.blue[900]!)
                    : Icon(Icons.bookmark_border),
                onPressed: () {
                  // Toggle save status for the post
                  setState(() {
                    isSaved = !isSaved;
                  });

                  // Show Snackbar when post is saved
                  if (isSaved) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 0.0,
                        action: SnackBarAction(
                          label: "CLOSE",
                          onPressed: () {},
                          backgroundColor: Colors.white,
                        ),
                        backgroundColor: Colors.transparent,
                        duration: Duration(milliseconds: 3000),
                        content: Container(
                          child: Text("Post Saved! "),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue[500],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentPage extends StatelessWidget {
  final Post post;

  const CommentPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Comments'),
      ),
      body: Center(
        child: Text('This is the comment page for post ${post.postId}.'),
      ),
    );
  }
}
