# db/seeds.rb

movies = [
  {
    title: "The Shawshank Redemption",
    overview: "Imprisoned in the 1940s for the double murder of his wife and her lover...",
    poster_path: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
    rating: 8.706
  },
  {
    title: "The Godfather",
    overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family...",
    poster_path: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
    rating: 8.69
  },
  {
    title: "The Godfather Part II",
    overview: "In the continuing saga of the Corleone crime family...",
    poster_path: "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
    rating: 8.6
  },
  {
    title: "Schindler's List",
    overview: "The true story of how businessman Oskar Schindler saved over a thousand Jewish lives...",
    poster_path: "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
    rating: 8.565
  },
  {
    title: "12 Angry Men",
    overview: "The defense and the prosecution have rested and the jury is filing into the jury room...",
    poster_path: "/ow3wq89wM8qd5X7hWKxiRfsFf9C.jpg",
    rating: 8.546
  },
  {
    title: "Spirited Away",
    overview: "A young girl, Chihiro, becomes trapped in a strange new world of spirits...",
    poster_path: "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
    rating: 8.537
  },
  {
    title: "Dilwale Dulhania Le Jayenge",
    overview: "Raj is a rich, carefree, happy-go-lucky second generation NRI...",
    poster_path: "/lfRkUr7DYdHldAqi3PwdQGBRBPM.jpg",
    rating: 8.5
  },
  {
    title: "The Dark Knight",
    overview: "Batman raises the stakes in his war on crime...",
    poster_path: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
    rating: 8.516
  },
  {
    title: "Parasite",
    overview: "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks...",
    poster_path: "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
    rating: 8.507
  },
  {
    title: "The Green Mile",
    overview: "A supernatural tale set on death row in a Southern prison...",
    poster_path: "/8VG8fDNiy50H4FedGwdSVUPoaJe.jpg",
    rating: 8.506
  },
  {
    title: "Pulp Fiction",
    overview: "A burger-loving hit man, his philosophical partner...",
    poster_path: "/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg",
    rating: 8.488
  },
  {
    title: "Your Name.",
    overview: "High schoolers Mitsuha and Taki are complete strangers...",
    poster_path: "/vfJFJPepRKapMd5G2ro7klIRysq.jpg",
    rating: 8.5
  },
  {
    title: "The Lord of the Rings: The Return of the King",
    overview: "As armies mass for a final battle that will decide the fate of the world...",
    poster_path: "/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
    rating: 8.481
  },
  {
    title: "Forrest Gump",
    overview: "A man with a low IQ has accomplished great things in his life...",
    poster_path: "/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg",
    rating: 8.473
  },
  {
    title: "The Good, the Bad and the Ugly",
    overview: "While the Civil War rages on, three men search for a strongbox containing $200,000 in stolen gold.",
    poster_path: "/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg",
    rating: 8.462
  },
  {
    title: "GoodFellas",
    overview: "The true story of Henry Hill, a half-Irish, half-Sicilian Brooklyn kid...",
    poster_path: "/aKuFiU82s5ISJpGZp7YkIr3kCUd.jpg",
    rating: 8.461
  },
  {
    title: "Seven Samurai",
    overview: "A samurai answers a village's request for protection...",
    poster_path: "/8OKmBV5BUFzmozIC3pPWKHy17kx.jpg",
    rating: 8.461
  },
  {
    title: "Grave of the Fireflies",
    overview: "In the final months of World War II, two children struggle to survive.",
    poster_path: "/k9tv1rXZbOhH7eiCk378x61kNQ1.jpg",
    rating: 8.457
  },
  {
    title: "Cinema Paradiso",
    overview: "A filmmaker recalls his childhood, when he fell in love with the movies...",
    poster_path: "/gCI2AeMV4IHSewhJkzsur5MEp6R.jpg",
    rating: 8.449
  }
]

movies.each do |movie|
  Movie.find_or_create_by!(title: movie[:title]) do |m|
    m.overview = movie[:overview]
    m.poster_url = "https://image.tmdb.org/t/p/w500#{movie[:poster_path]}"
    m.rating = movie[:rating]
  end
end
