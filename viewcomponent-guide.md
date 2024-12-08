# ViewComponent Development Guide

## Component Structure
Each component should be organized in a sidecar structure under `app/views/components/`:

```
app/views/components/example_name/
├── component.rb          # Component class
├── component.html.erb    # Template
├── controller.js         # Stimulus controller (if needed)
├── preview.rb           # Component preview
└── preview/            # Preview templates directory
    └── default.html.erb  # Preview templates
```

## Creating New Components

### Using the Generator
Generate a new component using:
```bash
rails generate view_component ExampleName attribute1 attribute2
```

This will create:
- Component class
- Template file
- Spec file
- Preview file (unless --skip-preview flag is used)

### Component Class Structure
```ruby
# frozen_string_literal: true

class ExampleName::Component < ApplicationViewComponent
  # Define options (props)
  option :attribute1
  option :attribute2, default: proc { "default_value" }

  # Define styling using view_component-contrib
  style do
    base {
      %w[
        class-1
        class-2
      ]
    }

    variants {
      variant_name {
        option1 {
          %w[classes-for-option1]
        }
        option2 {
          %w[classes-for-option2]
        }
      }
    }

    defaults {
      {
        variant_name: :option1
      }
    }
  end
end
```

### Stimulus Integration
If the component needs JavaScript functionality:

```javascript
// controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["targetName"]
  
  connect() {
    // Initialization code
  }

  // Action methods
  someAction() {
    // Action code
  }
}
```

In the template:
```erb
<div 
  data-controller="<%= component_identifier("ExampleName") %>"
  data-action="click-><%= component_identifier("ExampleName") %>#someAction"
>
  <%= content %>
</div>
```

## Using Components

### Basic Rendering
```erb
<%= component("ExampleName") { "Content" } %>
```

### With Options/Props
```erb
<%= component("ExampleName", attribute1: "value", attribute2: "value") do %>
  Component content
<% end %>
```

### Without Content Block
```erb
<%= component("ExampleName", attribute1: "value") %>
```

## Preview System

### Basic Preview Structure
```ruby
class ExampleName::Preview < ApplicationViewComponentPreview
  # Optional container styling
  self.container_class = "max-w-xl p-8 space-y-4"

  def default
    render ExampleName::Component.new do
      "Default example"
    end
  end

  def with_options
    render ExampleName::Component.new(attribute1: "value") do
      "Example with options"
    end
  end

  def with_template
    render_with_template(locals: {
      items: [
        { attribute1: "value1" },
        { attribute1: "value2" }
      ]
    })
  end
end
```

### Preview Templates
```erb
# preview/with_template.html.erb
<div class="space-y-4">
  <% items.each do |item| %>
    <%= render ExampleName::Component.new(**item) do %>
      Content for <%= item[:attribute1] %>
    <% end %>
  <% end %>
</div>
```

## Best Practices

1. **Naming**
   - Use PascalCase for component names
   - Use snake_case for file names and directories

2. **Props/Options**
   - Use `option` from dry-initializer for props
   - Provide default values when appropriate
   - Document expected types and purposes

3. **Styling**
   - Use the style block for Tailwind classes
   - Group related classes in the base block
   - Use variants for different component states/types
   - Define defaults for variants

4. **JavaScript**
   - Keep Stimulus controllers focused on one responsibility
   - Use data-attributes for configuration
   - Follow stimulus conventions for actions and targets

5. **Testing**
   - Write specs for different component states
   - Test both Ruby and JavaScript functionality
   - Use preview system for visual testing

## Accessing Previews
Access component previews at:
```
/rails/view_components/example_name/default
/rails/view_components/example_name/with_options
/rails/view_components/example_name/with_template
```
