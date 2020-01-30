module RunSignup
  module DataCoercion
    def coerce_hash_values hash
      if hash
        hash.each do |k, v|
          hash[k] = coerce_value(v)
        end
      end
      hash
    end

    def coerce_value v
      if v.is_a?(Array)
        v.map { |v1| coerce_value(v1) }
      elsif v.is_a?(Hash)
        coerce_hash_values(v)
      else
        case v
        when 'T'
          true
        when 'F'
          false
        when /^\d{1,2}\/\d{1,2}\/\d{4} \d{2}:\d{2}$/
          DateTime.strptime(v, '%m/%d/%Y %H:%M').to_s
        when /^\d{1,2}\/\d{1,2}\/\d{4}$/
          Date.strptime(v, '%m/%d/%Y').to_s
        else
          v
        end
      end
    end
  end
end
