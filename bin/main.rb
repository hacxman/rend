#!/usr/bin/ruby

require 'rubygems'
require 'chunky_png'

png = ChunkyPNG::Image.new(64, 64, ChunkyPNG::Color::TRANSPARENT)
png.save('test.png')
