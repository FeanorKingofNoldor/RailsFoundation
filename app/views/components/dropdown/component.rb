# app/views/components/dropdown/component.rb
class Dropdown::Component < ApplicationViewComponent
    option :text, default: proc { "Options" }
    option :items, default: proc { [] }
   
    style do
        base {
          %w[relative inline-block text-left]
        }
      
        variants {
          text {
            primary {
              %w[text-gray-900] 
            }
            secondary {
              %w[text-gray-700]
            }
          }
        }
      
        defaults {
          {
            text: :secondary
          }
        }
      end
   end