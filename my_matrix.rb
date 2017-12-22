class MyMatrix
  attr_reader :row, :column

  def initialize(row, column)
    @matrix = Array.new(row) {Array.new(column)}
    @row = row
    @column = column
  end

  def []=(*args)
    row_index, column_index, value = *args
    @matrix[row_index-1][column_index-1] = value
  end
  
  def [](row_index, column_index)
    @matrix[row_index-1][column_index-1]
  end
  
  def to_a
    @matrix
  end

  def to_s
    arr = []
    (0...@row).each do |r|
      new_matrix = @matrix[r].collect { |e| e.nil? ? '-' : e }
      arr << "| " + new_matrix.join(' ') + " |"
    end
    arr.join("\n")
  end

  def *(scalar)
    return 'Cannot multiply non-numeric element' unless all_numeric?(self)
    (0...@row).each do |r|
      @matrix[r].collect! { |e| e * scalar }
    end
  end

  def +(another_matrix)
    return 'Cannot add matrix with different dimension' unless another_matrix.row == self.row && another_matrix.column == self.column
    return 'Cannot add non-numeric element' unless all_numeric?(self) && all_numeric?(another_matrix)
    (0...@row).each do |r|

      @matrix[r].collect!.with_index { |e, i| e + another_matrix[r + 1, i + 1] }
    end
  end

  def address(value)
    arr = []
    (1..@row).each do |r|
      (1..@column).each do |c|
        if self[r, c] == value
          arr << r
          arr << c
        end
        break if !arr.empty?
      end
      break if !arr.empty?
    end
    arr
  end

  private
    def all_numeric?(matrix_object)
      matrix_object.to_a.flatten.all? { |e| e.is_a?Numeric }
    end
end

# matrix = MyMatrix.new(3,3)
# matrix[1,1] = 'A'
# puts matrix
# arr = [1,2]
# matrix[arr[0], arr[1]] = 'B'
# puts matrix