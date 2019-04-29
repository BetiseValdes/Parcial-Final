class Rectangle extends PIXI.Graphics
    interactive : true
    buttonmode : true
    flag: false
    pause: false
    constructor:(color, x,y,w,h) ->
      super()
      @on "mouseover", @onMouseOver
      #@on "mouseout", @onMouseOut
      @posX = x
      @posY = y
      @color = color
      @w = w
      @h = h
      @draw()
  

    draw:=>
      @lineStyle(3, 0xFEEB77, 1)
      @beginFill(@color)
      @drawRect(0, 0, @w, @h)
      @endFill()
      @y=@posY
      @x=@posX

    onMouseOver:=>
      @flag = true
      console.log 'me doy vuelta'
    
    animate:=>
      if @flag is true
        if @pause is true
          @scale.x += 0.05
          @x -= 30
        else
          @scale.x -= 0.05
          @x += 30
        if @scale.x <= 0
          @pause = true
        if @scale.x == 1
          @flag = false
          @pause = false
        
      
module.exports = Rectangle
