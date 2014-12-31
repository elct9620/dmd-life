###
# Profile Component
#
# @cjsx React.DOM
###

React = require('react')

ProfileComponent = React.createClass {
  displayName: 'Profile'
  render: ->
    <div className="container">
      Profile
    </div>
}

module.exports = ProfileComponent
