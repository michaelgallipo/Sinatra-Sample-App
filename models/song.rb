class Song < ActiveRecord::Base
  def length
    if seconds
      minutes = seconds / 60
      seconds_left = seconds % 60
      formatted_seconds = seconds_left.to_s.rjust(2, "0")
      "#{minutes}:#{formatted_seconds}"
    end
  end

  def lyric_lines
    lyrics.split("\n")
  end
end