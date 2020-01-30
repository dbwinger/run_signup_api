module RunSignup
  module DataCoercion
    def coerce_hash_values hash
      hash.each do |k, v|
        hash[k] = coerce_value(v)
      end
      hash
    end

    def coerce_value v
      case v
      when 'T'
        true
      when 'F'
        false
      when /^\d{2}\/\d{2}\/\d{4} \d{2}:\d{2}$/
        DateTime.strptime(v, '%m/%d/%Y %H:%M')
      when /^\d{2}\/\d{2}\/\d{4}$/
        Date.strptime(v, '%m/%d/%Y')
      when /^\d{1,2}\/\d{1,2}\/\d{4}$/
        Date.strptime(v, '%-m/%-d/%Y')
      when v.is_a?(Array)
        v.map { |v1| coerce_value(v1) }
      when v.is_a?(Hash)
        coerce_hash_values(v)
      else
        v
      end
    end
  end
end
