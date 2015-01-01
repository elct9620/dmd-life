###
# RoomListComponent
#
# @cjsx React.DOM
###

React = require('react')

RoomItem = require('./RoomItemComponent.cjsx')
ChatWidget = require('./ChatWidgetComponent.cjsx')

RoomStore = require('../stores/RoomStore')
RoomActions = require('../actions/RoomActions')

getRooms = ->
  {
    rooms: RoomStore.getAll()
  }

RoomListComponent = React.createClass {
  displayName: "RoomList"
  getInitialState: ->
    getRooms()

  componentDidMount: ->
    RoomStore.addChangeListener @_onChange

  componentWillUnmount: ->
    RoomStore.removeChangeListeher @_onChange

  _onChange: ->
    @setState(getRooms())

  _onInputChange: (e) ->
    @setState { roomName: e.target.value }

  _onSubmit: (e) ->
    e.preventDefault()

    if @state.roomName.length > 0
      RoomActions.create { name: @state.roomName }
      @setState { roomName: '' }

  render: ->

    roomItems = []
    for key, room of @state.rooms
      roomItems.push <RoomItem key={key} info={room} />

    <div className="container">
      <div className="row">
        <div className="col-md-8">
          <div className="row">
            <div className="col-md-12">
              <div className="pull-right">
                <form onSubmit={@_onSubmit} className="form-inline">
                  <div className="form-group">
                    <input type="text" className="form-control" onChange={@_onInputChange} value={@state.roomName} placeholder="房間名稱" />
                    <button type="submit" className="btn btn-primary">創建</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
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
