// Define the Logger mixin
mixin Logger {
  void logDebug(String message) {
    print('DEBUG: $message');
  }

  void logInfo(String message) {
    print('INFO: $message');
  }

  void logWarning(String message) {
    print('WARNING: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

// Define the abstract class MediaItem
abstract class MediaItem {
  String title;
  String artist;

  MediaItem(this.title, this.artist);
}

// Define the interface Playable
abstract class Playable {
  void play();
}

// Define the concrete class Song
class Song extends MediaItem with Logger implements Playable {
  Song(String title, String artist) : super(title, artist);

  @override
  void play() {
    logInfo('Playing song: $title by $artist');
    // Add logic to play the song
  }
}

// Define the concrete class Album
class Album extends MediaItem with Logger {
  List<Song> songs;

  Album(String title, String artist, this.songs) : super(title, artist);

  void listSongs() {
    logInfo('Songs in album $title by $artist:');
    for (var song in songs) {
      logInfo('${song.title} by ${song.artist}');
    }
  }
}

// Define the concrete class Playlist
class Playlist extends MediaItem with Logger {
  List<MediaItem> items;

  Playlist(String title, String artist, this.items) : super(title, artist);

  void listItems() {
    logInfo('Items in playlist $title by $artist:');
    for (var item in items) {
      logInfo('${item.title} by ${item.artist}');
    }
  }
}

void main() {
  // Example usage
  var song = Song('Shape of You', 'Ed Sheeran');
  var album = Album('Divide', 'Ed Sheeran', [song]);
  var playlist = Playlist('My Favorites', 'Various Artists', [song, album]);

  song.play();
  album.listSongs();
  playlist.listItems();
}
