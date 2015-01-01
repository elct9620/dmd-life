###
# Chat Actions
###

AppDispatcher = require('../AppDispatcher')
ChatConstants = require('../constants/ChatConstants')

ChatActions = {
  send: (message) ->
    AppDispatcher.handleViewAction {
      actionType: ChatConstants.MESSAGE_CREATE
      message: message
    }
}

module.exports = ChatActions
