###
# Room Component
#
# @cjsx React.DOM
###

React = require('react')

Router = require('react-router')

RoomComponent = React.createClass {
  mixins: [Router.State]
  displayName: 'Room'
  render: ->
    <div className="container">
      I am some room, and ID is {@getParams().roomId} ...
    </div>
}

module.exports = RoomComponent
