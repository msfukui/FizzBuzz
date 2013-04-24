# encoding: utf-8
require 'UsedFizzBuzz'

class FizzBuzz < UsedFizzBuzz
  def judge( number )
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
end
