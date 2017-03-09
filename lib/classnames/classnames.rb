module Classnames

  def classnames(*args)
    classes = []

    args.each do |item|
      next unless item.present?

      if item.is_a?(String) || item.is_a?(Numeric)
        classes.push(item);
      elsif item.is_a?(Array)
        classes.push(classnames(*item));
      elsif item.is_a?(Hash)
        item.each do |k, v|
          if v.present?
            classes.push(k);
          end
        end
      end
    end

    classes.join(' ')
  end

end

ActionView::Base.send :include, Classnames
