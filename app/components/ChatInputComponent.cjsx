###
# Chat Input Component
#
# @cjsx React.DOM
###

React = require('react')

ChatActions = require('../actions/ChatActions')

ChatInputComponent = React.createClass {
  displayName: 'ChatInput'

  getInitialState: ->
    { message: '' }

  _onChange: (e) ->
    @setState { message: e.target.value }


  _onSubmit: (e) ->
    e.preventDefault()

    ChatActions.send(@state.message)

    @setState { message: '' }

  render: ->
    <div className="fixed-bottom">
      <form onSubmit={@_onSubmit}>
        <div className="form-group">
          <input type="text" onChange={@_onChange} value={@state.message} className="form-control" placeholder="Type something to submit..." />
        </div>
      </form>
    </div>
}

module.exports = ChatInputComponent
