# @cjsx React.DOM

React = require('react')

router = require('./router')

# Run Application
router.run  (Handler, state) ->
  params = state.params
  React.render(<Handler params={params}/>, document.getElementById("app"))
