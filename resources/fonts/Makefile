small = 30
large = 100

.PHONY: all

all: noto_emoji_medium_small.fnt yantramanav_light_small.fnt yantramanav_thin_large.fnt

noto_emoji_medium_small.fnt: noto_emoji_medium.ttf
	fontbm --font-file noto_emoji_medium.ttf --output noto_emoji_medium_small --font-size $(small) --chars-file chars_emoji.txt --background-color 0,0,0

yantramanav_light_small.fnt: chars_small.txt yantramanav_light.ttf
	fontbm --font-file yantramanav_light.ttf --output yantramanav_light_small --font-size $(small) --chars-file chars_small.txt --background-color 0,0,0

yantramanav_thin_large.fnt: chars_large.txt yantramanav_thin.ttf
	fontbm --font-file yantramanav_thin.ttf --output yantramanav_thin_large --font-size $(large) --chars-file chars_large.txt --background-color 0,0,0
