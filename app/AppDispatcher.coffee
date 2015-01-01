###
# Application Dispatcher
###

Dispatcher = require('flux').Dispatcher

class AppDispatcher extends Dispatcher
  handleViewAction: (action) ->
    @dispatch {
      source: 'VIEW_ACTION'
      action: action
    }

module.exports = new AppDispatcher
