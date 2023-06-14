.PHONY: all

all: emoji.fnt large.fnt small.fnt

emoji.fnt: noto_emoji_medium.ttf
	fontbm \
		--background-color 0,0,0 \
		--chars-file chars_emoji.txt \
		--font-file noto_emoji_medium.ttf \
		--font-size 30 \
		--output emoji

large.fnt: chars_large.txt yantramanav_thin.ttf
	fontbm \
		--background-color 0,0,0 \
		--chars-file chars_large.txt \
		--font-file yantramanav_thin.ttf \
		--font-size 100 \
		--output large

small.fnt: chars_small.txt yantramanav_light.ttf
	fontbm \
		--background-color 0,0,0 \
		--chars-file chars_small.txt \
		--font-file yantramanav_light.ttf \
		--font-size 30 \
		--output small
