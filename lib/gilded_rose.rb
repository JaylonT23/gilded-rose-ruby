class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    update_quality
    update_sell_in
  end

  private

  def update_quality
    case @name
    when "Aged Brie"
      increase_quality
    when "Backstage passes to a TAFKAL80ETC concert"
      update_backstage_pass_quality
    when "Sulfuras, Hand of Ragnaros"
      # Sulfuras does not change quality or sell_in
    else
      decrease_quality
    end
  end

  def update_backstage_pass_quality
    if @days_remaining <= 0
      @quality = 0
    elsif @days_remaining <= 5
      increase_quality_by(3)
    elsif @days_remaining <= 10
      increase_quality_by(2)
    else
      increase_quality
    end
  end

  def update_sell_in
    @days_remaining -= 1 unless @name == "Sulfuras, Hand of Ragnaros"
  end

  def increase_quality
    @quality = [@quality + 1, 50].min
  end

  def decrease_quality
    @quality = [@quality - 1, 0].max
  end

  def increase_quality_by(amount)
    @quality = [@quality + amount, 50].min
  end
end
