# @cjsx React.DOM

React = require('React')

AppComponent = React.createClass {
  displayName: "DMDLife"
  render: ->
    <div className="container">Ready to start!</div>
}

React.render(<AppComponent/>, document.getElementById("app"))
