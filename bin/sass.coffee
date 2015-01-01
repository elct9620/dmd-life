###
# Sass Compiler
#
# Improve node-sass command line "Watch" didn't ignore partial file
###

fs = require('fs')
chalk = require('chalk')
gaze = require('gaze')
sass = require('node-sass')

render = (file)->
  outFile = './public/css/app.css'
  mapFile = outFile + '.map'

  sass.render {
    file: './sass/app.scss'
    outFile: outFile
    includePaths: ['./bourbon']
    sourceMap: 'app.css.map'
    success: (css, map) ->
      console.warn(chalk.green('Rendering Complete, saving .css file ...'))

      fs.writeFile(outFile, css, (err) ->
        if err
          console.error(chalk.red('Error' + err))

        console.warn(chalk.green('Wrote CSS to ' + outFile));
      )

      fs.writeFile(mapFile, map, (err) ->
        if err
          console.error(chalk.red('Error' + err))

        console.warn(chalk.green('Wrote Source Map to ' + mapFile));
      )
  }


gaze 'sass/**/*.scss', (err, watcher) ->

  @on 'changed', (file) ->
    render(file)

