class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = Regexp.escape(delimiter_line[2])
    end

    parts = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = parts.select { |n| n < 0 }

    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end

    parts.sum
  end
end