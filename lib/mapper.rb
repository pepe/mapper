class Mapper
  attr_accessor :mapping, :output_class
  # Initialize new mapper with mapping hash
  # mapping - Hash with mapping with given structure:
  # {
  #   product_class: {
  #     simple_input_attribute: :simple_output_attribute,
  #     table_mapped_input_attribute: {
  #       tabble_mapped_output_attribute: {
  #         "first_input_value" => "first_output_value",
  #         "second_input_value" => "second_output_command"
  #       }
  #     }
  #   }
  # }
  def initialize(mapping)
    self.mapping = mapping.values.first
    self.output_class = Object.const_get(mapping.keys.first.to_s.capitalize)
  end

  # input - Input values array.
  #   Each Element is mapped to one instance of the product_class type
  def map(input)
    output_arr = []

    input.each do |input_hash|
      output = {}

      mapping.each_pair do |attribute_mapping|
        input_attr = attribute_mapping.first
        case attr = attribute_mapping.last
        when Symbol
          output[attr] = input_hash[input_attr]
        when Hash
          value = attr.values.last[input_hash[input_attr]]
          output[attr.first.first] = value
        end
      end

      output_arr << @output_class.new(output)
    end

    return output_arr
  end
end
