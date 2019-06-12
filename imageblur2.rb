class Image

  def initialize (number)
    @number = number
  end

  def get_ones
    ones = []
    @number.each_with_index do |row, row_type|
      row.each_with_index do |item, col_type|
        if item == 1
          ones << [row_type, col_type]
        end
      end
    end
    ones
  end

  def blur!
    ones = get_ones
      @number.each_with_index do |row, row_type|
        row.each_with_index do |item, col_type|
          ones.each do |found_row_type, found_col_type|

            if row_type == found_row_type && col_type == found_col_type
              @number[row_type -1][col_type] = 1 unless row_type == 0 
              @number[row_type +1][col_type] = 1 unless row_type >= 3 
              @number[row_type][col_type -1] = 1 unless col_type == 0 
              @number[row_type][col_type +1] = 1 unless col_type >= 3 
            end
          end
        end
      end
  end

  def output_image
    @number.each do |color|
      puts color.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.output_image
puts
image.blur!

image.output_image