import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie/shared/pop_movies_details_movie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

var moviename = TextEditingController();
List _finall = [];

class _SearchPageState extends State<SearchPage> {
  List movieall = [
    {
      "adult": false,
      "backdrop_path": "/2RSirqZG949GuRwN38MYCIGG4Od.jpg",
      "genre_ids": [53],
      "id": 985939,
      "original_language": "en",
      "original_title": "Fall",
      "overview":
          "For best friends Becky and Hunter, life is all about conquering fears and pushing limits. But after they climb 2,000 feet to the top of a remote, abandoned radio tower, they find themselves stranded with no way down. Now Becky and Hunter’s expert climbing skills will be put to the ultimate test as they desperately fight to survive the elements, a lack of supplies, and vertigo-inducing heights",
      "popularity": 6824.053,
      "poster_path": "/spCAxD99U1A6jsiePFoqdEcY0dG.jpg",
      "release_date": "2022-08-11",
      "title": "Fall",
      "video": false,
      "vote_average": 7.4,
      "vote_count": 753
    },
    {
      "adult": false,
      "backdrop_path": "/1n7ZGr6WeDOW4rFiQKmFel8baWH.jpg",
      "genre_ids": [12, 18, 27],
      "id": 760741,
      "original_language": "en",
      "original_title": "Beast",
      "overview":
          "A recently widowed man and his two teenage daughters travel to a game reserve in South Africa. However, their journey of healing soon turns into a fight for survival when a bloodthirsty lion starts to stalk them.",
      "popularity": 4680.185,
      "poster_path": "/iRV0IB5xQeOymuGGUBarTecQVAl.jpg",
      "release_date": "2022-08-11",
      "title": "Beast",
      "video": false,
      "vote_average": 7.1,
      "vote_count": 389
    },
    {
      "adult": false,
      "backdrop_path": "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg",
      "genre_ids": [16, 878, 28],
      "id": 610150,
      "original_language": "ja",
      "original_title": "ドラゴンボール超 スーパーヒーロー",
      "overview":
          "The Red Ribbon Army, an evil organization that was once destroyed by Goku in the past, has been reformed by a group of people who have created new and mightier Androids, Gamma 1 and Gamma 2, and seek vengeance against Goku and his family.",
      "popularity": 2976.814,
      "poster_path": "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg",
      "release_date": "2022-06-11",
      "title": "Dragon Ball Super: Super Hero",
      "video": false,
      "vote_average": 8,
      "vote_count": 1667
    },
    {
      "adult": false,
      "backdrop_path": "/skL7c4ZhZqo1IFbMcHNrol4fvkc.jpg",
      "genre_ids": [28, 80, 53],
      "id": 921360,
      "original_language": "en",
      "original_title": "Wire Room",
      "overview":
          "New recruit Justin Rosa must monitor arms-smuggling cartel member Eddie Flynn — and keep him alive at all costs. When a SWAT team descends on Flynn’s home, Rosa breaks protocol and contacts the gangster directly to save his life. As gunmen break into the Wire Room and chaos erupts, Mueller and Rosa make a final, desperate stand against the corrupt agents and officials who seek to destroy evidence and kill them both.",
      "popularity": 1981.35,
      "poster_path": "/b9ykj4v8ykjRoGB7SpI1OuxblNU.jpg",
      "release_date": "2022-09-02",
      "title": "Wire Room",
      "video": false,
      "vote_average": 7.2,
      "vote_count": 65
    },
    {
      "adult": false,
      "backdrop_path": "/qaTzVAW1u16WFNsepjCrilBuInc.jpg",
      "genre_ids": [16, 28, 12],
      "id": 539681,
      "original_language": "en",
      "original_title": "DC League of Super-Pets",
      "overview":
          "When Superman and the rest of the Justice League are kidnapped, Krypto the Super-Dog must convince a rag-tag shelter pack - Ace the hound, PB the potbellied pig, Merton the turtle and Chip the squirrel - to master their own newfound powers and help him rescue the superheroes.",
      "popularity": 1635.032,
      "poster_path": "/r7XifzvtezNt31ypvsmb6Oqxw49.jpg",
      "release_date": "2022-07-27",
      "title": "DC League of Super-Pets",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 593
    },
    {
      "adult": false,
      "backdrop_path": "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg",
      "genre_ids": [27, 53],
      "id": 760161,
      "original_language": "en",
      "original_title": "Orphan: First Kill",
      "overview":
          "After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost.",
      "popularity": 1573.405,
      "poster_path": "/wSqAXL1EHVJ3MOnJzMhUngc8gFs.jpg",
      "release_date": "2022-07-27",
      "title": "Orphan: First Kill",
      "video": false,
      "vote_average": 7.1,
      "vote_count": 622
    },
    {
      "adult": false,
      "backdrop_path": "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
      "genre_ids": [16, 12, 35, 14],
      "id": 438148,
      "original_language": "en",
      "original_title": "Minions: The Rise of Gru",
      "overview":
          "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
      "popularity": 1481.2,
      "poster_path": "/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg",
      "release_date": "2022-06-29",
      "title": "Minions: The Rise of Gru",
      "video": false,
      "vote_average": 7.6,
      "vote_count": 1982
    },
    {
      "adult": false,
      "backdrop_path": "/AfvIjhDu9p64jKcmohS4hsPG95Q.jpg",
      "genre_ids": [27, 53],
      "id": 756999,
      "original_language": "en",
      "original_title": "The Black Phone",
      "overview":
          "Finney Blake, a shy but clever 13-year-old boy, is abducted by a sadistic killer and trapped in a soundproof basement where screaming is of little use. When a disconnected phone on the wall begins to ring, Finney discovers that he can hear the voices of the killer’s previous victims. And they are dead set on making sure that what happened to them doesn’t happen to Finney.",
      "popularity": 1243.358,
      "poster_path": "/lr11mCT85T1JanlgjMuhs9nMht4.jpg",
      "release_date": "2022-06-22",
      "title": "The Black Phone",
      "video": false,
      "vote_average": 7.9,
      "vote_count": 2531
    },
    {
      "adult": false,
      "backdrop_path": "/xVbppM1xgbskOKgOuV8fbWBWHtt.jpg",
      "genre_ids": [27, 9648, 878, 53],
      "id": 762504,
      "original_language": "en",
      "original_title": "Nope",
      "overview":
          "Residents in a lonely gulch of inland California bear witness to an uncanny, chilling discovery.",
      "popularity": 1147.904,
      "poster_path": "/AcKVlWaNVVVFQwro3nLXqPljcYA.jpg",
      "release_date": "2022-07-20",
      "title": "Nope",
      "video": false,
      "vote_average": 7,
      "vote_count": 1507
    },
    {
      "adult": false,
      "backdrop_path": "/14QbnygCuTO0vl7CAFmPf1fgZfV.jpg",
      "genre_ids": [28, 12, 878],
      "id": 634649,
      "original_language": "en",
      "original_title": "Spider-Man: No Way Home",
      "overview":
          "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
      "popularity": 1098.544,
      "poster_path": "/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg",
      "release_date": "2021-12-15",
      "title": "Spider-Man: No Way Home",
      "video": false,
      "vote_average": 8,
      "vote_count": 15158
    },
    {
      "adult": false,
      "backdrop_path": "/8wwXPG22aNMpPGuXnfm3galoxbI.jpg",
      "genre_ids": [28, 12, 10751, 35],
      "id": 675353,
      "original_language": "en",
      "original_title": "Sonic the Hedgehog 2",
      "overview":
          "After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test comes when Dr. Robotnik returns, this time with a new partner, Knuckles, in search for an emerald that has the power to destroy civilizations. Sonic teams up with his own sidekick, Tails, and together they embark on a globe-trotting journey to find the emerald before it falls into the wrong hands.",
      "popularity": 913.777,
      "poster_path": "/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg",
      "release_date": "2022-03-30",
      "title": "Sonic the Hedgehog 2",
      "video": false,
      "vote_average": 7.7,
      "vote_count": 3012
    },
    {
      "adult": false,
      "backdrop_path": "/rwgmDkIEv8VjAsWx25ottJrFvpO.jpg",
      "genre_ids": [10749, 18],
      "id": 744276,
      "original_language": "en",
      "original_title": "After Ever Happy",
      "overview":
          "As a shocking truth about a couple's families emerges, the two lovers discover they are not so different from each other. Tessa is no longer the sweet, simple, good girl she was when she met Hardin — any more than he is the cruel, moody boy she fell so hard for.",
      "popularity": 913.358,
      "poster_path": "/6b7swg6DLqXCO3XUsMnv6RwDMW2.jpg",
      "release_date": "2022-08-24",
      "title": "After Ever Happy",
      "video": false,
      "vote_average": 6.4,
      "vote_count": 65
    },
    {
      "adult": false,
      "backdrop_path": "/nYla7faWqM3nLCY9arQH1DwXC84.jpg",
      "genre_ids": [16, 12, 10751],
      "id": 576925,
      "original_language": "ru",
      "original_title": "Buka. My favorite monster",
      "overview":
          "A scandal in the royal family: the wayward princess Barbara escaped from the palace and went through the forest in search of a handsome prince. However, instead of the cherished meeting with her beloved, she is captured by Buka, the most dangerous robber of the kingdom. But it quickly becomes clear that the brisk princess is ready to turn Buka's life into a nightmare, just to reach her goal. So the restless Varvara begins to establish her own order in the forest.",
      "popularity": 815.984,
      "poster_path": "/xIbEHAqwK5N7PJJYmbwmxuvC7fL.jpg",
      "release_date": "2022-01-27",
      "title": "My Sweet Monster",
      "video": false,
      "vote_average": 6,
      "vote_count": 10
    },
    {
      "adult": false,
      "backdrop_path": "/qViFGWCHaSmW4gP00RGh3xjMjsP.jpg",
      "genre_ids": [27, 9648],
      "id": 758724,
      "original_language": "en",
      "original_title": "The Cellar",
      "overview":
          "When Keira Woods' daughter mysteriously vanishes in the cellar of their new house in the country, she soon discovers there is an ancient and powerful entity controlling their home that she will have to face or risk losing her family's souls forever.",
      "popularity": 754.557,
      "poster_path": "/rtfGeS5WMXA6PtikIYUmYTSbVdg.jpg",
      "release_date": "2022-03-25",
      "title": "The Cellar",
      "video": false,
      "vote_average": 6.6,
      "vote_count": 236
    },
    {
      "adult": false,
      "backdrop_path": "/7ABsaBkO1jA2psC8Hy4IDhkID4h.jpg",
      "genre_ids": [28, 12, 14, 878],
      "id": 19995,
      "original_language": "en",
      "original_title": "Avatar",
      "overview":
          "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.",
      "popularity": 738.928,
      "poster_path": "/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg",
      "release_date": "2009-12-10",
      "title": "Avatar",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 26060
    },
    {
      "adult": false,
      "backdrop_path": "/r26Qj2HfAv6rPXzULLpdDWrkwrT.jpg",
      "genre_ids": [53],
      "id": 852448,
      "original_language": "en",
      "original_title": "I Came By",
      "overview":
          "A rebellious young graffiti artist, who targets the homes of the wealthy elite, discovers a shocking secret that leads him on a journey endangering himself and those closest to him.",
      "popularity": 711.896,
      "poster_path": "/856bLLUvEYu3dRDXCCoRE7oxO0V.jpg",
      "release_date": "2022-08-19",
      "title": "I Came By",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 261
    },
    {
      "adult": false,
      "backdrop_path": "/fqw8nJLPRgKRyFSDC0xBsC06NGC.jpg",
      "genre_ids": [28, 12, 14],
      "id": 639933,
      "original_language": "en",
      "original_title": "The Northman",
      "overview":
          "Prince Amleth is on the verge of becoming a man when his father is brutally murdered by his uncle, who kidnaps the boy's mother. Two decades later, Amleth is now a Viking who's on a mission to save his mother, kill his uncle and avenge his father.",
      "popularity": 582.764,
      "poster_path": "/zhLKlUaF1SEpO58ppHIAyENkwgw.jpg",
      "release_date": "2022-04-07",
      "title": "The Northman",
      "video": false,
      "vote_average": 7.2,
      "vote_count": 2376
    },
    {
      "adult": false,
      "backdrop_path": "/pdD47rPAYKVdPasoyhSAFPIFIWo.jpg",
      "genre_ids": [28, 35, 53],
      "id": 718930,
      "original_language": "en",
      "original_title": "Bullet Train",
      "overview":
          "Unlucky assassin Ladybug is determined to do his job peacefully after one too many gigs gone off the rails. Fate, however, may have other plans, as Ladybug's latest mission puts him on a collision course with lethal adversaries from around the globe—all with connected, yet conflicting, objectives—on the world's fastest train.",
      "popularity": 553.439,
      "poster_path": "/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg",
      "release_date": "2022-07-03",
      "title": "Bullet Train",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 830
    },
    {
      "adult": false,
      "backdrop_path": "/ftGzl2GCyko61Qp161bQElN2Uzd.jpg",
      "genre_ids": [28, 53],
      "id": 961484,
      "original_language": "en",
      "original_title": "Last Seen Alive",
      "overview":
          "After Will Spann's wife suddenly vanishes at a gas station, his desperate search to find her leads him down a dark path that forces him to run from authorities and take the law into his own hands.",
      "popularity": 546.989,
      "poster_path": "/qvqyDj34Uivokf4qIvK4bH0m0qF.jpg",
      "release_date": "2022-05-19",
      "title": "Last Seen Alive",
      "video": false,
      "vote_average": 6.6,
      "vote_count": 291
    },
    {
      "adult": false,
      "backdrop_path": "/vjnLXptqdxnpNJer5fWgj2OIGhL.jpg",
      "genre_ids": [28, 53, 80],
      "id": 818397,
      "original_language": "en",
      "original_title": "Memory",
      "overview":
          "Alex, an assassin-for-hire, finds that he's become a target after he refuses to complete a job for a dangerous criminal organization. With the crime syndicate and FBI in hot pursuit, Alex has the skills to stay ahead, except for one thing: he is struggling with severe memory loss, affecting his every move. Alex must question his every action and whom he can ultimately trust.",
      "popularity": 542.927,
      "poster_path": "/4Q1n3TwieoULnuaztu9aFjqHDTI.jpg",
      "release_date": "2022-04-28",
      "title": "Memory",
      "video": false,
      "vote_average": 7.2,
      "vote_count": 788
    },
    {
      "adult": false,
      "backdrop_path": "/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
      "genre_ids": [18, 80],
      "id": 238,
      "original_language": "en",
      "original_title": "The Godfather",
      "overview":
          "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
      "popularity": 107.769,
      "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
      "release_date": "1972-03-14",
      "title": "The Godfather",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 16643
    },
    {
      "adult": false,
      "backdrop_path": "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
      "genre_ids": [18, 80],
      "id": 278,
      "original_language": "en",
      "original_title": "The Shawshank Redemption",
      "overview":
          "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "popularity": 78.591,
      "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
      "release_date": "1994-09-23",
      "title": "The Shawshank Redemption",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 22359
    },
    {
      "adult": false,
      "backdrop_path": "/kGzFbGhp99zva6oZODW5atUtnqi.jpg",
      "genre_ids": [18, 80],
      "id": 240,
      "original_language": "en",
      "original_title": "The Godfather Part II",
      "overview":
          "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.",
      "popularity": 71.632,
      "poster_path": "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
      "release_date": "1974-12-20",
      "title": "The Godfather Part II",
      "video": false,
      "vote_average": 8.6,
      "vote_count": 10064
    },
    {
      "adult": false,
      "backdrop_path": "/vI3aUGTuRRdM7J78KIdW98LdxE5.jpg",
      "genre_ids": [35, 18, 10749],
      "id": 19404,
      "original_language": "hi",
      "original_title": "दिलवाले दुल्हनिया ले जायेंगे",
      "overview":
          "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
      "popularity": 45.611,
      "poster_path": "/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
      "release_date": "1995-10-19",
      "title": "Dilwale Dulhania Le Jayenge",
      "video": false,
      "vote_average": 8.6,
      "vote_count": 3879
    },
    {
      "adult": false,
      "backdrop_path": "/zb6fM1CX41D9rF9hdgclu0peUmy.jpg",
      "genre_ids": [18, 36, 10752],
      "id": 424,
      "original_language": "en",
      "original_title": "Schindler's List",
      "overview":
          "The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.",
      "popularity": 69.404,
      "poster_path": "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
      "release_date": "1993-12-15",
      "title": "Schindler's List",
      "video": false,
      "vote_average": 8.6,
      "vote_count": 13256
    },
    {
      "adult": false,
      "backdrop_path": "/bxSBOAD8AuMHYMdW3jso9npAkgt.jpg",
      "genre_ids": [10751, 18],
      "id": 667257,
      "original_language": "es",
      "original_title": "Cosas imposibles",
      "overview":
          "Matilde is a woman who, after the death of her husband - a man who constantly abused her - finds her new best friend in Miguel, her young, insecure, disoriented and even dealer neighbor",
      "popularity": 13.055,
      "poster_path": "/t2Ew8NZ8Ci2kqmoecZUNQUFDJnQ.jpg",
      "release_date": "2021-06-17",
      "title": "Impossible Things",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 269
    },
    {
      "adult": false,
      "backdrop_path": "/Ab8mkHmkYADjU7wQiOkia9BzGvS.jpg",
      "genre_ids": [16, 10751, 14],
      "id": 129,
      "original_language": "ja",
      "original_title": "千と千尋の神隠し",
      "overview":
          "A young girl, Chihiro, becomes trapped in a strange new world of spirits. When her parents undergo a mysterious transformation, she must call upon the courage she never knew she had to free her family.",
      "popularity": 153.933,
      "poster_path": "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
      "release_date": "2001-07-20",
      "title": "Spirited Away",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 13381
    },
    {
      "adult": false,
      "backdrop_path": "/mMtUybQ6hL24FXo0F3Z4j2KG7kZ.jpg",
      "genre_ids": [10749, 16, 18],
      "id": 372058,
      "original_language": "ja",
      "original_title": "君の名は。",
      "overview":
          "High schoolers Mitsuha and Taki are complete strangers living separate lives. But one night, they suddenly switch places. Mitsuha wakes up in Taki’s body, and he in hers. This bizarre occurrence continues to happen randomly, and the two must adjust their lives around each other.",
      "popularity": 218.335,
      "poster_path": "/q719jXXEzOoYaps6babgKnONONX.jpg",
      "release_date": "2016-08-26",
      "title": "Your Name.",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 9087
    },
    {
      "adult": false,
      "backdrop_path": "/qqHQsStV6exghCM7zbObuYBiYxw.jpg",
      "genre_ids": [18],
      "id": 389,
      "original_language": "en",
      "original_title": "12 Angry Men",
      "overview":
          "The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young Spanish-American is guilty or innocent of murdering his father. What begins as an open and shut case soon becomes a mini-drama of each of the jurors' prejudices and preconceptions about the trial, the accused, and each other.",
      "popularity": 45.404,
      "poster_path": "/ppd84D2i9W8jXmsyInGyihiSyqz.jpg",
      "release_date": "1957-04-10",
      "title": "12 Angry Men",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 6684
    },
    {
      "adult": false,
      "backdrop_path": "/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg",
      "genre_ids": [35, 53, 18],
      "id": 496243,
      "original_language": "ko",
      "original_title": "기생충",
      "overview":
          "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.",
      "popularity": 145.634,
      "poster_path": "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
      "release_date": "2019-05-30",
      "title": "Parasite",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 14448
    },
    {
      "adult": false,
      "backdrop_path": "/jtAI6OJIWLWiRItNSZoWjrsUtmi.jpg",
      "genre_ids": [10749],
      "id": 724089,
      "original_language": "en",
      "original_title": "Gabriel's Inferno: Part II",
      "overview":
          "Professor Gabriel Emerson finally learns the truth about Julia Mitchell's identity, but his realization comes a moment too late. Julia is done waiting for the well-respected Dante specialist to remember her and wants nothing more to do with him. Can Gabriel win back her heart before she finds love in another's arms?",
      "popularity": 21.242,
      "poster_path": "/x5o8cLZfEXMoZczTYWLrUo1P7UJ.jpg",
      "release_date": "2020-07-31",
      "title": "Gabriel's Inferno: Part II",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 1439
    },
    {
      "adult": false,
      "backdrop_path": "/3RMLbSEXOn1CzLoNT7xFeLfdxhq.jpg",
      "genre_ids": [10749, 16],
      "id": 372754,
      "original_language": "ja",
      "original_title": "同級生",
      "overview":
          "Rihito Sajo, an honor student with a perfect score on the entrance exam and Hikaru Kusakabe, in a band and popular among girls, would have never crossed paths. Until one day they started talking at the practice for their school’s upcoming chorus festival. After school, the two meet regularly, as Hikaru helps Rihito to improve his singing skills. While they listen to each other’s voice and harmonize, their hearts start to beat together.",
      "popularity": 13.818,
      "poster_path": "/cIfRCA5wEvj9tApca4UDUagQEiM.jpg",
      "release_date": "2016-02-20",
      "title": "Dou kyu sei – Classmates",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 257
    },
    {
      "adult": false,
      "backdrop_path": "/l6hQWH9eDksNJNiXWYRkWqikOdu.jpg",
      "genre_ids": [14, 18, 80],
      "id": 497,
      "original_language": "en",
      "original_title": "The Green Mile",
      "overview":
          "A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.",
      "popularity": 116.536,
      "poster_path": "/velWPhVMQeQKcxggNEU8YmIo52R.jpg",
      "release_date": "1999-12-10",
      "title": "The Green Mile",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 14431
    },
    {
      "adult": false,
      "backdrop_path": "/w2uGvCpMtvRqZg6waC1hvLyZoJa.jpg",
      "genre_ids": [10749],
      "id": 696374,
      "original_language": "en",
      "original_title": "Gabriel's Inferno",
      "overview":
          "An intriguing and sinful exploration of seduction, forbidden love, and redemption, Gabriel's Inferno is a captivating and wildly passionate tale of one man's escape from his own personal hell as he tries to earn the impossible--forgiveness and love. Watch Here : https://classic-blog.udn.com/mobile/aaef2970/177226755",
      "popularity": 18.998,
      "poster_path": "/oyG9TL7FcRP4EZ9Vid6uKzwdndz.jpg",
      "release_date": "2020-05-29",
      "title": "Gabriel's Inferno",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 2286
    },
    {
      "adult": false,
      "backdrop_path": "/nMKdUUepR0i5zn0y1T4CsSB5chy.jpg",
      "genre_ids": [18, 28, 80, 53],
      "id": 155,
      "original_language": "en",
      "original_title": "The Dark Knight",
      "overview":
          "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",
      "popularity": 92.78,
      "poster_path": "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
      "release_date": "2008-07-14",
      "title": "The Dark Knight",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 28304
    },
    {
      "adult": false,
      "backdrop_path": "/v5CEt88iDsuoMaW1Q5Msu9UZdEt.jpg",
      "genre_ids": [10749, 18],
      "id": 730154,
      "original_language": "ja",
      "original_title": "きみの瞳が問いかけている",
      "overview":
          "A tragic accident lead to Kaori's blindness, but she clings to life and the smaller pleasures it can still afford her. She meets Rui and begins to talk to him. Rui was once a promising kickboxer, but something happened in his past. Kaori's smile brings out a change in Rui. However, the two are connected in more than one way. Rui attempts to do what is right.",
      "popularity": 50.266,
      "poster_path": "/cVn8E3Fxbi8HzYYtaSfsblYC4gl.jpg",
      "release_date": "2020-10-23",
      "title": "Your Eyes Tell",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 353
    },
    {
      "adult": false,
      "backdrop_path": "/aQ7444JX7gefPhGJTlvilj3zG2S.jpg",
      "genre_ids": [10402],
      "id": 553512,
      "original_language": "ko",
      "original_title": "번 더 스테이지: 더 무비",
      "overview":
          "A documentary following the worldwide famous music group BTS, as they tour the world and share their experience along with their beloved band friends and fans.",
      "popularity": 41.392,
      "poster_path": "/pJKy1yvnKh8UjcuYeG3Rt35xHFA.jpg",
      "release_date": "2018-11-15",
      "title": "Burn the Stage: The Movie",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 365
    },
    {
      "adult": false,
      "backdrop_path": "/suaEOtk1N1sgg2MTM7oZd2cfVp3.jpg",
      "genre_ids": [53, 80],
      "id": 680,
      "original_language": "en",
      "original_title": "Pulp Fiction",
      "overview":
          "A burger-loving hit man, his philosophical partner, a drug-addled gangster's moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.",
      "popularity": 69.92,
      "poster_path": "/fIE3lAGcZDV1G6XM5KmuWnNsPp1.jpg",
      "release_date": "1994-09-10",
      "title": "Pulp Fiction",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 23822
    },
    {
      "adult": false,
      "backdrop_path": "/lXhgCODAbBXL5buk9yEmTpOoOgR.jpg",
      "genre_ids": [12, 14, 28],
      "id": 122,
      "original_language": "en",
      "original_title": "The Lord of the Rings: The Return of the King",
      "overview":
          "Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron's forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord's realm.",
      "popularity": 160.06,
      "poster_path": "/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
      "release_date": "2003-12-01",
      "title": "The Lord of the Rings: The Return of the King",
      "video": false,
      "vote_average": 8.5,
      "vote_count": 20235
    }
  ];
  @override
  void initState() {
    _finall = movieall;
    super.initState();
  }

