# frozen_string_literal: true

class Button::Component < ApplicationViewComponent
  option :variant, default: proc { :primary }
  option :size, default: proc { :md }
  option :type, default: proc { 'button' }
  option :href, default: proc { nil }
  option :method, default: proc { nil }
  option :data, default: proc { {} }
  option :disabled, default: proc { false }

  private

  def processed_variant
    variant.presence&.to_sym || :primary
  end

  def processed_size
    size.presence&.to_sym || :md
  end

  style do
    base {
      %w[
        inline-flex
        items-center
        justify-center
        font-medium
        rounded-lg
        focus:outline-none
        focus:ring-2
        focus:ring-offset-2
        transition-colors
        duration-200
        disabled:opacity-50
        disabled:cursor-not-allowed
        border-2          # Changed to border-2 for stronger border
      ]
    }
  
    variants {
      size {
        sm { %w[px-3 py-1.5 text-sm] }
        md { %w[px-4 py-2 text-base] }
        lg { %w[px-6 py-3 text-lg] }
      }
  
      variant {
        primary {
          %w[
            border-primary
            text-background-primary
            focus:ring-primary
            focus:ring-offset-background-edge
            dark:focus:ring-offset-background-primary
          ] + [
            "bg-gradient-to-r from-teal-400 to-blue-500 hover:from-pink-500 hover:to-orange-500"
          ]
        }
        secondary {
          %w[
            border-text-secondary
            text-text-primary
            focus:ring-primary
            focus:ring-offset-background-edge
            dark:focus:ring-offset-background-primary
          ] + [
            "bg-gradient-to-r from-teal-200 to-blue-200 hover:from-pink-200 hover:to-orange-200"
          ]
        }
      }
    }
  
    defaults {
      {
        variant: :primary,
        size: :md
      }
    }
  end
end