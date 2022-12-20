require 'ruby2d'

coin = Sprite.new(
  './assets/coin.png',
  clip_width: 16,
  time: 200,
  loop: true
)

coin.play

show