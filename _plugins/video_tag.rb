class VideoTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @input = input
    end
  
    def render(context)
      # 입력에서 URL과 타입 추출
      url = @input.strip
  
      # 비디오 타입 결정
      video_type = 'mp4'
      if url.include?('.webm')
        video_type = 'webm'
      elsif url.include?('.ogg')
        video_type = 'ogg'
      end
  
      # 동영상 플레이어 HTML 생성
      <<-HTML
  <div class="video-container">
    <video controls width="100%">
      <source src="#{url}" type="video/#{video_type}">
      Your browser does not support the video tag.
    </video>
  </div>
      HTML
    end
  end
  
  Liquid::Template.register_tag('video', VideoTag)