  x(String enterm) {
    var result = [];
    if (enterm.isEmpty) {
      result = movieall;
    } else {
      result = movieall
          .where((element) =>
              element['title'].toLowerCase().contains(enterm.toLowerCase()))
          .toList();
    }
    setState(() {
      _finall = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                
                  style: TextStyle(color: Colors.white),
                  onChanged: ((value) {
                    x(value);
                  }),
                  controller: moviename,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // ignore: prefer_const_constructors
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),

                    label: const Text(
                      'Search ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(children: [
                  Text(
                    "Top Searches",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              Container(

                height: 1000,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _finall.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.grey.shade900,
                                  context: context,
                                  builder: ((context) {
                                    return Container(
                                      height: 280,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    height: 150,
                                                    width: 100,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                                                  _finall[index]
                                                                      [
                                                                      'poster_path'],
                                                          placeholder: (context,
                                                                  url) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                        ))),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          _finall[index]
                                                              ['title'],
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  1.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 40,
                                                        ),
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.grey
                                                                  .shade800,
                                                          child: IconButton(
                                                              onPressed: (() =>
                                                                  Navigator.pop(
                                                                      context)),
                                                              icon: Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white,
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              bottom: 5,
                                                              top: 5),
                                                      child: Text(
                                                        'Pg 13  ' +
                                                            _finall[index][
                                                                    'release_date']
                                                                .toString() +
                                                            '   HD',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            letterSpacing: 1.2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                    Text(
                                                      _finall[index]['overview']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .grey.shade50,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                      maxLines: 7,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: (() {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  ((context) =>
                                                                      PopMovieDetails(
                                                                        id: _finall[index]
                                                                            [
                                                                            'id'],
                                                                        image: 'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                                                            _finall[index]['poster_path'],
                                                                        title: _finall[index]
                                                                            [
                                                                            'title'],
                                                                        date: _finall[index]
                                                                            [
                                                                            'release_date'],
                                                                        overview:
                                                                            _finall[index]['overview'],
                                                                      ))));
                                                    }),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey.shade50,
                                                      child: Icon(
                                                        Icons.play_arrow,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Play',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey.shade800,
                                                    child: Icon(
                                                      Icons.share_sharp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Share',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey.shade800,
                                                    child: Icon(
                                                      Icons.download,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    'Download',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey.shade800,
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'My List',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: .2,
                                            width: double.infinity,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            height: 20,
                                            width: double.infinity,
                                            child: Row(children: [
                                              Icon(
                                                Icons.info,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'info',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ]),
                                          )
                                        ],
                                      ),
                                    );
                                  }));
                            },
                            child: Container(
                              height: 60,
                              color: Colors.grey.shade900,
                              child: ListTile(
                                leading: Container(
                                  width: 100,
                                  height: 70,
                                  child: CachedNetworkImage(
                                    width: 100,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                    imageUrl:
                                        'https://images.moviemeter.nl/tmdb/t/p/original/' +
                                            _finall[index]['poster_path'],
                                    placeholder: (context, url) => Stack(
                                      alignment: Alignment.center,
                                      children: [CircularProgressIndicator()],
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _finall[index]['title'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ));
                    })),
              ),
            ],
          ),
        )));
  }
}
