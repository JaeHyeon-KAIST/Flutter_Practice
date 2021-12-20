import 'package:flutter/material.dart';
import 'http_helper.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  String result;
  HttpHelper helper;
  int moviesCount;
  List movies;
  List tmp;
  List temp;
  int num = 1;

  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('Movies');

  Future initialize() async {
    movies = [];
    movies = (await helper.getUpcoming(1));

    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
    print(movies[0].voteAverage);
    tmp = [];
    tmp = movies;
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  // final List<String> _order = [
  //   'id',
  //   'title',
  //   'vote average',
  //   'release_date',
  //   'overview',
  //   'poster path',
  // ];

  @override
  Widget build(BuildContext context) {
    NetworkImage image;
    return Scaffold(
      appBar: AppBar(title: searchBar, actions: <Widget>[
        IconButton(
          icon: visibleIcon,
          onPressed: () {
            setState(() {
              if (this.visibleIcon.icon == Icons.search) {
                this.visibleIcon = Icon(Icons.cancel);
                this.searchBar = TextField(
                  textInputAction: TextInputAction.search,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  onSubmitted: (String text) {
                    result = text;
                    search(text, num = 1);
                  },
                );
              } else {
                movies = tmp;
                setState(() {
                  this.visibleIcon = Icon(Icons.search);
                  this.searchBar = Text('Movies');
                });
              }
            });
          },
        ),
      ]),
      body: ListView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (BuildContext context, int position) {
            if (movies[position].posterPath != null) {
              image = NetworkImage(iconBase + movies[position].posterPath);
            } else {
              image = NetworkImage(defaultImage);
            }
            return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: image,
                  ),
                  title: Text(movies[position].title),
                  subtitle: Text('Released: ' +
                      movies[position].releaseDate +
                      ' - Vote: ' +
                      movies[position].voteAverage.toString()),
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => MovieDetail(movies[position]));
                    Navigator.push(context, route);
                  },
                ));
          }),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          // child: RaisedButton(
          //   onPressed: () {},
          //   color: Colors.blue,
          //   textColor: Colors.white,
          //   child: Text('Fixed Button'),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  temp = [];
                  List order = [];
                  int j = 0;
                  // print(movies[0].voteAverage);
                  for (int i = 0; i < movies.length; i++) {
                    // print(movies.voteAverage);
                    if (i == 0) {
                      order.add([movies[i].voteAverage, i]);
                    } else {
                      j = 1;
                      while (j < i) {
                        if (movies[i].voteAverage >= order[j - 1][0] &&
                            movies[i].voteAverage <= order[j + 1][0]) {
                          order.insert(j, [movies[i].voteAverage, i]);
                          print("@@@@");
                          break;
                        }
                        j += 1;
                      }
                    }
                  }
                  // print(order);

                  // setState(() {
                  //   moviesCount = movies.length;
                  //   movies = movies;
                  // });
                  // print(movies[0].voteAverage);
                  // tmp = [];
                  // tmp = movies;
                },
                color: Colors.black,
                textColor: Colors.white,
                child: Text('by rating'),
              ),
              IconButton(
                onPressed: () async {
                  if (result == null) {
                    temp = (await helper.getUpcoming(num - 1));
                    if (temp[0] != null) {
                      setState(() {
                        moviesCount = temp.length;
                        movies = temp;
                        num -= 1;
                      });
                    }
                    setState(() {
                      moviesCount = movies.length;
                      movies = movies;
                    });
                  } else {
                    temp = await helper.findMovies(result, num - 1);
                    if (temp[0] != null) {
                      setState(() {
                        moviesCount = temp.length;
                        movies = temp;
                        num -= 1;
                      });
                    }
                  }
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.black,
              ),
              IconButton(
                onPressed: () async {
                  if (result == null) {
                    movies = (await helper.getUpcoming(num += 1));
                    setState(() {
                      moviesCount = movies.length;
                      movies = movies;
                    });
                  } else {
                    temp = await helper.findMovies(result, num + 1);
                    if (temp[0] != null) {
                      setState(() {
                        moviesCount = temp.length;
                        movies = temp;
                        num += 1;
                      });
                    }
                  }
                },
                icon: Icon(Icons.arrow_forward_ios_rounded),
                color: Colors.black,
              ),
            ],
          )),
    );
  }

  Future search(text, num) async {
    movies = await helper.findMovies(text, num);
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }
}
