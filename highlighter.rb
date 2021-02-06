require 'securerandom'
class TextHighlight
  def initialize(text, highlights)
    @html = '<p>' + text.gsub("\n\n", '</p><p>') + '</p>'
    @words = @html.split(' ')
    @highlights = highlights
  end

  def apply
    @highlights.each do |highlight|
      start_word = highlight[:start_word]
      end_word = highlight[:end_word]
      content = highlight[:comment]
      color = SecureRandom.hex(3)

      @words[start_word] = '<div class="tooltip_box" style="color: #' + color + '}"><span>' + content + '</span>' + @words[start_word]
      @words[end_word] = @words[end_word] + '</div>'
    end

    return @words.join(' ')
  end
end

