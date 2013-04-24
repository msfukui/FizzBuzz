# encoding: utf-8

class UsedFizzBuzz
  def initialize( start_number = 1, end_number = 100, algorithm = self )
    unless start_number.is_a?(Integer) && end_number.is_a?(Integer) then
      raise ArgumentError, "開始の値または終了の値に数値以外の値を指定しました。"
    end
    if start_number < 1 || end_number < 1 then
      raise ArgumentError, "開始の値または終了の値に０以下の値を指定しました。"
    end
    if start_number >= end_number then
      raise ArgumentError, "開始の値に終了の値と同じか大きい値を指定しました。"
    end

    @start_number = start_number
    @end_number   = end_number
    @algorithm = algorithm
  end

  def exec
    number = @start_number
    last   = @end_number + 1
    results = []
    while number < last do
      results << @algorithm.judge(number)
      number = number + 1
    end
    return results
  end

  def judge( number )
    raise "抽象クラス\"UsedFizzBuzz\"の抽象メソッド\"judge\"を呼び出しました。"
  end

  attr_accessor :start_number, :end_number, :algorithm
end
