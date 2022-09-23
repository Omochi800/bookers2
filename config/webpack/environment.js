const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend(
  'provide',
  new webpack.ProvidePlugin({
    $:'jquery/src/jquery',
    jQuery:'jquery/src/jquery',
    Popper:'popper.js'
  })
  )

module.exports = environment
