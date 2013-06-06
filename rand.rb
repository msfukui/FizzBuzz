# encoding: utf-8
base_dir  =  File.expand_path(File.join(File.dirname(__FILE__), "."))
lib_dir   =  File.join(base_dir, "lib")
$LOAD_PATH.unshift(lib_dir)

require 'UsedFizzBuzz'
require 'FizzBuzz'

print "ランダムに数字を生成してその FizzBuzz 結果を表示します。\n"
print "生成したい乱数の最大値を入力して Enter キーを押してください。[100]: "
number = gets.chomp

# 何も入力されなかった時の初期値。
if number == "" then
  number = "100"
end

begin
  out = FizzBuzz.new
rescue => exception
  puts "* 例外発生！: "
  puts "  " << exception.message << "(" << number << ")"
  puts "  プログラムを終了します。"
  exit 1
else
  # 計算結果を整形して出力。
  begin
    result = out.rand_judge Integer( number )
  rescue => exception
    puts "* 例外発生！: "
    puts "  " << exception.message << "(" << number << ")"
    puts "  プログラムを終了します。"
    exit 2
  else
    puts "結果:"
    printf "  入力した数字: %s\n", number
    printf "  生成した乱数: %d\n", out.random_number
    printf "  FizzBuzz結果: %s\n", result
    exit 0
  end
end
