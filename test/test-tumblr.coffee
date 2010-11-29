Tumblr = require "./../lib/tumblr"

tumblr = new Tumblr 'iwdrm'

console.log tumblr.headers()

tumblr.httpRequest (posts) ->
  console.log posts
