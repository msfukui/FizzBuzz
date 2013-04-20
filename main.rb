# encoding: utf-8
base_dir  =  File.expand_path(File.join(File.dirname(__FILE__), "."))
lib_dir   =  File.join(base_dir, "lib")
$LOAD_PATH.unshift(lib_dir)

require 'FizzBuzz'

print "最初と最後の数字を入力して Enter キーを押してください。[1-100]: "
number = gets.chomp.split(/\-/)

if number == [] then
  number = [ 1, 100 ]
end
unless number.size == 2 then
  puts "* 入力エラーです。(" << number.join(',') << ")"
  puts "  プログラムを終了します。"
  exit 1
end

begin
  start_number = Integer(number[0])
  end_number   = Integer(number[1])
  out = FizzBuzz.new start_number, end_number
rescue => exception
  puts "* 例外発生！: "
  puts "  " << exception.message << "(" << number.join(',') << ")"
  puts "  プログラムを終了します。"
  exit 2
else
  puts "結果:"
  out.exec.each_with_index { |item,index|
    printf "%3d: %-9s,", index+1, item
    if (index+1) % 5 == 0 then
      print "\n"
    end
  }
  exit 0
end
