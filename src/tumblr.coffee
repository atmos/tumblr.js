URL   = require('url')
HTTP  = require('http')

class Tumblr
  constructor: (subdomain) ->
    @host  = "#{subdomain}.tumblr.com"
    @posts = [ ]

  headers: ->
    { 'Host' : @host }

  httpClient: ->
    HTTP.createClient(80, @host)

  httpRequest: (callback) ->
    req  = @httpClient().request('GET', '/api/read/json?&type=photo', @headers())
    self = this
    data = ''

    req.on 'error', (err) ->
      console.log("Request Error")

    req.addListener 'response', (resp) ->
      resp.on 'error', (err) ->
        console.log("Response Error")

      resp.addListener 'data', (chunk) ->
        data += chunk
      resp.addListener 'end', ->
        switch resp.statusCode
          when 200
            eval(data)
            @posts + tumblr_api_read.posts
            callback(tumblr_api_read.posts)
          when 503
            self.httpRequest(callback)
          else
            console.log resp.statusCode

    req.end()

# vim: ft=coffee
