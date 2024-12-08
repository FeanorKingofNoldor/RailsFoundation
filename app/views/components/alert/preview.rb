# frozen_string_literal: true

class Alert::Preview < ApplicationViewComponentPreview
  self.container_class = "p-8 space-y-4 bg-background-edge"

  def default
    render_with_template(locals: {
      alerts: [
        {
          variant: :info,
          message: "This is an information message that you might want to know about.",
          color: "var(--color-info)"
        },
        {
          variant: :success,
          message: "Your action was completed successfully!",
          color: "var(--color-success)"
        },
        {
          variant: :warning,
          message: "Warning! This action might have consequences.",
          color: "var(--color-warning)"
        },
        {
          variant: :error,
          message: "Error! Something went wrong while processing your request.",
          color: "var(--color-error)"
        }
      ]
    })
  end
end