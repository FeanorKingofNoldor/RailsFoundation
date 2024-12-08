# frozen_string_literal: true

class ThemeToggle::Component < ApplicationViewComponent
    # Simple styling for the toggle button
    style do
      base {
        %w[
          inline-flex
          items-center
          justify-center
          p-2
          rounded-lg
          hover:bg-background-secondary
          focus:outline-none
          focus:ring-2
          focus:ring-primary
          focus:ring-offset-2
          dark:focus:ring-offset-background-primary
          border
          border-text-secondary/20
        ]
      }
    end
  end