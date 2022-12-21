require 'ruby2d'

set title: 'Doggo-Adventure!'
set width: 800, height: 600
MOUNTAIN_SPEED = 1.1/6
RUN_SPEED = 3

###############################  MENU ###############################

# class MainMenu
#   def initialize
#     title_text = Text.new(
#         'Doggo Adventure!',
#         y: 100,
#         size: 72,
#         )
#         title_text.x = (Window.width - title_text.width) / 2
        

#     play_text = Text.new(
#     'PLAY',
#      y: 400,
#     size: 50,
#     )
#     play_text.x = (Window.width - play_text.width) / 2

#     about_text = Text.new(
#     'About',
#      y: 470,
#     size: 40,
#     )
#     about_text.x = (Window.width - about_text.width) / 2
    
#   end
# end

# menu = MainMenu.new
# menu_music = Music.new("assets/audio/menu-music.mp3")
# menu_music.play
# menu_music.loop = true

# on :key_down do |event|
#     case event.key
#         when 'x'
#         menu_music.stop
#         # Find way to remove menu and start game. 
#     end
#   end

###############################  GAME ###############################

# class Game
#   def initialize

  @score = 0
  game_music = Music.new("assets/audio/game-music.mp3")

        score = Text.new("Score: #{@score}")

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

            # Coins
        coin = Sprite.new(
            './assets/coin.png',
            clip_width: 16,
            time: 200,
            loop: true,
            x: 550, 
            y: 470,
            width: 35,
            height: 35
        )
        
        coin.play

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
    dog.stop
    end

     #COIN SCORE
    if dog.x >= coin.x && dog.y >= coin.y
        @score += 1
    end

    game_music.play

#   end
# end

show