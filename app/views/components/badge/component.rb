# app/views/components/badge/component.rb
class Badge::Component < ApplicationViewComponent
    option :variant, default: proc { :default }  # default, success, warning, error, info
    option :size, default: proc { :md }          # sm, md
    option :pill, default: proc { false }        # rounded-full when true
    option :dot, default: proc { false }         # shows status dot
    option :removable, default: proc { false }   # shows remove button
    option :bordered, default: proc { false }    # adds border
  
    style do
      base {
        %w[
          inline-flex
          items-center
          font-medium
        ] + (pill ? ["rounded-full"] : ["rounded-md"])
      }
  
      variants {
        size {
          sm { %w[text-xs px-2 py-0.5] }
          md { %w[text-sm px-2.5 py-0.5] }
        }
  
        variant {
          default {
            bordered ? 
              %w[
                bg-background-secondary
                text-text-secondary
                border
                border-text-secondary/20
              ] :
              %w[
                bg-background-secondary
                text-text-secondary
              ]
          }
          success {
            bordered ? 
              %w[
                bg-success/10
                text-success
                border
                border-success
              ] :
              %w[
                bg-success/10
                text-success
              ]
          }
          warning {
            bordered ? 
              %w[
                bg-warning/10
                text-warning
                border
                border-warning
              ] :
              %w[
                bg-warning/10
                text-warning
              ]
          }
          error {
            bordered ? 
              %w[
                bg-error/10
                text-error
                border
                border-error
              ] :
              %w[
                bg-error/10
                text-error
              ]
          }
          info {
            bordered ? 
              %w[
                bg-info/10
                text-info
                border
                border-info
              ] :
              %w[
                bg-info/10
                text-info
              ]
          }
        }
      }
  
      defaults {
        {
          variant: :default,
          size: :md
        }
      }
    end
  
    private
  
    def dot_classes
      case variant
      when :success then "w-1.5 h-1.5 rounded-full bg-success mr-1.5"
      when :warning then "w-1.5 h-1.5 rounded-full bg-warning mr-1.5"
      when :error then "w-1.5 h-1.5 rounded-full bg-error mr-1.5"
      when :info then "w-1.5 h-1.5 rounded-full bg-info mr-1.5"
      else "w-1.5 h-1.5 rounded-full bg-text-secondary mr-1.5"
      end
    end
  end