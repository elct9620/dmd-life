###
# RoomListComponent
#
# @cjsx React.DOM
###

React = require('react')

RoomItem = require('./RoomItemComponent.cjsx')
ChatWidget = require('./ChatWidgetComponent.cjsx')

# TODO: Fetch room list from server
rooms = [
  {id: 1, roomName: 'Test Room 01', roomMaxPlayer: 6, roomPlayers: 4, playing: true}
  {id: 2, roomName: 'Test Room 02', roomMaxPlayer: 4, roomPlayers: 1}
  {id: 3, roomName: 'Test Room 03', roomMaxPlayer: 5, roomPlayers: 4, playing: true}
  {id: 4, roomName: 'Test Room 04', roomMaxPlayer: 6, roomPlayers: 3, playing: true}
  {id: 5, roomName: 'Test Room 05', roomMaxPlayer: 4, roomPlayers: 2}
]


RoomListComponent = React.createClass {
  displayName: "RoomList"
  render: ->

    roomItems = []
    for room, key in rooms
      roomItems.push <RoomItem key={key} info={room} />

    <div className="container">
      <div className="row">
        <div className="col-md-8">
          <div className="row">
            {roomItems}
          </div>
        </div>
        <div className="col-md-4">
          <ChatWidget className="chat-widget" />
        </div>
      </div>
    </div>
}

module.exports = RoomListComponent
