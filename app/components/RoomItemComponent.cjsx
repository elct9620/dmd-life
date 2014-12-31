###
# Room Item Component
#
# @cjsx React.DOM
###

React = require('react')

Router = require('react-router')
Link = Router.Link

RoomItemComponent = React.createClass {
  displayName: "RoomItem"
  render: ->
    isWaiting = if @props.info.playing then "遊戲中" else "等待中"
    param = { roomId: @props.info.id }
    joinButtonClass = "btn btn-primary"
    joinButtonClass += " disabled" if @props.info.playing

    <div className="col-md-4">
      <div className="panel panel-default">
        <div className="panel-heading">{@props.info.roomName} ( {isWaiting} )</div>
        <div className="panel-body">
          <div>
            <strong>玩家</strong>： {@props.info.roomPlayers} / {@props.info.roomMaxPlayer}
          </div>
          <div className="text-right">
            <Link to="Room" className={joinButtonClass} params={param}>加入</Link>
          </div>
        </div>
      </div>
    </div>
}

module.exports = RoomItemComponent
