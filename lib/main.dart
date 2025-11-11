import 'package:katalog_film_favorit/video_page.dart';
import 'package:flutter/material.dart';

// fungsi main
void main() {
  runApp(const MyApp());
}

// wijet utama
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog Film Favorit',
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

// halaman utma daftar film - sateful
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// PROYEKAN UTS MOBILE PROGRAMMING 2
class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Movie> _wishlist = [];

  // daftar film (poster + trailernya)
  final List<Movie> _allMovies = [
    Movie(
      title: 'The Dark Knight',
      trailerId: 'EXeTwQWrcwY',
      posterUrl:
          'https://artofthemovies.co.uk/cdn/shop/files/IMG_0402_8a4ee439-15c9-4b0d-b68f-237e984e5e59_1024x1024@2x.jpg?v=1706799949',
      genre: 'Action, Crime, Drama',
      sinopsis:
          'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc on Gotham. Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    ),
    Movie(
      title: 'Inception',
      trailerId: 'YoHD9XEInc0',
      posterUrl:
          'https://www.tallengestore.com/cdn/shop/products/Inception-LeonardoDiCaprio-ChristopherNolan-HollywoodSciFiMoviePoster_492df2f6-2838-4224-a51a-d9238909caf2.jpg?v=1685582034',
      genre: 'Action, Sci-Fi, Thriller',
      sinopsis:
          'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
    ),
    Movie(
      title: 'Interstellar',
      trailerId: '2LqzF5WauAw',
      posterUrl:
          'https://mir-s3-cdn-cf.behance.net/project_modules/hd_webp/8d8f28105415493.619ded067937d.jpg',
      genre: 'Sci-Fi, Drama, Adventure',
      sinopsis:
          "A team of explorers travels through a wormhole in space in an attempt to ensure humanity's survival after Earth is ravaged by famine.",
    ),
    Movie(
      title: 'The Matrix',
      trailerId: 'vKQi3bBA1y8',
      posterUrl:
          'https://fiu-original.b-cdn.net/fontsinuse.com/use-images/170/170601/170601.jpeg',
      genre: 'Action, Sci-Fi',
      sinopsis:
          'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers: intelligent machines.',
    ),
    Movie(
      title: 'Spirited Away',
      trailerId: 'ByXuk9QqQkk',
      posterUrl:
          'https://academymuseumstore.org/cdn/shop/files/3f654da1-ae03-4fb3-b22c-bdf74933d365.jpg?v=1754499165',
      genre: 'Animation, Fantasy, Family',
      sinopsis:
          "During her family's move to the suburbs, a 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.",
    ),
    Movie(
      title: 'Parasite',
      trailerId: '5xH0HfJHsaY',
      posterUrl:
          'https://image.tmdb.org/t/p/original/9PSifrJfKl8sy9tBOd5Vcg0jbN6.jpg',
      genre: 'Thriller, Drama, Comedy',
      sinopsis:
          'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.',
    ),
    Movie(
      title: 'Avengers: Endgame',
      trailerId: 'hA6hldpSTF8',
      posterUrl:
          'https://cdn.marvel.com/content/2x/MLou2_Payoff_1-Sht_Online_DOM_v7_Sm.jpg',
      genre: 'Action, Sci-Fi, Adventure',
      sinopsis:
          'After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more to undo Thanos\'s actions.',
    ),
    Movie(
      title: 'Your Name',
      trailerId: 'NooIc3dMncc',
      posterUrl:
          'https://i.pinimg.com/736x/6e/bb/61/6ebb613c140c69319a3e7f74d1246ef6.jpg',
      genre: 'Animation, Fantasy, Romance',
      sinopsis:
          'Two strangers find themselves linked in a bizarre way. When they start randomly swapping places, their lives change. They decide to meet each other.',
    ),
    Movie(
      title: 'Pacific Rim',
      trailerId: '5guMumPFBag',
      posterUrl:
          'https://m.media-amazon.com/images/M/MV5BMTY3MTI5NjQ4Nl5BMl5BanBnXkFtZTcwOTU1OTU0OQ@@._V1_FMjpg_UX1000_.jpg',
      genre: 'Action, Sci-Fi, Adventure',
      sinopsis:
          'As a war between humankind and monstrous sea creatures wages on, a former pilot and a trainee are paired up to drive an obsolete Jaeger, a special weapon, in a last-ditch effort.',
    ),
    Movie(
      title: 'Harry Potter',
      trailerId: 'VyHV0BRtdxo',
      posterUrl:
          'https://media.posterstore.com/site_images/68631db092c536b9cc92b06f_775081888_WB0101-5.jpg?auto=compress%2Cformat&fit=max&w=3840',
      genre: 'Fantasy, Adventure, Family',
      sinopsis:
          'An orphaned boy enrolls in a magical boarding school, where he learns the truth about himself, his family, and the terrible evil that haunts the wizarding world.',
    ),
    Movie(
      title: 'Kung Fu Panda',
      trailerId: 'NRc-ze7Wrxw',
      posterUrl:
          'https://c8.alamy.com/comp/EYWBB3/kung-fu-panda-year-2008-usa-director-mark-osborne-john-stevenson-animation-EYWBB3.jpg',
      genre: 'Animation, Action, Comedy',
      sinopsis:
          'The lazy and irreverent Po, a panda, must become a Kung Fu master to save the Valley of Peace from the evil snow leopard, Tai Lung.',
    ),
    Movie(
      title: 'The Human Centipede',
      trailerId: 'JdW1yPTBPFA',
      posterUrl: 'https://i.ebayimg.com/images/g/R00AAOSw-DhkPW6L/s-l1200.jpg',
      genre: 'Horror',
      sinopsis:
          'A mad scientist kidnaps three tourists and surgically joins them mouth-to-anus, forming a "human centipede".',
    ),
  ];

  List<Movie> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = _allMovies;
    _searchController.addListener(_filterMovies);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterMovies);
    _searchController.dispose();
    super.dispose();
  }

  // otak kolom pencarian
  void _filterMovies() {
    final String query = _searchController.text.toLowerCase();
    List<Movie> tempFilteredList = [];
    if (query.isEmpty) {
      tempFilteredList = _allMovies;
    } else {
      tempFilteredList = _allMovies.where((movie) {
        return movie.title.toLowerCase().contains(query);
      }).toList();
    }
    setState(() {
      _filteredMovies = tempFilteredList;
    });
  }

  // fungsi wislist
  void _toggleWishlist(Movie movie) {
    setState(() {
      if (_wishlist.contains(movie)) {
        _wishlist.remove(movie);
      } else {
        _wishlist.add(movie);
      }
    });
  }

  // tampilan
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Film Favorit'),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu), // Ikon garis tiga
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      // bagian drawer geser (dari kanan)
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[850]),
                child: Center(
                  child: Text(
                    'Daftar Tontonan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            if (_wishlist.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'Daftar tontonan kosong',
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _wishlist.length,
                  itemBuilder: (context, index) {
                    final movie = _wishlist[index];
                    return ListTile(
                      title: Text(
                        movie.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Icon(Icons.movie, color: Colors.white70),
                    );
                  },
                ),
              ),
          ],
        ),
      ),

      // BODY UTAMA
      body: Column(
        children: [
          // kolm pncarian
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Masukan nama film',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[850],
              ),
            ),
          ),
          Expanded(child: _buildResults()),
        ],
      ),
    );
  }

  // fungsi hasil tampilan
  Widget _buildResults() {
    if (_filteredMovies.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'film tidak tersedia, coba cari aja di bioskop langsung',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: _filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = _filteredMovies[index];
        return MovieCard(
          movie: movie,
          onToggleWishlist: () {
            _toggleWishlist(movie);
          },
          isMovieInWishlist: _wishlist.contains(movie),
        );
      },
    );
  }
}

