# @cjsx React.DOM

React = require('React')
Router = require('react-router')

routers = require('./router')

Router.run routers, Router.HistoryLocation, (Handler, state) ->
  params = state.params
  React.render(<Handler params={params}/>, document.getElementById("app"))
