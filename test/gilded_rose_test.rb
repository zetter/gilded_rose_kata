require 'gilded_rose'
require 'minitest/autorun'

class TestGildedRose < MiniTest::Unit::TestCase
  def test_normal_item_before_sell_date
    item = GildedRose.new('normal', 10, 5)
    item.tick

    assert_equal 9, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_normal_item_on_sell_date
    item = GildedRose.new('normal', 10, 0)
    item.tick

    assert_equal(8, item.quality)
    assert_equal(-1, item.days_remaining)
  end

  def test_normal_item_after_sell_date
    item = GildedRose.new('normal', 10, -10)
    item.tick

    assert_equal 8, item.quality
    assert_equal(-11, item.days_remaining)
  end

  def test_normal_of_zero_quality
    item = GildedRose.new('normal', 0, 5)
    item.tick

    assert_equal 0, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_before_sell_date
    item = GildedRose.new('Aged Brie', 10, 5)
    item.tick

    assert_equal 11, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_before_sell_date_with_max_quality
    item = GildedRose.new('Aged Brie', 50, 5)
    item.tick

    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_on_sell_date
    item = GildedRose.new('Aged Brie', 10, 0)
    item.tick

    assert_equal 12, item.quality
    assert_equal(-1, item.days_remaining)
  end

  def test_brie_on_sell_date_near_max_quality
    item = GildedRose.new('Aged Brie', 49, 5)
    item.tick

    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_on_sell_date_with_max_quality
    item = GildedRose.new('Aged Brie', 50, 5)
    item.tick

    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_after_sell_date
    item = GildedRose.new('Aged Brie', 10, -10)
    item.tick

    assert_equal 12, item.quality
    assert_equal(-11, item.days_remaining)
  end

  def test_brie_after_sell_date_with_max_quality
    item = GildedRose.new('Aged Brie', 50, -10)
    item.tick

    assert_equal 50, item.quality
    assert_equal(-11, item.days_remaining)
  end

  def test_sulfuras_before_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 80, 5)
    item.tick

    assert_equal 80, item.quality
    assert_equal 5, item.days_remaining
  end

  def test_sulfuras_on_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 80, 0)
    item.tick

    assert_equal 80, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_sulfuras_after_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 80, -10)
    item.tick

    assert_equal 80, item.quality
    assert_equal(-10, item.days_remaining)
  end
 
  def test_backstage_pass_long_before_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 11)
    item.tick

    assert_equal 11, item.quality
    assert_equal 10, item.days_remaining
  end
  
  def test_backstage_pass_long_before_sell_date_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 11)
    item.tick

    assert_equal 50, item.quality
    assert_equal 10, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)
    item.tick

    assert_equal 12, item.quality
    assert_equal 9, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 10)
    item.tick

    assert_equal 50, item.quality
    assert_equal 9, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 6)
    item.tick

    assert_equal 12, item.quality
    assert_equal 5, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 6)
    item.tick

    assert_equal 50, item.quality
    assert_equal 5, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 5)
    item.tick

    assert_equal 13, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 5)
    item.tick

    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 1)
    item.tick

    assert_equal 13, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 1)
    item.tick

    assert_equal 50, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_backstage_pass_on_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)
    item.tick

    assert_equal 0, item.quality
    assert_equal(-1, item.days_remaining)
  end

  def test_backstage_pass_after_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, -10)
    item.tick

    assert_equal 0, item.quality
    assert_equal(-11, item.days_remaining)
  end

  def test_conjured_item_before_sell_date
    skip('Needs to be implemented')
    item = GildedRose.new('Conjured Mana Cake', 10, 5)
    item.tick

    assert_equal 9, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_conjured_item_before_sell_date_at_zero_quality
    skip('Needs to be implemented')
    item = GildedRose.new('Conjured Mana Cake', 0, 5)
    item.tick

    assert_equal 0, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_conjured_item_on_sell_date
    skip('Needs to be implemented')
    item = GildedRose.new('Conjured Mana Cake', 10, 0)
    item.tick

    assert_equal 6, item.quality
    assert_equal(-1, item.days_remaining)
  end

  def test_conjured_item_on_sell_date_at_zero_quality
    skip('Needs to be implemented')
    item = GildedRose.new('Conjured Mana Cake', 0, 0)
    item.tick

    assert_equal 0, item.quality
    assert_equal(-1, item.days_remaining)
  end

  def test_conjured_item_after_sell_date
    skip('Needs to be implemented')
    item = GildedRose.new('Conjured Mana Cake', 10, -10)
    item.tick

    assert_equal 6, item.quality
    assert_equal(-11, item.days_remaining)
  end

  def test_conjured_item_after_sell_date_at_zero_quality
    skip('Needs to be implemented')
    item = GildedRose.new('Conjured Mana Cake', 0, -10)
    item.tick

    assert_equal 0, item.quality
    assert_equal(-11, item.days_remaining)
  end
end
