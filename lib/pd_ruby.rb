# frozen_string_literal: true

require 'colorize'
require 'pd_ruby/version'

require 'pd_ruby/helper_methods'

module PDRuby
  def self.color_combinations(contrast = true)
    @color_combinations ||= if contrast
                              [{ background: :light_blue, color: :light_black }, { background: :light_yellow, color: :white }, { background: :red, color: :white }, { background: :green, color: :light_red }, { background: :default, color: :magenta }, { background: :light_white, color: :red }, { background: :light_yellow, color: :light_black }, { background: :black, color: :white }, { background: :light_white, color: :blue }, { background: :light_white, color: :default }, { background: :red, color: :light_black }, { background: :white, color: :light_magenta }, { background: :white, color: :cyan }, { background: :light_white, color: :cyan }, { background: :light_green, color: :white }, { background: :light_red, color: :black }, { background: :light_green, color: :light_white }, { background: :light_magenta, color: :light_black }, { background: :magenta, color: :light_black }, { background: :blue, color: :white }, { background: :light_white, color: :light_magenta }, { background: :light_white, color: :light_black }, { background: :light_yellow, color: :light_white }, { background: :white, color: :light_blue }, { background: :light_black, color: :blue }, { background: :green, color: :light_black }, { background: :light_black, color: :light_magenta }, { background: :white, color: :light_red }, { background: :light_magenta, color: :green }, { background: :light_green, color: :black }, { background: :default, color: :green }, { background: :light_cyan, color: :light_black }, { background: :black, color: :cyan }, { background: :light_cyan, color: :black }, { background: :cyan, color: :black }, { background: :white, color: :light_yellow }, { background: :blue, color: :light_black }, { background: :light_yellow, color: :black }, { background: :cyan, color: :white }, { background: :light_yellow, color: :green }, { background: :black, color: :light_blue }, { background: :light_white, color: :black }, { background: :light_red, color: :light_white }, { background: :light_cyan, color: :light_white }, { background: :light_blue, color: :black }, { background: :yellow, color: :white }, { background: :magenta, color: :black }, { background: :black, color: :yellow }, { background: :green, color: :light_magenta }, { background: :green, color: :red }, { background: :black, color: :blue }, { background: :light_white, color: :light_blue }, { background: :light_red, color: :green }, { background: :white, color: :light_green }, { background: :green, color: :blue }, { background: :light_green, color: :light_black }, { background: :white, color: :blue }, { background: :magenta, color: :green }, { background: :light_white, color: :light_green }, { background: :light_cyan, color: :white }, { background: :green, color: :black }, { background: :light_black, color: :magenta }, { background: :light_white, color: :light_red }, { background: :light_magenta, color: :default }, { background: :black, color: :light_white }, { background: :light_red, color: :white }, { background: :white, color: :light_black }, { background: :light_white, color: :light_yellow }, { background: :black, color: :light_red }, { background: :blue, color: :black }, { background: :light_green, color: :light_cyan }, { background: :magenta, color: :white }, { background: :magenta, color: :light_white }, { background: :black, color: :light_magenta }, { background: :red, color: :black }, { background: :black, color: :default }, { background: :light_red, color: :light_black }, { background: :default, color: :cyan }, { background: :light_blue, color: :light_white }, { background: :yellow, color: :black }, { background: :white, color: :yellow }, { background: :light_magenta, color: :light_white }, { background: :red, color: :green }, { background: :light_cyan, color: :light_red }, { background: :blue, color: :green }, { background: :white, color: :light_cyan }, { background: :light_magenta, color: :white }, { background: :light_blue, color: :white }, { background: :light_yellow, color: :default }, { background: :yellow, color: :light_black }, { background: :light_green, color: :default }, { background: :white, color: :red }, { background: :light_black, color: :cyan }, { background: :light_black, color: :green }, { background: :white, color: :magenta }, { background: :green, color: :light_white }, { background: :default, color: :light_magenta }, { background: :green, color: :light_yellow }, { background: :black, color: :light_yellow }, { background: :cyan, color: :light_black }, { background: :green, color: :magenta }, { background: :white, color: :black }, { background: :magenta, color: :default }, { background: :black, color: :green }, { background: :black, color: :magenta }, { background: :black, color: :light_cyan }, { background: :blue, color: :light_white }, { background: :light_red, color: :default }, { background: :light_white, color: :green }, { background: :light_white, color: :light_cyan }, { background: :light_white, color: :magenta }, { background: :default, color: :blue }, { background: :light_magenta, color: :black }, { background: :light_black, color: :red }, { background: :light_white, color: :yellow }, { background: :cyan, color: :light_white }, { background: :yellow, color: :light_white }, { background: :red, color: :light_white }, { background: :light_black, color: :light_red }, { background: :default, color: :yellow }, { background: :black, color: :red }]
                            else
                              String.colors.permutation(2).map do |background, color|
                                next if similar_colors?(background, color)

                                {
                                  background: background,
                                  color: color
                                }
                              end.compact.shuffle
                            end
  end

  def self.color_for(obj)
    @color_for ||= {}
    @color_for.dig(obj) || @color_for[obj] = next_color_combination
  end

  def self.next_color_combination
    @next_color_combination ||= color_combinations.dup
    if @next_color_combination.nil?
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
