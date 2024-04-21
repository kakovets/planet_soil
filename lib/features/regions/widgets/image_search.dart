import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageSearch extends StatefulWidget {
  const ImageSearch({super.key, required this.query});

  final String query;

  @override
  State<ImageSearch> createState() => _ImageSearchState();
}

class _ImageSearchState extends State<ImageSearch> {
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchImage(widget.query).then((url) {
      setState(() {
        imageUrl = url;
      });
    }).catchError((error) {
      debugPrint('Error fetching image: $error');
    });
  }

  Future<String> fetchImage(String query) async {
    var key = 'haha, u will not steal my free unsplash key!';

    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/photos/random?query=$query&client_id=$key',
      ),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final imageUrl = responseData['urls']['regular'];
      return imageUrl;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: imageUrl.isNotEmpty
          ?
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }
          },
        ),
      )
          :
      const SizedBox(),
    );
  }
}