###
# Router Define
###

React = require('react')

# Router
Router = require('react-router')

Route = Router.Route
DefaultRoute = Router.DefaultRoute
NotFoundRoute = Router.NotFoundRoute

# Components
App = require('./components/AppComponent.cjsx')
RoomList = require('./components/RoomListComponent.cjsx')
CharacterList = require('./components/CharacterListComponent.cjsx')
Profile = require('./components/ProfileComponent.cjsx')
Room = require('./components/RoomComponent.cjsx')

module.exports = (
  <Route name="App" path="/" handler={App}>
    <DefaultRoute handler={RoomList} />
    <Route name="CharacterList" handler={CharacterList} />
    <Route name="Profile" handler={Profile} />
    <Route name="Room" path="Room/:roomId" handler={Room} />
  </Route>
)
