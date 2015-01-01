###
# Router
###

Router = require('react-router')

routes = require('./routes')

router = Router.create {
  routes: routes
  location: Router.HistoryLocation
}

module.exports = router
