require 'ruby2d'

set width: 800, height: 600
MOUNTAIN_SPEED = 1.1/6
RUN_SPEED = 3

sky = Image.new(
    'assets/background/layer-1-sky.png',
    x: 0, y: 0,
    width: 1000, height: 600
  )
mountain = Image.new(
    'assets/background/layer-2-mountain.png',
    x: 0, y: 0,
    width: 1000, height: 600,
  )
ground = Image.new(
    'assets/background/layer-3-ground.png',
    x: 0, y: 0,
    width: 1000, height: 600,
  )

dog = Sprite.new(
    './assets/dog-full.png',
    width: 92,
    height: 54,
    clip_width: 46, 
    time:200,
    y: 470,
    x:300, 
    animations: {
        walk: 1..3,
        stand: 4..5,
      }
    )

    on :key_held do |event|
      case event.key
        when 'a'
          dog.play animation: :walk, loop: true

            if dog.x > 0
              dog.x -= RUN_SPEED
            else
              if ground.x < 0
                ground.x += RUN_SPEED
              end
            end
        when 'd'
          dog.play animation: :walk, loop: true, flip: :horizontal
          
          if dog.x < (Window.width - dog.width)
            dog.x += RUN_SPEED
          else
            if (ground.x - Window.width) > -ground.width
            ground.x -= RUN_SPEED
            mountain.x -= MOUNTAIN_SPEED
            end
          end
        end
    end

    on :key_up do
      dog.play animation: :stand, flip: :horizontal
      dog.stop
    end


# Coins
# coin = Sprite.new(
#   './assets/coin.png',
#   clip_width: 16,
#   time: 200,
#   loop: true
# )

# coin.play

show