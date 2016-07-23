_          = require('underscore')
$          = require('jquery')
NixieClock = require('./NixieClock')

$ ->
    window.app = new NixieClock 2
    length = app.getNumLength()

    tmpl = (n)-> "<div class=\"i\" style=\"background-image: url(n/s#{n}.jpg)\" data-n=#{n}></div>"
    $g = $('.g')
    $h = $('.h')
    $m = $('.m')
    $s = $('.s')

    $g.addClass "g-#{length}"

    app.start().progress (time)->
        h = []
        m = []
        s = []

        _.each time.h, (n)-> h.push tmpl n
        _.each time.m, (n)-> m.push tmpl n
        _.each time.s, (n)-> s.push tmpl n

        $h.html h
        $m.html m
        $s.html s
