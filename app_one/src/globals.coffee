

window.c = console.log.bind console
window._ = require 'lodash'
window.React = require 'react'
c "React.version:", React.version
window.create_react_class = require 'create-react-class'
window.React_DOM = require 'react-dom'
window.react_dom_factories = require 'react-dom-factories'
window.shortid = require 'shortid'
window.key_mirror = require 'keymirror'
{ connect: window.connect } = require 'react-redux'
window.Imm = require 'immutable'
window.primus = new Primus('http://localhost:2223')


window.debounce = (fn, wait, immediate) ->
    timeout = 'scoped here'
    ->
        context = @
        args = arguments
        later = ->
            timeout = null
            if not(immediate) then fn.apply(context, args)
        callNow = immediate and not(timeout)
        clearTimeout timeout
        timeout = setTimeout(later, wait)
        if callNow then fn.apply(context, args)

window.rr = -> React.createFactory(React.createClass.apply(React, arguments))
window.rr = -> React.createFactory(create_react_class.apply(React, arguments))


window.rc = -> React.createFactory.apply(React, arguments)


dom_stuff = {
p, form, strong, pre, div, h1, h2, h3, h4, h5, h6, span, svg, circle,
tspan, rect, ul, line, li, ol, code, a, input, defs, clipPath,
body, linearGradient, stop, g, path, d, polygon, image, pattern,
filter, feBlend, feOffset, polyline, feGaussianBlur, feBlend, feMergeNode,
feMerge, radialGradient, foreignObject, text, textArea, ellipse,
pattern, thead, th, tr, tbody
} = react_dom_factories

for k, v of dom_stuff
    window[k] = v

for item in ['textArea', 'filter', 'foreignObject', 'feGaussianBlur', 'feImage', 'feOffset', 'feMerge', 'feMergeNode', 'feBlend', 'feComponentTransfer', 'feFuncR', 'feFuncG', 'feFuncB', 'feComposite']
    window[item] = React.createFactory item

window.assign = _.assign
window.keys = _.keys
window.includes = _.includes
window.map = _.map
window.reduce = _.reduce


window.get_abs_val_open = (fig_raw) ->
    { ww , wh } = @props
    ratio_zzz = fig_raw / 1366
    ratio_zzz * ww
