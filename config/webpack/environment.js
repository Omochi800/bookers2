const { environment } = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $:'jquery/src/jquery',
    jQuery:'jquery/src/jquery',
    Popper:'popper.js'
  })
)

module.exports = environment
