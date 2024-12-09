# app/views/components/dropdown/preview.rb
class Dropdown::Preview < ApplicationViewComponentPreview

  def default
    render Dropdown::Component.new(
      text: "Options",
      items: [
        { text: "Account settings", href: "#" },
        { text: "Support", href: "#" },
        { text: "License", href: "#" },
        { text: "Sign out", href: "#", method: :post }
      ]
    )
  end
 
  def with_custom_text
    render Dropdown::Component.new(
      text: "Account",
      items: [
        { text: "Profile", href: "#" },
        { text: "Settings", href: "#" },
        { text: "Logout", href: "#", method: :post }
      ]
    )
  end
 end