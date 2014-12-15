class Light
 constructor: ->
  @powered = false
  @el = $('#light')
  @el.click => @toggle()
 powerOn: ->
  @powered = true
  @el.css 'background', 'yellow'
  @
 powerOff: ->
  @powered = false
  @el.css 'background', 'white'
  @
 toggle: ->
  if @powered then @powerOff() else @powerOn()
  @
class Fish
 constructor: (options) ->
  @options = options
  @el = $('<div class="fish">魚</div>')
  @el.css
   'color': @options.color
   'border-color': @options.color
 startMoving: ->
  toRight = left: 10
  toLeft = left: -10
  @el.animate toRight
  @el.animate toLeft, s,  =>
   @startMoving()
  @
 stop: ->
  @el.stop true
  @

class Aquarium
 constructor: ->
  @el = $('#aquarium')
  @fishItems = []
 addFish: (options) ->
  fish = new Fish options
  @el.append fish.el
  @fishItem.push fish
  @
 startAll: ->
  for fish in @fishItems then
  @
 stopAll: ->
  for fish in @fishItems then fish.stop()
  @

$ ->
 light = new Light
 aquarium = new Aquarium
 aquarium.addFish { speed: 200, color: 'red' }
 aquarium.addFish { speed: 300, color: 'orange' }
 aquarium.addFish { speed: 400, color: 'blue' }

 $('#start').click -> aquarium.startAll()
 $('#stop').click -> aquarium.stopAll()
