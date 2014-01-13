fs = require 'fs'

module.exports = (app) ->

  # Recreational over-optimizaiton: Inline All The Things!
  CSS_TAG = fetchCSSSync 'style.css'
  GITHUB_ICON64 = fetchImage64Sync 'github.png'

  app.get '/', (req, res) ->
    res.render 'index', {CSS_TAG, GITHUB_ICON64}


fetchCSSSync = (filename) ->
  css = fs.readFileSync("#{__dirname}/assets/css/#{filename}").toString()
  """<style type="text/css">#{css}</style>"""


fetchImage64Sync = (filename) ->
  data = fs.readFileSync "#{__dirname}/assets/images/#{filename}"
  "data:image/png;base64,#{data.toString 'base64'}"
