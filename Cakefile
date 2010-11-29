fs            = require 'fs'
path          = require 'path'
{spawn, exec} = require 'child_process'

# Run a CoffeeScript through our node/coffee interpreter.
run = (args) ->
  proc =         spawn 'coffee', args
  proc.stderr.on 'data', (buffer) -> console.log buffer.toString()
  proc.on        'exit', (status) -> process.exit(1) if status != 0

task 'build', 'build the CoffeeScript language from source', ->
  files = fs.readdirSync 'src'
  files = ('src/' + file for file in files when file.match(/\.coffee$/))
  run ['-c', '-o', 'lib'].concat(files)

task 'test', 'run this shit', ->
  coffee = spawn   'coffee', ['test/test-tumblr.coffee']
  coffee.on        'exit', (status) -> process.exit(1) if status != 0
  coffee.stdout.on 'data', (buffer) -> console.log buffer.toString()
  coffee.stderr.on 'data', (buffer) -> console.log buffer.toString()

