###
# Character List Component
#
# @cjsx React.DOM
###

React = require('react')

CharacterListComponent = React.createClass {
  displayName: 'CharacterList'
  render: ->
    <div className="container">
      Character List
    </div>
}

module.exports = CharacterListComponent
