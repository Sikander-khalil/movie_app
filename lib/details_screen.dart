import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant.dart';

import 'movie_model.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(

        slivers: [

          SliverAppBar.large(

            leading: Container(

              height: 70,
              width: 70,
              margin: EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(

                color: Colors.black,
                borderRadius: BorderRadius.circular(8),

              ),
              child: IconButton(

                onPressed: (){

                  Navigator.pop(context);


                },
                icon: Icon(Icons.arrow_back,color: Colors.white,),
              ),
            ),

            backgroundColor: Colors.black,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(

              title: Text(movie.title),
              background: Image.network(

                  '${Constant.imagePath}${movie.backDropPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,


              ),
            ),




          ),
          SliverToBoxAdapter(

            child: Padding(padding: EdgeInsets.all(12),


              child: Column(
                children: [

                  Text("Overview",style: TextStyle(fontSize: 19),),
                  SizedBox(height: 16,),

                  Text(movie.overview,style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.justify,

                  ),
                  SizedBox(height: 16,),

                  SizedBox(child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue)
                        ),
                        child: Row(children: [
                          Text("Release Date ", style: TextStyle(fontSize: 17),),
                          Text(movie.releaseDate, style: TextStyle(fontSize: 17),),

                        ],),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue)
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Rating: ",
                              style: TextStyle(fontSize: 17),
                            ),
                            Icon(Icons.star,
                            color: Colors.amber,),
                            Text('${movie.voteAverage.toStringAsFixed(1)}/10')
                          ],
                        ),
                      )



                    ],),
                  ),)

                ],
              ),
          )



          )

        ],
      )

    );
  }
}
