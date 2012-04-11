# Quick prototype server

Small prototype server, serving `js` and `css` compiled from `coffee` and `stylus` respectively.

This also includes a boilerplate of `require.js` bundled with `jquery`, `backbone` and `underscore`.

## Where to write scripts and styles?

Put `.coffee` in `assets/javascripts/`. Those files will be served from `/javascripts`.

Put `.styl` in `assets/stylesheets/`. Those files will be served from `/stylesheets`. [nib](https://github.com/visionmedia/nib) is also available.

## Quick Start

**Caution:** As this server is running on `express@3.0.0alpha1-pre`, which is not compatible with `2.x` currently distributed as npm package, you might have to install it directly from git. `[line 2 below]`
    
    $ git clone git@github.com:mnmly/quick-prototype-server.git
    $ npm install git://github.com/visionmedia/express.git
    $ npm install .
    $ nodemon app # Running server! go to localhost:3000, and write some files under `assets`
