Solid::MethodWhitelist
  .allow(
    BasicObject => [:!, :!=, :==],
    Object => [:present?, :blank?, :in?, :to_json],
    Kernel => [:nil?, :!~],
    Module => [:==],
    Enumerable => [:sort],
    Comparable => [:<, :<=, :==, :>, :>=, :between?],
    Numeric => [:blank?, :+@,
      :second, :seconds, :minute, :minutes, :hour, :hours, :day, :days, :week, :weeks,
      :bytes, :kilobytes, :megabytes, :gigabytes, :terabytes, :petabytes, :exabytes],
    Integer => [:multiple_of?, :month, :months, :year, :years, :to_json],
    String  => [:gsub, :strip, :chop, :chomp, :start_with?, :end_with?,
      :[], :length, :size, :empty?, :=~, :split, :upcase, :downcase, :capitalize, :squeeze, :tr,
      :exclude?, :truncate]
  ).deny(
    Module => [:const_get, :const_set, :const_defined?, :freeze, :ancestors],
    Class => [:new, :allocate, :superclass],
    String => [:freeze]
  )

if defined?(JSON::Ext::Generator::GeneratorMethods::Fixnum) &&
   defined?(JSON::Ext::Generator::GeneratorMethods::Bignum)
  Solid::MethodWhitelist.allow(
    JSON::Ext::Generator::GeneratorMethods::Fixnum => [:to_json],
    JSON::Ext::Generator::GeneratorMethods::Bignum => [:to_json],
  )
end
