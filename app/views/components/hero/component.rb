# app/views/components/hero/component.rb
class Hero::Component < ApplicationViewComponent
    option :announcement_text, default: proc { nil }
    option :announcement_link, default: proc { "#" }
    option :title
    option :description
    option :primary_button
    option :secondary_button
  
    style do
      base {
        %w[relative isolate px-6 pt-14 lg:px-8]
      }
    end
  end