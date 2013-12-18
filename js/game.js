// Generated by CoffeeScript 1.6.3
(function() {
  var Engine, Handle, Input, Player, Tile, Timers, World, root;

  Handle = (function() {
    function Handle(canvas, bgm, sfx) {
      this.canvas = document.getElementById(canvas);
      this.context = this.canvas.getContext('2d');
      this.bgm = document.getElementById(bgm);
      this.sfx = document.getElementById(sfx);
    }

    Handle.prototype.update = function() {};

    Handle.prototype.clear = function() {
      this.context.fillStyle = 'rgb(0, 64, 0)';
      return this.context.fillRect(0, 0, this.canvas.width, this.canvas.height);
    };

    return Handle;

  })();

  Timers = (function() {
    function Timers() {}

    Timers.prototype.update = function() {};

    return Timers;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  Engine = (function() {
    Engine.prototype.handle = {};

    Engine.prototype.core = {};

    Engine.prototype.objects = {};

    function Engine(canvas, bgm, sfx) {
      this.core.handle = new Handle(canvas, bgm, sfx);
      this.core.timers = new Timers();
      this.core.tile = new Tile();
      this.core.input = new Input();
      this.objects.player = new Player(this.core);
      this.objects.world = new World(this.core);
      this.main(this);
    }

    Engine.prototype.update = function() {
      var i, _results;
      for (i in this.core) {
        this.core[i].update();
      }
      _results = [];
      for (i in this.objects) {
        _results.push(this.objects[i].update(this.core));
      }
      return _results;
    };

    Engine.prototype.draw = function() {
      var i, _results;
      this.core.handle.clear();
      _results = [];
      for (i in this.objects) {
        _results.push(this.objects[i].draw(this.core.handle.context));
      }
      return _results;
    };

    Engine.prototype.main = function(c) {
      var _this = this;
      c.update();
      c.draw();
      return requestAnimationFrame(function() {
        return _this.main(c);
      });
    };

    return Engine;

  })();

  if (!root.Game) {
    root.Game = Engine;
  }

  Player = (function() {
    function Player() {}

    Player.prototype.pos = {};

    Player.prototype.dir = {
      down: 0,
      left: 1,
      up: 2,
      right: 3
    };

    Player.prototype.direction = 0;

    Player.prototype.state = 0;

    Player.prototype.frame = 0;

    Player.prototype.constuctor = function(core) {
      this.pos = {
        x: 0,
        y: 0
      };
      this.state = 0;
      return this.frame = 0;
    };

    Player.prototype.update = function(core) {
      this.setDirection(core.input, 'down');
      this.setDirection(core.input, 'left');
      this.setDirection(core.input, 'up');
      return this.setDirection(core.input, 'right');
    };

    Player.prototype.setDirection = function(input, dir) {
      if (input.keys[input.direction[dir]]) {
        return this.direction = this.dir[dir];
      }
    };

    Player.prototype.draw = function() {
      return console.log(this.direction);
    };

    return Player;

  })();

  World = (function() {
    World.prototype.size = {};

    World.prototype.arr = [];

    World.prototype.tileset = null;

    function World(core) {
      this.size.height = 32;
      this.size.width = 32;
      this.prepare();
      this.tileset = core.tile.loadTileset('iceworld');
    }

    World.prototype.prepare = function() {
      var i, j, x, y, _i, _results;
      this.arr = (function() {
        var _i, _ref, _results;
        _results = [];
        for (i = _i = 0, _ref = this.size.height; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
          _results.push((function() {
            var _j, _ref1, _results1;
            _results1 = [];
            for (j = _j = 0, _ref1 = this.size.width; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
              _results1.push(0);
            }
            return _results1;
          }).call(this));
        }
        return _results;
      }).call(this);
      _results = [];
      for (i = _i = 0; _i <= 20; i = ++_i) {
        x = Math.floor(Math.random() * this.size.width);
        y = Math.floor(Math.random() * this.size.height);
        _results.push(this.arr[x][y] = 4);
      }
      return _results;
    };

    World.prototype.update = function() {};

    World.prototype.draw = function(context) {
      var i, j, _i, _ref, _results;
      _results = [];
      for (i = _i = 0, _ref = this.size.height; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        _results.push((function() {
          var _j, _ref1, _results1;
          _results1 = [];
          for (j = _j = 0, _ref1 = this.size.width; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
            _results1.push(this.drawTile(context, i, j));
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    World.prototype.drawTile = function(context, i, j) {
      return context.drawImage(this.tileset, this.arr[i][j] % this.size.width * 16, this.arr[i][j] / this.size.height * 16, 16, 16, i * 16, j * 16, 16, 16);
    };

    return World;

  })();

  Tile = (function() {
    Tile.prototype.source = {
      iceworld: 'iceworld.png'
    };

    function Tile() {}

    Tile.prototype.update = function() {};

    Tile.prototype.loadTileset = function(name) {
      var img;
      img = new Image();
      img.src = 'img/tile/' + this.source[name];
      return img;
    };

    return Tile;

  })();

  Input = (function() {
    Input.prototype.keys = [];

    Input.prototype.direction = {
      up: 82,
      down: 72,
      left: 83,
      right: 84
    };

    function Input(handle) {
      var i, k, _i;
      for (i = _i = 0; _i <= 255; i = ++_i) {
        this.keys.push(false);
      }
      k = this.keys;
      document.onkeydown = function(e) {
        return k[e.keyCode] = true;
      };
      document.onkeyup = function(e) {
        return k[e.keyCode] = false;
      };
    }

    Input.prototype.update = function() {};

    return Input;

  })();

}).call(this);
