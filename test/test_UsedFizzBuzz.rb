# encoding: utf-8
require 'test_helper'

require 'UsedFizzBuzz'

class UsedFizzBuzzTest < Test::Unit::TestCase
  # test_ が呼び出される前にテストフレームワーク側で毎回呼び出される。
  # テストで使用するインスタンス生成。
  def setup
    @testcase1 = UsedFizzBuzz.new 1, 10
  end

  # test_ が呼び出された後にテストフレームワーク側で毎回呼び出される。
  #def teardown
  #end

  # コンストラクタの例外テスト
  def test_initialize_raise
    assert_raise(ArgumentError,"開始の値または終了の値に数値以外の値を指定しました。") { UsedFizzBuzz.new "Fizz", 5  }
    assert_raise(ArgumentError,"開始の値または終了の値に数値以外の値を指定しました。") { UsedFizzBuzz.new 5, "Buzz" }
    assert_raise(ArgumentError,"開始の値または終了の値に数値以外の値を指定しました。") { UsedFizzBuzz.new "Fizz", "Buzz" }

    assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { UsedFizzBuzz.new -1, 5  }
    assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { UsedFizzBuzz.new  0, 5  }
    assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { UsedFizzBuzz.new  5, 0  }
    assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { UsedFizzBuzz.new  5, -1 }
    assert_raise(ArgumentError,"開始の値または終了の値に０以下の値を指定しました。") { UsedFizzBuzz.new  0, 0  }

    assert_raise(ArgumentError,"開始の値に終了の値と同じか大きい値を指定しました。") { UsedFizzBuzz.new  5, 5  }
    assert_raise(ArgumentError,"開始の値に終了の値と同じか大きい値を指定しました。") { UsedFizzBuzz.new  6, 5  }
  end

  # メソッド judge の例外テスト
  def test_judge_raise
    assert_raise("抽象クラス\"UsedFizzBuzz\"の抽象メソッド\"judge\"を呼び出しました。") { @testcase1.judge( 1 ) }
  end
end
