#! ./node_modules/coffee-script/bin/coffee

Main entry point for the application.

    express = require 'express'
    app = express()

Compile and cache the html.

    jade = require 'jade'
    html = jade.renderFile('./cv.jade')

Compile and cache the css.

    less = require 'less'
    css = null

    fs = require 'fs'
    lessSrc = fs.readFileSync './styles.less', 'utf8'

    less.render lessSrc, (err, result) ->
      if err then throw err
      css = result

    app.get '*.css', (req, res) ->
      res.send css

    app.get '*', (req, res) ->
      res.send html

    port = process.env.PORT || 5000

    app.listen port, () ->
      console.log 'Server listening on port ' + port
