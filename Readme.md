

# Lame

## Wav to mp3

    $ for file in *.wav; do lame --preset standard "$file" "${file%.*}".mp3; done

## Re-encode for streaming [CBR]

    $ lame --preset cbr 112 SONG.mp3 SONG.mp3

## ID3 Tags con id3lib

### Install

    $ brew install id3lib

Help: `id3lib -h`

    Usage: id3tag [OPTIONS]... [FILES]...
    -h         --help            Print help and exit
    -V         --version         Print version and exit
    -1         --v1tag           Render only the id3v1 tag (default=off)
    -2         --v2tag           Render only the id3v2 tag (default=off)
    -aSTRING   --artist=STRING   Set the artist information
    -ASTRING   --album=STRING    Set the album title information
    -sSTRING   --song=STRING     Set the title information
    -cSTRING   --comment=STRING  Set the comment information
    -CSTRING   --desc=STRING     Set the comment description
    -ySTRING   --year=STRING     Set the year
    -tSTRING   --track=STRING    Set the track number
    -TSTRING   --total=STRING    Set the total number of tracks
    -gSHORT    --genre=SHORT     Set the genre
    -w         --warning         Turn on warnings (for debugging) (default=off)
    -n         --notice          Turn on notices (for debugging) (default=off)

### Usar id3lib

Initialize:

    for file in *.mp3; do id3tag $file; done

Usual Tags:

    for file in *.mp3; do id3tag --artist=ARTIST $file; done
    for file in *.mp3; do id3tag --album="ALBUM NAME" $file; done
    for file in *.mp3; do id3tag --song="${file%.*}" $file; done
    for file in *.mp3; do id3tag --year=YEAR $file; done
    for file in *.mp3; do id3tag --desc="http://band-name.com/" $file; done

Special Tags:

POP es genero [13](https://en.wikipedia.org/wiki/ID3#ID3v2):

    for file in *.mp3; do id3tag --genre=13 $file; done

Track Numbers:

    a=0;for file in *.mp3; do a=`expr $a + 1`;id3tag --track="${a}" $file; done
    for file in *.mp3; do id3tag --total=TOTAL_SONGS $file; done
