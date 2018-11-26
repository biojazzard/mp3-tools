# Render

## Use Case

You want to do a quick rendering of your litcoffee masterpiece, 
potentially with a custom template and stylesheet.

Common enough scenario. 

## Example

> coffee render.coffee.md render.coffee.md

## Code

  fs = require 'fs'
  coffee = require 'coffeescript'

Yep, we require coffee itself.

Pull in optimist for command-line argument handling.

  argv = require('optimist')
    .default('template', 'html.cst')
    .default('style', 'style.css')
    .alias('t', 'template')
    .alias('s', 'style')
    #.demand('f')
    #.alias('f', 'file')
    #.describe('f', 'Load a file')
    .argv
  
OK, let's read and render.

  file = argv.file

## Leer el archivo a renderear.

  read = (file) ->
    fs.readFileSync file, 'utf8'
  
  print = console.log


## Render

+ **file**: es el archivo html plantilla.
+ **data**: es el Markdown leido del archivo.
+ **newfile**: el nombre del archivo ".md" o ".litcoffee" solicitado.

  render = (file, data, newfile) -> 
    text = read(file)
      .toString()
      .replace(/\n/g, '\\n')
      .replace(/"/g, '\\"')
  
    template = coffee.eval '(data) -> "' + text + '"'
    
    html = template data

    fs.writeFile newfile + '.html', html, (err) ->
      if err
        return console.log(err)
      console.log "The file was saved"
      return

  for file in argv._ when file.match /\.(litcoffee|markdown|md)/i
    data =
      md: read file
      css: read argv.style
    render argv.template, data, file


