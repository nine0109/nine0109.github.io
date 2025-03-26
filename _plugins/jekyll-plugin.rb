# _plugins/video_converter.rb
module Jekyll
  class VideoConverter < Converter
    safe true
    priority :high

    def matches(ext)
      ext =~ /^\.md$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      # Regular expression to find markdown image links to video files
      video_pattern = /!\[(.*?)\]\((.*?\.(?:mp4|webm|ogg|mov))\)/i
      
      # Replace the pattern with video tags
      content.gsub(video_pattern) do |match|
        alt_text = $1
        video_url = $2
        
        # Determine video type from extension
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
