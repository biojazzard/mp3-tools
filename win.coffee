###
# @namespace ffmpeg | recipes
#
# @author Alfredo Llanos <alfredo@tallerdelsoho.es> || @biojazzard
###

fs = require 'fs'

jsome = require 'jsome'

Lame = require('node-lame').Lame;

pictureTube = require('picture-tube')
tube = pictureTube()
tube.pipe(process.stdout)
 
fs.createReadStream('win.png').pipe(tube);