// kustom wijet
class MovieCard extends StatefulWidget {
  final Movie movie;
  final Function() onToggleWishlist;
  final bool isMovieInWishlist;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onToggleWishlist,
    required this.isMovieInWishlist,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  double _currentRating = 0.0;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.movie.rating;
  }

  // kode buat pop up
  void _showDetailDialog(
    BuildContext context,
    Movie movie,
    Function(double) onRatingChanged,
    Function() onToggleWishlist,
    bool isMovieInWishlist,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (BuildContext context) {
        double popUpRating = movie.rating;
        bool statusWishlistLokal = isMovieInWishlist;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStatePopUp) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              insetPadding: const EdgeInsets.all(20.0),
              backgroundColor: Colors.transparent,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // konten utama (pop up)
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // poster
                          Hero(
                            tag: movie.trailerId,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                movie.posterUrl,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),

                          // JUDUL FILM DI POPUP
                          Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12.0),

                          // bintag di popup
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              final double starRating = index + 1.0;
                              return GestureDetector(
                                onTap: () {
                                  setStatePopUp(() {
                                    if (starRating == popUpRating) {
                                      popUpRating = 0.0;
                                    } else {
                                      popUpRating = starRating;
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: Icon(
                                    starRating <= popUpRating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 30.0,
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 12.0),

                          // genre film
                          Text(
                            movie.genre,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[400],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Divider(color: Colors.grey[700]),
                          const SizedBox(height: 16.0),

                          // deskripsi/sinosis
                          Text(
                            movie.sinopsis,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[300],
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 24.0),

                          // TOMBOL 1: Tonton Sekarang (merah)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: () {
                              // 1. Tutup Pop-up
                              Navigator.of(context).pop();
                              // 2. Pindah ke Halaman buat nampilim vidio
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                    videoId: movie.trailerId,
                                    title: movie.title,
                                    genre: movie.genre,
                                    sinopsis: movie.sinopsis,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Tonton Trailer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12.0),

                          // TOMBOL 2: Daftar Tontonan (abu / ijo)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: statusWishlistLokal
                                  ? Colors.green
                                  : Colors.grey[700],
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: () {
                              setStatePopUp(() {
                                statusWishlistLokal = !statusWishlistLokal;
                              });
                              onToggleWishlist();
                            },
                            child: Text(
                              statusWishlistLokal
                                  ? 'Hapus dari Daftar Tontonan'
                                  : 'Masukan ke daftar tontonan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // tombol close
                  Positioned(
                    top: -10,
                    left: -10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          onRatingChanged(popUpRating);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // animasi
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      // klik sekali buat nampilin popup
      onTap: () {
        // Panggil PopUp
        _showDetailDialog(
          context,
          widget.movie,
          (newRating) {
            setState(() {
              _currentRating = newRating;
              widget.movie.rating = newRating;
            });
          },
          widget.onToggleWishlist,
          widget.isMovieInWishlist,
        );
      },

      // tampilan kartu film (animasi)
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. poster
              Expanded(
                child: Hero(
                  tag: widget.movie.trailerId,
                  child: Image.network(
                    widget.movie.posterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // judul
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                child: Text(
                  widget.movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // rating (cuma pajangan)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(
                        (index + 1) <= _currentRating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 20.0,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}

class Movie {
  final String title;
  final String posterUrl;
  double rating;
  final String genre;
  final String sinopsis;
  final String trailerId;

  Movie({
    required this.title,
    required this.posterUrl,
    this.rating = 0.0,
    required this.genre,
    required this.sinopsis,
    required this.trailerId,
  });
}
