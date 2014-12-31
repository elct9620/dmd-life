###
# App Component
#
# @cjsx React.DOM
###

React = require('react')

Router = require('react-router')
RouteHandler = Router.RouteHandler

Navigation = require('./NavigationComponent.cjsx')

AppComponent = React.createClass {
  displayName: "DMDLife"
  render: ->
    <div>
      <Navigation />
      <RouteHandler {...@props} />
    </div>
}

module.exports = AppComponent
