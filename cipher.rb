class AtbashCipher

  def initialize(abc)
    @abc = abc.split('')
  end

  def encode(str)
    array=str.split('')
    i = 0
    while i < array.length
      n = @abc.length - i - 1
      puts "n=#{n}  #{@abc[n]}  #{array[i]}"
      i += 1
    end
  end

  def decode(str)
    array = str.split('')
    i=0
    while i < array.length
    end
  end
end
