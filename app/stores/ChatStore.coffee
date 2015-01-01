###
# Chat Message Store
###

AppDispatcher = require('../AppDispatcher')
EventEmitter = require('events').EventEmitter
ChatConstants = require('../constants/ChatConstants')

assign = require('react/lib/Object.assign')

CHANGE_EVENT = 'change'

socket = io('/game')
socket.emit('chat:refresh')

_messages = []

socket.on 'chat:refresh', (data) ->
  _messages = data
  ChatStore.emitChange()

create = (message) ->
  socket.emit('chat:message', {message: message})

dispatcher = (payload) ->
    action = payload.action
    message = ""

    switch action.actionType
      when ChatConstants.MESSAGE_CREATE

        message = action.message.trim()
        create(message)

      #when ChatConstants.MESSAGE_DESTORY
        # Do nothing

    return true


ChatStore = assign {}, EventEmitter.prototype, {
  getAll: ->
    _messages

  emitChange: ->
    @emit(CHANGE_EVENT)

  addChangeListener: (callback) ->
    @on(CHANGE_EVENT, callback)

  removeChangeListeher: (callback) ->
    @removeListener(CHANGE_EVENT, callback)

  dispatcherIndex: AppDispatcher.register( dispatcher )
}

module.exports = ChatStore
