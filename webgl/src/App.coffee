Rectangle = require("./elements/Rectangle")
DataRectangle = require('./data/rectangles')

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  rows : 5
  columns : 5
  posicionX:0
  posicionY:0
  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    @posicionX= 0
    @posicionY=0
    @build()
    @animate()

  build:=>
    for n in [0..@rows-1]

      for c in [0..@columns-1]
        rectangle = new Rectangle(0xff0000,@posicionX,@posicionY,window.innerWidth/@columns,window.innerHeight/@rows)
        @addAnimationNodes rectangle
        @posicionX= @posicionX+window.innerWidth/@columns
        @stage.addChild(rectangle)
        console.log 'ola'
      @posicionY = @posicionY + window.innerHeight/@rows
      @posicionX = 0

  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()

    null

module.exports = App
