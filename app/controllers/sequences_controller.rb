class SequencesController < ApplicationController
  def index
  end

  def result
    numbers = params[:numbers].split.map(&:to_i)

    segments = []
    current_segment = []
    longest_segment = []
    count = 0

    numbers.each do |num|
      if Math.sqrt(num) % 1 == 0
        current_segment << num
      else
        if current_segment.length > 1
          segments << { start: numbers.index(current_segment.first), end: numbers.index(current_segment.last) }
          count += 1
          if current_segment.length > longest_segment.length
            longest_segment = current_segment
          end
        end
        current_segment = []
      end
    end

    @result = {
      count: count,
      longest_segment: longest_segment,
      segments: segments
    }
  end
end

