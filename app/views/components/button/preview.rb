# frozen_string_literal: true

class Button::Preview < ApplicationViewComponentPreview
  # Match the full-width container style from our working view
  self.container_class = "min-h-screen bg-background-edge"

  def variants
    render_with_template(locals: {
      variants: [:primary, :secondary],
      sizes: [:sm, :md, :lg]
    })
  end

  def behaviors
    render_with_template
  end

  def states
    render_with_template
  end
end