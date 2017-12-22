require_relative '../my_matrix.rb'

describe 'MyMatrix' do
  let(:matrix) { MyMatrix.new(2, 2) }

  it 'should initialize array row x column size' do
    expect(matrix.to_a).to match_array([[nil, nil], [nil, nil]])
  end

  it 'should assign new element with row and column number' do
    matrix[1, 1] = 1
    matrix[1, 2] = 'a'
    matrix[2, 1] = 2
    matrix[2, 2] = 'b'
    expect(matrix.to_a).to match_array([[1, 'a'], [2, 'b']])
  end

  it 'should be able to access the element of matrix' do
    matrix[1, 1] = 1
    matrix[1, 2] = 'a'
    expect(matrix[1, 2]).to eq('a')
  end

  it 'should be able to print all elements of matrix' do
    matrix[1, 1] = 1
    matrix[1, 2] = 'a'
    matrix[2, 1] = 2
    expect(matrix.to_s).to eq("| 1 a |\n| 2 - |")
  end

  describe 'multiplication and addition' do
    before :each do
      matrix[1, 1] = 1
      matrix[1, 2] = 2
      matrix[2, 1] = 3
      matrix[2, 2] = 4
    end

    context 'with all elements are number and correct dimension' do
      it 'should multiply each element with a number' do
        matrix * 2
        expect(matrix).to match_array([[2, 4], [6, 8]])
      end

      it 'should add each element of matrix with each element of other matrix' do
        another_matrix = MyMatrix.new(2, 2)
        another_matrix[1, 1] = 2
        another_matrix[1, 2] = 3
        another_matrix[2, 1] = 4
        another_matrix[2, 2] = 5
        matrix + another_matrix
        expect(matrix).to match_array([[3, 5], [7, 9]])
      end
    end

    context 'with all elements not number and different dimension' do
      it 'should print error message if not number' do
        matrix[1, 1] = 1
        matrix[1, 2] = 'a'
        matrix[2, 1] = 3
        matrix[2, 2] = 4

        expect(matrix * 2).to eq('Cannot multiply non-numeric element')
      end

      it 'should print error message if not number' do
        matrix[1, 1] = 1
        matrix[1, 2] = 'a'
        matrix[2, 1] = 3
        matrix[2, 2] = 4
        another_matrix = MyMatrix.new(2, 2)
        another_matrix[1, 1] = 2
        another_matrix[1, 2] = 3
        another_matrix[2, 1] = 4
        another_matrix[2, 2] = 5

        expect(matrix + another_matrix).to eq('Cannot add non-numeric element')
      end

      it 'should print error message if dimensions are different for addition' do
        matrix[1, 1] = 1
        matrix[1, 2] = 2
        matrix[2, 1] = 3
        matrix[2, 2] = 4
        another_matrix = MyMatrix.new(2, 1)
        another_matrix[1, 1] = 2
        another_matrix[1, 2] = 3

        expect(matrix + another_matrix).to eq('Cannot add matrix with different dimension')
      end
    end
  end
end