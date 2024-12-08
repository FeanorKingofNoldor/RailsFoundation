# app/views/components/alert/component.rb
class Alert::Component < ApplicationViewComponent
    option :variant, default: proc { :info }
    option :dismissible, default: proc { false }
    option :show_icon, default: proc { true }
  
    style do
      base {
        %w[
          flex
          items-start
          p-4
          gap-3
          rounded-lg
        ]
      }
  
      variants {
        variant {
          info {
            %w[
              bg-blue-500
              border-2
              border-info
              text-info
            ]
          }
          success {
            %w[
              bg-green-500
              border-2
              border-success
              text-success
            ]
          }
          warning {
            %w[
              bg-yellow-500
              border-2
              border-warning
              text-warning
            ]
          }
          error {
            %w[
              bg-red-500
              border-2
              border-error
              text-error
            ]
          }
        }
      }
  
      defaults {
        {
          variant: :info
        }
      }
    end
  
    private
  
    def icon_name
      case variant
      when :info
        "information-circle"
      when :warning
        "exclamation-triangle"
      when :error
        "x-circle"
      when :success
        "check"
      end
    end
  end