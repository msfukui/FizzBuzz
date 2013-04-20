# encoding: utf-8
require 'test/unit'
require 'FizzBuzz'

class FizzBuzzTest < Test::Unit::TestCase
	def setup
		assert_raise(ArgumentError,"開始の値または終了の値に数値以外の値を指定しました。") { FizzBuzz.new "Fizz", 5  }
		assert_raise(ArgumentError,"開始の値または終了の値に数値以外の値を指定しました。") { FizzBuzz.new 5, "Buzz" }
		assert_raise(ArgumentError,"開始の値または終了の値に数値以外の値を指定しました。") { FizzBuzz.new "Fizz", "Buzz" }

		assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { FizzBuzz.new -1, 5  }
		assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { FizzBuzz.new  0, 5  }
		assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { FizzBuzz.new  5, 0  }
		assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { FizzBuzz.new  5, -1 }
		assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { FizzBuzz.new  0, 0  }

		assert_raise(ArgumentError,"開始の値に終了の値と同じか大きい値を指定しました。") { FizzBuzz.new  5, 5  }
		assert_raise(ArgumentError,"開始の値に終了の値と同じか大きい値を指定しました。") { FizzBuzz.new  6, 5  }

		@testcase1  = FizzBuzz.new   1, 10
		@testmean1  = [  1,  2, "Fizz",  4, "Buzz", "Fizz",  7,  8, "Fizz", "Buzz" ]
		@testcase2  = FizzBuzz.new  11, 20
		@testmean2  = [ 11, "Fizz", 13, 14, "Fizz Buzz", 16, 17, "Fizz", 19, "Buzz" ]
		@testcase3  = FizzBuzz.new  21, 30
		@testmean3  = [ "Fizz", 22, 23, "Fizz", "Buzz", 26, "Fizz", 28, 29, "Fizz Buzz" ]
		@testcase4  = FizzBuzz.new  31, 40
		@testmean4  = [ 31, 32, "Fizz", 34, "Buzz", "Fizz", 37, 38, "Fizz", "Buzz" ]
		@testcase5  = FizzBuzz.new  41, 50
		@testmean5  = [ 41, "Fizz", 43, 44, "Fizz Buzz", 46, 47, "Fizz", 49, "Buzz" ]
		@testcase6  = FizzBuzz.new  51, 60
		@testmean6  = [ "Fizz", 52, 53, "Fizz", "Buzz", 56, "Fizz", 58, 59, "Fizz Buzz" ]
		@testcase7  = FizzBuzz.new  61, 70
		@testmean7  = [ 61, 62, "Fizz", 64, "Buzz", "Fizz", 67, 68, "Fizz", "Buzz" ]
		@testcase8  = FizzBuzz.new  71, 80
		@testmean8  = [ 71, "Fizz", 73, 74, "Fizz Buzz", 76, 77, "Fizz", 79, "Buzz" ]
		@testcase9  = FizzBuzz.new  81, 90
		@testmean9  = [ "Fizz", 82, 83, "Fizz", "Buzz", 86, "Fizz", 88, 89, "Fizz Buzz" ]
		@testcase10 = FizzBuzz.new  91,100
		@testmean10 = [ 91, 92, "Fizz", 94, "Buzz", "Fizz", 97, 98, "Fizz", "Buzz" ]
		@testcase11 = FizzBuzz.new 101,110
		@testmean11 = [ 101, "Fizz", 103, 104, "Fizz Buzz", 106, 107, "Fizz", 109, "Buzz"]
		@testcase12 = FizzBuzz.new 111,120
		@testmean12 = [ "Fizz", 112, 113, "Fizz", "Buzz", 116, "Fizz", 118, 119, "Fizz Buzz" ]

		@testcase = FizzBuzz.new
		@testmean = @testmean1 + @testmean2 + @testmean3 + @testmean4 + @testmean5  \
		          + @testmean6 + @testmean7 + @testmean8 + @testmean9 + @testmean10
	end

	def test_judge_raise
		assert_raise(ArgumentError,"数値以外の値を指定しました。") { FizzBuzz.judge( "Fizz" ) }
		assert_raise(ArgumentError,"数値以外の値を指定しました。") { FizzBuzz.judge( "Buzz" ) }
		assert_raise(ArgumentError,"数値以外の値を指定しました。") { FizzBuzz.judge( "Fizz Buzz" ) }

		assert_raise(ArgumentError,"０以下の値を指定しました。") { FizzBuzz.judge(   0 ) }
		assert_raise(ArgumentError,"０以下の値を指定しました。") { FizzBuzz.judge(  -1 ) }
		assert_raise(ArgumentError,"０以下の値を指定しました。") { FizzBuzz.judge(  -3 ) }
		assert_raise(ArgumentError,"０以下の値を指定しました。") { FizzBuzz.judge(  -5 ) }
		assert_raise(ArgumentError,"０以下の値を指定しました。") { FizzBuzz.judge(  -8 ) }
		assert_raise(ArgumentError,"０以下の値を指定しました。") { FizzBuzz.judge( -15 ) }
	end

	def test_judge
		assert_equal 1,          FizzBuzz.judge( 1 )
		assert_equal 2,          FizzBuzz.judge( 2 )
		assert_equal "Fizz",     FizzBuzz.judge( 3 )
		assert_equal "Buzz",     FizzBuzz.judge( 5 )
		assert_equal 8,          FizzBuzz.judge( 8 )
		assert_equal "Fizz Buzz",FizzBuzz.judge( 15 )
	end

	def test_exec
		assert_equal @testmean1 , @testcase1.exec
		assert_equal @testmean2 , @testcase2.exec
		assert_equal @testmean3 , @testcase3.exec
		assert_equal @testmean4 , @testcase4.exec
		assert_equal @testmean5 , @testcase5.exec
		assert_equal @testmean6 , @testcase6.exec
		assert_equal @testmean7 , @testcase7.exec
		assert_equal @testmean8 , @testcase8.exec
		assert_equal @testmean9 , @testcase9.exec
		assert_equal @testmean10, @testcase10.exec
		assert_equal @testmean11, @testcase11.exec
		assert_equal @testmean12, @testcase12.exec

		assert_equal @testmean, @testcase.exec
	end
end
