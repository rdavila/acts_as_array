module ActsAsArray
  module ClassMethods
    def acts_as_array(*args)
      options = args.extract_options!
      separator = options.delete(:separator) || ','
      args.each do |attr|
        class_eval do
          define_method "#{attr}=".to_sym do |value|
            write_attribute(attr, value.join(separator))
          end

          define_method attr do
            value = read_attribute(attr)
            value.nil? ? [] : value.split(separator)
          end
        end
      end
    end
  end

  def self.included(base)
    base.send :extend, ClassMethods
  end
end

ActiveRecord::Base.send :include, ActsAsArray
