class MyMatrix
  attr_reader :row, :column, :matrix

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
      arr << '| ' + new_matrix.join(' ') + ' |'
    end
    arr.join('\n')
  end

  def *(scalar)
    (0...@row).each do |r|
      return 'Cannot multiply non-numeric element' unless all_numeric?(@matrix[r])
      @matrix[r].collect! { |e| e * scalar }
    end
  end

  def +(another_matrix)
    return 'Cannot add matrix with different dimension' unless another_matrix.row == self.row && another_matrix.column == self.column
    (0...@row).each do |r|
      return 'Cannot add non-numeric element' unless (all_numeric?(@matrix[r]) && all_numeric?(another_matrix.matrix[r]))

      @matrix[r].collect!.with_index { |e, i| e + another_matrix[r + 1, i + 1] }
    end
  end

  private
    def all_numeric?(array)
      array.all? { |e| e.is_a?Numeric }
    end
end
