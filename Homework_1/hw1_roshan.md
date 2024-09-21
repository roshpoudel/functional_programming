## Roshan Poudel

#### Homework 1 | CS 326
<br> Written Problems - Collections

# 1

1. How many keys are in the map? List them.

    There are 7 keys in the map:
    1. ```:description```
    1. ```:favicon```
    1. ```:fulltext```
    1. ```:image```
    1. ```:tags```
    1. ```:title```
    1. ```:url```

2. What is the value associated with the key :image?

    "http://ichef.bbci.co.uk/news/1024/cpsprodpb/A4F2/production/_86562224_86562223.jpg"

3. What is the type of this value?

    String

4. What is the value associated with the key :tags?

   ```elixir
        [%{accuracy: 0.7628205128205128, name: "french"},
         %{accuracy: 0.6730769230769231, name: "technical"},
         %{accuracy: 0.6730769230769231, name: "plane"},
         %{accuracy: 0.5384615384615385, name: "bbc"},
         %{accuracy: 0.40384615384615385, name: "newsrussian"},
         %{accuracy: 0.358974358974359, name: "flight"},
         %{accuracy: 0.358974358974359, name: "egypt"},
         %{accuracy: 0.3141025641025641, name: "russian"},
         %{accuracy: 0.3141025641025641, name: "data"},
         %{accuracy: 0.3141025641025641, name: "recorder"}
         ]
    ```

5. What is the type of this value?

    List (containing maps)

6. How many elements are there in the value associated with the key :tags?

    10

7. What type of collection is returned by the function Enum.take? (Hint: use the help facility, h)

    list

8. Without trying to run anything, show the result of running Enum.take resp[:tags] 3

    ```elixir
        [%{accuracy: 0.7628205128205128, name: "french"},
         %{accuracy: 0.6730769230769231, name: "technical"},
         %{accuracy: 0.6730769230769231, name: "plane"}]
    ```

9. What would be the result of running resp[:tags] |> hd |> Enum.count?

    2


# 2.
```elixir
songs = [
  %{
    artist: "The Shadows 'Nepathya'",
    song: "Resham",
    album: "Best of Nepathya",
    length: 300
  },
  %{
    artist: "The Shadows 'Nepathya'",
    song: "Chekyo Chekyo",
    album: "Best of Nepathya",
    length: 340
  },
  %{
    artist: "Adele",
    song: "Hello",
    album: "25",
    length: 295
  },
  %{
    artist: "Coldplay",
    song: "Yellow",
    album: "Parachutes",
    length: 269
  }
]

albums = [
  %{
    artist: "The Shadows 'Nepathya'",
    album: "Best of Nepathya",
    tracks: [
      %{artist: "The Shadows 'Nepathya'", song: "Resham", album: "Best of Nepathya", length: 300},
      %{artist: "The Shadows 'Nepathya'", song: "Chekyo Chekyo", album: "Best of Nepathya", length: 340}
    ]
  },
  %{
    artist: "Adele",
    album: "25",
    tracks: [
      %{artist: "Adele", song: "Hello", album: "25", length: 295},
      %{artist: "Adele", song: "When We Were Young", album: "25", length: 299}
    ]
  },
  %{
    artist: "Coldplay",
    album: "Parachutes",
    tracks: [
      %{artist: "Coldplay", song: "Yellow", album: "Parachutes", length: 269},
      %{artist: "Coldplay", song: "Shiver", album: "Parachutes", length: 300}
    ]
  }
]
```