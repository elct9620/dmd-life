###
 * DMD Life
 *
 * @author 蒼時弦也
 * @website http://frost.tw
###

# Config
PORT = process.env.PORT || 3000
DEV_PORT = process.env.DEV_PORT || 8080
ENV = process.env.NODE_ENV || "development"

# Load Library
express = require('express')
http = require('http')
browserSync = require('browser-sync')

GameServer = require('./game-server/server')

# Initialize Express
app = express()
http = http.Server(app)

# Setup Express
app.use express.static('public', options: {
  dotfiles: 'ignore'
  etag: true
})

app.get '/*', (req, res) ->
  res.sendFile __dirname + '/public/index.html'

# Setup Game Server
GameServer(http)

# Start Listing
server = http.listen PORT, ->

  host = server.address().address || 'localhost'
  port = server.address().port

  if ENV == 'development'
    browserSync {
      open: false
      proxy: "#{host}:#{port}"
      files: ['public/**/*.{js,css,html}']
      port: DEV_PORT
      namespace: (namespace) ->
        "/#{namespace}"
    }


