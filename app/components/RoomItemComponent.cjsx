###
# Room Item Component
#
# @cjsx React.DOM
###

React = require('react')

Router = require('react-router')
Link = Router.Link
RoomActions = require('../actions/RoomActions')

RoomItemComponent = React.createClass {
  displayName: "RoomItem"
  _handleJoin: (e)->
    e.preventDefault()

    RoomActions.join(@props.info.id)


  render: ->
    isWaiting = if @props.info.playing then "遊戲中" else "等待中"
    param = { roomId: @props.info.id }
    joinButtonClass = "btn btn-primary"
    joinButtonClass += " disabled" if @props.info.playing

    players = @props.info.players.length

    <div className="col-md-6">
      <div className="panel panel-default">
        <div className="panel-heading">{@props.info.name} ( {isWaiting} )</div>
        <div className="panel-body">
          <div>
            <strong>房主</strong>：{@props.info.host.nickname}
          </div>
          <div>
            <strong>玩家</strong>： {players} / {@props.info.maxPlayer}
          </div>
          <div className="text-right">
            <Link to="Room" className={joinButtonClass} params={param} onClick={@_handleJoin}>加入</Link>
          </div>
        </div>
      </div>
    </div>
}

module.exports = RoomItemComponent
