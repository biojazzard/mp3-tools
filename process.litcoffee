# Process Wav to mp3 Files

  fs = require 'fs'
  _ = require 'underscore'

  Lame = require('node-lame').Lame;

###
# musicmetadata get ID3 Tags
###
  
  mm = require 'musicmetadata'

###
# jsome Beautyful json
###

  jsome = require 'jsome'

###
# Spinners
###

  cliSpinners = require 'cli-spinners'

###
# Show Images in the cli.
###

  pictureTube = require('picture-tube')
  tube = pictureTube()
  tube.pipe(process.stdout)

  fs.createReadStream('win.png').pipe(tube);

###
# Config
###

  config =
    src: 'wav'
    mp3: 'mp3'
    cd: 'mp3-192'
    artwork: 'artwork/artwork.png'

  app =
    msg:
      success: ' | === > | File Created | OK'

  audio = []
  render = []

  _log = (msg) ->
    console.log msg

  ora = require('ora');

  spinner = ora('MP3 from Wav Files:::')

  #spinner.start();

###
# Process It!.  
###

  audioFiles = fs.readdir config.src, (err, files) ->
    throw err if err
    _.each files, processFile
    _.each files, processIt
    #_.each files, _log

  processFile = (elem, ind, list) ->
    if elem == '.DS_Store'
      list.splice ind, 1
      #fileStats = fs.Stats config.src + '/' + file, (err, stats) ->

  processIt = (elem, ind, list) ->

    spinner.spinner = cliSpinners.dots
    spinner.color = 'yellow'
    spinner.text = 'Loading rainbows' + elem
    spinner.start()

    audio =
      source: config.src + '/' + elem
    render =
      file: config.mp3 + '/' + elem + '.mp3'

    title = elem.replace('.wav', '').replace(config.mp3 + '/', '')

    encoder = new Lame
      output: render.file
      cbr: true
      bitrate: 96
      meta:
        title: title
        artist: "MARIA"
        album: "Número UNO"
        year: "2018"
        track: ind + 1
        genre: 13
        artwork: config.artwork
    .setFile audio.source
      
    encoder.encode().then ->
      # Encoding finished
      # Read ID3
      fileStream = fs.createReadStream(encoder.progressedFilePath)

      parser = mm fileStream, (err, metadata) ->
        if err
          throw err

        ###
        # Beautyful json with jsome
        ### 
        #jsome.level.show = false
        #jsome metadata.title
        
        return

Parar el Spinner:

      spinner.stop()

      return
    .catch (error) ->
      # Something went wrong
      return
