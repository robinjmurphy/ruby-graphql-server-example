module Fields
  module Episodes
    def episodes opts
      sort_direction = opts[:sort_direction]
      limit = opts[:limit]
      order = get_order sort_direction

      if (limit)
        episodes_dataset.order(order).limit(limit)
      else
        episodes_dataset.order(order).all
      end
    end

    private
    def get_order sort_direction
      sort_direction == 'desc' ? Sequel.desc(:id) : :id
    end
  end
end
