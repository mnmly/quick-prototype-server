require.config
  baseUrl: 'javascripts'
  paths:
    backbone: 'libs/backbone-min'
    underscore: 'libs/underscore-min'
    jquery: 'libs/jquery-1.7.2.min'

  use:
    underscore:
      attach: "_"

    backbone:
      deps: [ "use!underscore", "jquery" ]
      attach: (_, $) ->
        Backbone

require [
  'app'
], (App)->
  new App
