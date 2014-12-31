###
 * DMD Life
 *
 * @author 蒼時弦也
 * @website http://frost.tw
###

# Config
PORT = process.env.PORT || 3000
ENV = process.env.NODE_ENV || "development"

# Load Library
express = require('express')
livereload = require('express-livereload')

# Initialize Express
app = express()

livereload(app, {
  watchDir: __dirname + '/public'
})

# Setup Express
app.use express.static('public', options: {
  dotfiles: 'ignore'
  etag: true
})

app.get '/*', (req, res) ->
  res.sendFile __dirname + '/public/index.html'

# Start Listing
server = app.listen PORT, ->

  host = server.address().address
  port = server.address().port

  console.log "DMD Life listening at http://%s:%s", host, port

