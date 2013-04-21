# encoding: utf-8
class FizzBuzz
  def initialize( start_number = 1, end_number = 100 )
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
  end

  def FizzBuzz.judge( number )
    unless number.is_a?(Integer) then
      raise ArgumentError, "数値以外の値を指定しました。"
    end
    if number < 1 then
      raise ArgumentError, "０以下の値を指定しました。"
    end

    fizz = number % 3
    buzz = number % 5

    if fizz == 0 && buzz == 0 then
      return "Fizz Buzz"
    end
    if fizz == 0 then
      return "Fizz"
    end
    if buzz == 0 then
      return "Buzz"
    end
    return number
  end

  def exec
    number = @start_number
    last   = @end_number + 1
    results = []
    while number < last do
      results << FizzBuzz.judge(number)
      number = number + 1
    end
    return results
  end

  attr_accessor :start_number, :end_number
end
