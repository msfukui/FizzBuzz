# encoding: utf-8
base_dir  =  File.expand_path(File.join(File.dirname(__FILE__), "."))
lib_dir   =  File.join(base_dir, "lib")
$LOAD_PATH.unshift(lib_dir)

require 'FizzBuzz'

print "FizzBuzz したい開始と終了の数値を入力して Enter キーを押してください。[1-100]: "
number = gets.chomp.split(/\-/)

# 何も入力されなかった時の初期値。
if number == [] then
  number = [ 1, 100 ]
end
# 形式間違ってた場合。
unless number.size == 2 then
  puts "* 入力エラーです。(" << number.join(',') << ")"
  puts "  プログラムを終了します。"
  exit 1
end

# 入力値が数値以外だった場合の例外処理受け取りのため、
# to_i() ではなく Integer() を使用。
# 例外の日本語化はちょっと面倒なのでいったんあきらめ。
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
	# 計算結果を整形して出力。
	# 3 桁以上の数値の整形はちょっと面倒なのでいったんあきらめ。
  puts "結果:"
  out.exec.each_with_index do |item,index|
    printf "%3d: %-9s ", index+start_number, item
		# 5 個毎に改行。
    if (index+1) % 5 == 0 then
      print "\n"
    end
  end
	# 表示数が 5 で割り切れない時は最後に改行を追加。
  unless (end_number-start_number+1) % 5 == 0 then
    print "\n"
  end
  exit 0
end
