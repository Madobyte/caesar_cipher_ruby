def caesar_cipher(string, shift)
  shifted_string = []

  # Entered shift number is not a number
  if shift.to_i.is_a? Numeric
    puts "Enter valid shift number!"

  #Handles if shift is negative
  elsif shift.to_i.between?(0, -26)
    caesar_cipher(string, shift.to_i + 26)
  elsif shift.to_i < -26
    caesar_cipher(string, shift.to_i.divmod(26)[1] + 26)
  
  #Main logic
  else
    string.split('').map do |char|
      code = char.ord.to_i
      
      #Uppercase characters
      if code.between?(65, 90)
        new_code = ((code - 65 + shift.to_i) % 26) + 65
        shifted_string.push(new_code.chr)
      
      #Lowercase characters
      elsif code.between?(97, 122)
        new_code = ((code - 97 + shift.to_i) % 26) + 97
        shifted_string.push(new_code.chr)
      
      #Other characters
      else
        shifted_string.push(char)
      end
    end
  end
  p shifted_string.join('')
end

puts "Enter string to encrpt:"
string = gets.chomp
puts "Enter the shift:"
shift = gets.chomp
caesar_cipher(string, shift)