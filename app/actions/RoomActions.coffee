###
# Room Action
###

AppDispatcher = require('../AppDispatcher')
RoomConstants = require('../constants/RoomConstants')

RoomActions = {
  create: (roomInfo) ->
    AppDispatcher.handleViewAction {
      actionType: RoomConstants.ROOM_CREATE
      roomInfo: roomInfo
    }
}

module.exports = RoomActions
