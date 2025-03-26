# _plugins/video_filter.rb
module Jekyll
  module VideoFilter
    def process_videos(input)
      # Convert markdown image links to videos
      video_pattern = /!\[(.*?)\]\((.*?\.(?:mp4|webm|ogg|mov))\)/i
      
      input.gsub(video_pattern) do |match|
        alt_text = $1
        video_url = $2
        
        # Determine video type
        video_type = case video_url
                     when /\.webm$/i then "webm"
                     when /\.ogg$/i then "ogg"
                     else "mp4"
                     end
        
        "<div class=\"video-container\"><video controls width=\"100%\"><source src=\"#{video_url}\" type=\"video/#{video_type}\">Your browser does not support the video tag.</video></div>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::VideoFilter)
