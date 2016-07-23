_ = require('underscore')
$ = require('jquery')

class NixieClock
    interval: 200

    constructor: (@numeral, @callback)->
        _.extend @, new $.Deferred()
        return @

    start: ->
        @_TO = setInterval =>
            @tick()
        , @interval

        return @

    stop: ->
        clearInterval @_TO
        return @

    tick: ->
        time = @getTime()
        @callback? time
        @notify time
        return time

    getTime: ->
        t = new Date()
        h = @_getNums t.getHours()
        m = @_getNums t.getMinutes()
        s = @_getNums t.getSeconds()
        return {h, m, s}

    getNumLength: ->
        return @_toNumeral(60).length

    _getNums: (n)->
        num = @_toNumeral n
        nums = @_padNumber num
        return nums.split ''

    _padNumber: (number, zeroes)->
        zeroes = @getNumLength() unless zeroes?
        number = number.toString()

        while number.length < zeroes
            number = '0' + number

        return number

    _toNumeral: (num)->
        return num.toString(@numeral)


module.exports = NixieClock
