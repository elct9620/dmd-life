###
# Navigation Component
#
# @cjsx React.DOM
###

React = require('react')

Router = require('react-router')
Link = Router.Link

NavigationComponent = React.createClass {
  displayName: 'Navigation'
  render: ->
    <div className="navbar navbar-inverse navgar-fixed-top">
      <div className="container">
        <div className="navbar-header">
          <Link to="App" className="navbar-brand">數媒人生 Online</Link>
        </div>
        <ul className="nav navbar-nav navbar-right">
          <li><Link to="App">房間列表</Link></li>
          <li><Link to="CharacterList">角色列表</Link></li>
          <li><Link to="Profile">個人資料</Link></li>
        </ul>
      </div>
    </div>
}

module.exports = NavigationComponent
