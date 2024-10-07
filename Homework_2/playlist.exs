# Author: Roshan Poudel
# Assignment: Homework 2 (Question 7)
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Oct 03, 2024


defmodule PlaylistOps do
  @moduledoc """
  This module contains functions to operate on a collection of songs and albums.
  """

  @spec songs_on_an_album(map()) :: list(String.t())
  @doc """
  Given an album, returns all the songs on that album.
  """
  def songs_on_an_album(album) do
    album[:tracks] |> Enum.map(fn x -> x[:song] end)
  end

  @spec all_artists(list(map())) :: list(String.t())
  @doc """
  Given a collection of songs, returns all the artists in the collection.
  """
  def all_artists(songs) do
    songs |> Enum.map(fn x -> x[:artist] end) |> Enum.uniq()
  end

  @spec album_length(map()) :: map()
  @doc """
  Given an album, returns the length of the album in minutes and seconds.
  """
  def album_length(album) do
    length = album[:tracks] |> Enum.map(fn track -> track[:length] end) |> Enum.sum()
    {minutes, seconds} = {div(length, 60), rem(length, 60)}
    %{minutes: minutes, seconds: seconds}
  end

  @spec print_songs(list(map())) :: nil
  @doc """
  Prints all the information about the collection of songs in a nicely formatted tabular form.
  """
  def print_songs(songs) do
    # Print table header
    IO.puts("Artist                       | Song            | Album             | Length")
    IO.puts(String.duplicate("-", 70))

    # Iterate through each song and print its details
    Enum.each(songs, fn song ->
      :io.format("~s | ~s | ~s | ~2..0B:~2..0B~n", [
        String.pad_trailing(song[:artist], 28),
        String.pad_trailing(song[:song], 15),
        String.pad_trailing(song[:album], 17),
        div(song[:length], 60),
        rem(song[:length], 60)
      ])
    end)
    nil
  end

  @spec print_albums(list(map())) :: nil
  @doc """
  Prints all the information about the collection of albums, including artist, album, and total tracks.
  """
  def print_albums(albums) do
    # Print table header
    IO.puts("Artist                       | Album              | Total Tracks")
    IO.puts(String.duplicate("-", 60))

    # Iterate through each album and print its details
    Enum.each(albums, fn album ->
      :io.format("~s | ~s | ~B~n", [
        String.pad_trailing(album[:artist], 28),
        String.pad_trailing(album[:album], 18),
        length(album[:tracks])
      ])
    end)
    nil
  end
end


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

#----------------------------------------TESTS----------------------------------------

# Test case for songs_on_an_album
IO.puts "\nTesting PlaylistOps.songs_on_an_album"
IO.puts "Expecting [\"Resham\", \"Chekyo Chekyo\"], Actual: #{inspect(PlaylistOps.songs_on_an_album(Enum.at(albums, 0)))}"
IO.puts "Expecting [\"Hello\", \"When We Were Young\"], Actual: #{inspect(PlaylistOps.songs_on_an_album(Enum.at(albums, 1)))}"

# Test case for all_artists
IO.puts "\nTesting PlaylistOps.all_artists"
IO.puts "Expecting [\"The Shadows 'Nepathya'\", \"Adele\", \"Coldplay\"], Actual: #{inspect(PlaylistOps.all_artists(songs))}"

# Test case for album_length
IO.puts "\nTesting PlaylistOps.album_length"
IO.puts "Expecting %{minutes: 10, seconds: 40}, Actual: #{inspect(PlaylistOps.album_length(Enum.at(albums, 0)))}"
IO.puts "Expecting %{minutes: 9, seconds: 54}, Actual: #{inspect(PlaylistOps.album_length(Enum.at(albums, 1)))}"

# Test case for print_songs (no output validation, just checking if function runs)
IO.puts "\nTesting PlaylistOps.print_songs"
IO.puts "Expecting nil, Actual: #{inspect(PlaylistOps.print_songs(songs))}"

# Test case for print_albums (no output validation, just checking if function runs)
IO.puts "\nTesting PlaylistOps.print_albums"
IO.puts "Expecting nil, Actual: #{inspect(PlaylistOps.print_albums(albums))}"
