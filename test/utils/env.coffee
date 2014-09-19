should = require 'should'
run_mocked = require './run'

defineGlobal = (key, value) ->
  Object.defineProperty global, key, {value}

defineGlobal 'should', should
defineGlobal 'run_mocked', run_mocked

{spawn} = child_process = require 'child_process'

spawn_watched = (cmd, args, opts) ->
  if child_process.spawn is spawn_watched
    spawn.apply @, arguments
  else
    child_process.spawn.apply @, arguments

child_process.spawn = spawn_watched
