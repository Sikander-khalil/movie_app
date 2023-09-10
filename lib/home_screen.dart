import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api_service.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/details_screen.dart';

import 'movie_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    late Future<List<Movie>> trendingMovies;
    late Future<List<Movie>> topRatedMovies;
    late Future<List<Movie>> upcomingMovies;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpComingMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          'Movie-db'.toUpperCase(),style: TextStyle(fontSize: 19),

        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(

        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Trending Movie",style: TextStyle(fontSize: 19),),
              SizedBox(height: 32,),
              SizedBox(child: FutureBuilder(
                future: trendingMovies,
                builder: (context,snapshot){

                  if(snapshot.hasError){

                    return Center(child: Text(snapshot.error.toString()),);
                  }else if(snapshot.hasData){


                    return SizedBox(width: double.infinity,

                      child: CarouselSlider.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, itemIndex, pageViewIndex){


                            return InkWell(
                              onTap: (){
                                
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: snapshot.data![itemIndex])));


                              },
                              child: Container(
                                width: 300,
                                height: 300,
                                color: Colors.amber,
                                child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  '${Constant.imagePath}${snapshot.data![itemIndex].posterPath}'
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(

                            height: 300,
                            autoPlay: true,
                            viewportFraction: 0.55,
                            enlargeCenterPage: true,
                            pageSnapping: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration: const Duration(seconds: 2),
                          )),

                    );

                  }else{
                    return Center(child: CircularProgressIndicator());

                  }




                },


              ),),

              SizedBox(height: 32,),
              Text("Top Rated Movies",style: TextStyle(fontSize: 19),),
              SizedBox(child: FutureBuilder(
                future: topRatedMovies,
                builder: (context,snapshot){

                  if(snapshot.hasError){

                    return Center(child: Text(snapshot.error.toString()),);
                  }else if(snapshot.hasData){


                    return SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){

                            return InkWell(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: snapshot.data![index])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.amber,
                                  height: 200,
                                  width: 200,
                                  child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${Constant.imagePath}${snapshot.data![index].posterPath}'


                                  ),
                                ),
                              ),
                            );



                          }),
                    );

                  }else{
                    return Center(child: CircularProgressIndicator());

                  }




                },


              ),),

              SizedBox(height: 32,),
              Text("Upcoming Movies",style: TextStyle(fontSize: 19),),
              SizedBox(child: FutureBuilder(
                future: upcomingMovies,
                builder: (context,snapshot){

                  if(snapshot.hasError){

                    return Center(child: Text(snapshot.error.toString()),);
                  }else if(snapshot.hasData){


                    return SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){

                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: snapshot.data![index])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.amber,
                                  height: 200,
                                  width: 200,
                                  child: Image.network(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      '${Constant.imagePath}${snapshot.data![index].posterPath}'


                                  ),
                                ),
                              ),
                            );



                          }),
                    );




                  }else{
                    return Center(child: CircularProgressIndicator());

                  }




                },


              ),),


            ],
          ),
        ),
      )
    );
  }


}
