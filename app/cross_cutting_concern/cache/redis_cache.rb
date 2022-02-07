module Cache
    module RedisCache

        def read_cache
            # products,index
            # products,show
            # categories,index
           @entity = Rails.cache.read("#{controller_name},#{action_name}")
           if !@entity.blank?
            @is_cached = true
            render "api/#{controller_name}/#{action_name}.json.jbuilder",status: :ok
           else
            @is_cached = false
           end
        end

        def remove_cache(pattern)
            methodName = pattern.split(",")
            methodName.each do |name|
                Rails.cache.delete("#{controller_name},#{name}")
            end
        end

        def write_cache(entity)
            Rails.cache.write("#{controller_name},#{action_name}",entity,expires_in: 60.minutes)
        end

    end
end