# frozen_string_literal: true

require 'colorize'
require 'pd_ruby/version'

require 'pd_ruby/helper_methods'

module PDRuby
  def self.color_combinations
    @color_combinations ||= String.colors.permutation(2).map do |background, color|
      next if similar_colors?(background, color)

      {
        background: background,
        color: color
      }
    end.compact.shuffle
  end

  def self.color_for(obj)
    @color_for ||= {}
    @color_for.dig(obj) || @color_for[obj] = next_color_combination
  end

  def self.next_color_combination
    @next_color_combination ||= color_combinations.dup
    if @next_color_combination.blank?
      @next_color_combination = color_combinations.dup
    end
    @next_color_combination.shift
  end

  def self.similar_colors?(color1, color2)
    return true if color1 == color2
    return true if color1.to_s == "light_#{color2}"
    return true if color2.to_s == "light_#{color1}"

    false
  end
end
