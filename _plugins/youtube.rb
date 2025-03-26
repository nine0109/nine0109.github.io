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
      # Step 1: Convert markdown image links to video files
      video_pattern = /!\[(.*?)\]\((.*?\.(?:mp4|webm|ogg|mov))\)/i
      
      content = content.gsub(video_pattern) do |match|
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
      
      # Step 2: Convert YouTube wiki links
      youtube_pattern = /\[\[(https?:\/\/(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]{11})(?:&[^:]*)?)::(youtube|youtubevideo)\]\]/i
      
      content = content.gsub(youtube_pattern) do |match|
        youtube_url = $1
        video_id = $2
        
        "<div class=\"video-container\"><iframe src=\"https://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe></div>"
      end
      
      # Step 3: Convert youtu.be short links
      youtube_short_pattern = /\[\[(https?:\/\/(?:www\.)?youtu\.be\/([a-zA-Z0-9_-]{11})(?:\?[^:]*)?)::(youtube|youtubevideo)\]\]/i
      
      content = content.gsub(youtube_short_pattern) do |match|
        youtube_url = $1
        video_id = $2
        
        "<div class=\"video-container\"><iframe src=\"https://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe></div>"
      end
      
      # Step 4: Also convert markdown links to YouTube videos
      youtube_md_pattern = /!\[(.*?)\]\((https?:\/\/(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]{11})(?:&[^)]*)?)\)/i
      
      content = content.gsub(youtube_md_pattern) do |match|
        alt_text = $1
        youtube_url = $2
        video_id = $3
        
        "<div class=\"video-container\"><iframe src=\"https://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe></div>"
      end
      
      # Step 5: Also convert markdown links to youtu.be short URLs
      youtube_short_md_pattern = /!\[(.*?)\]\((https?:\/\/(?:www\.)?youtu\.be\/([a-zA-Z0-9_-]{11})(?:\?[^)]*)?)\)/i
      
      content = content.gsub(youtube_short_md_pattern) do |match|
        alt_text = $1
        youtube_url = $2
        video_id = $3
        
        "<div class=\"video-container\"><iframe src=\"https://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe></div>"
      end
      
      content
    end
  end
end
