'use strict';

require('../index.html');
require('./Styles/App.css');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);