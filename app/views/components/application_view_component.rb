class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer

  include ApplicationHelper
  include ViewComponentContrib::StyleVariants

  style_config.postprocess_with do |classes|
    TailwindMerge::Merger.new.merge(classes.join(" "))
  end

  class << self
    def component_name
      @component_name ||= name.sub(/::Component$/, "").underscore
    end

    def identifier
      @identifier ||= component_name.gsub("_", "-").gsub("/", "--")
    end

    def self.identifier
      identifier
    end
  end
end