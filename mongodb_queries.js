
/*
Author:				Mathapelo Motloung
Date: 				2019-02-14
Filename:			mongodb_queries.js
File description: 	Create and maintain records to manage movies faster 
*/

//create database
use store

//create collection
db.createCollection("movie")

//add movies to database
db.movie.insertMany([
   { title: "Glass", genre:"Thriller",year_released:"2019",language:"English",movie_length:"129m"  },
   { title: "Aqua Man", genre:"Fantasy/Science Fiction ",year_released:"2019", language:"English",movie_length:"142m"},
   { title: "A Star is Born", genre:"Drama/Romanc",year_released:"2018", language:"English", movie_length:"134m" },
   { title: "Bird Box", genre:" Drama/Thriller",year_released:"2018",language:"English", movie_length:"124m"  },
   { title: "Bohemian Rhapsody", genre:"Drama/Biography",year_released:"2018",language:"English", movie_length:"133m" }
])

//find movies by genre
db.movie.find({genre: "Thriller"})

//select all rows
db.movie.find().pretty()

//find specific movie
db.movie.findOne({title: "Glass"})

//delete specific movie
db.movie.deleteOne({title: "Bird Box"})

//Update movie title
db.movie.update({"title":"Glass"},{$set:{"title":"Woods"}})

//delete collection
db.movie.drop()

