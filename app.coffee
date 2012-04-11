fs      = require('fs')
express = require("express")
routes  = require("./routes")
http    = require("http")
app     = express()
eco     = require('eco')
coffee  = require('coffee-script')
stylus  = require('stylus')
nib     = require('nib')
path    = require('path')


compile = (str, path) ->
  stylus(str).use nib()

app.configure ->

  app.set "views", __dirname + "/views"
  app.set "view engine", "html"
  app.engine '.html', (path, options, fn)->
    fs.readFile path, 'utf8', (err, str)->
      return fn(err) if err?
      str = eco.render(str)
      fn(null, str)

  app.use stylus.middleware
    src: __dirname + "/assets"
    dest: __dirname + "/public"
    compile: compile

  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.static(__dirname + "/public")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router

app.configure "development", ->
  app.use express.errorHandler()

app.get "/", routes.index

app.get '/javascripts/:script.js', (req, res, next)->
  res.set 'Content-Type', 'application/x-javascript'
  console.log req.params.script
  if path.existsSync "#{__dirname}/public/javascripts/#{req.params.script}.js"
    return next()
  cs = fs.readFileSync "#{__dirname}/assets/javascripts/#{req.params.script}.coffee", "ascii"
  js = coffee.compile cs
  res.send js

http.createServer(app).listen 3000
console.log "Express server listening on port 3000"
