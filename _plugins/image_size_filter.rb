require 'jekyll'
require 'fastimage'

module Jekyll
  module ImageSizeFilter
    def image_size(input)
      match = input.match(/!\[(.*?)\|\s*(\d+)x(\d+)\]\((.*?)\)/)
      return input unless match

      alt_text = match[1]
      width = match[2]
      height = match[3]
      img_src = match[4]

      "<img src='#{img_src}' alt='#{alt_text}' width='#{width}' height='#{height}'>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::ImageSizeFilter)
