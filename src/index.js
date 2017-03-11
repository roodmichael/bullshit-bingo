'use strict';

require('../index.html');
require('./Styles/index.scss');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);