# Button Component

A flexible button component that can be used for links, form submissions, and regular button actions.

## Basic Usage

```erb
<%# Regular button %>
<%= component("Button") { "Click me" } %>

<%# Secondary variant %>
<%= component("Button", variant: :secondary) { "Secondary" } %>
```

## Variants

The button comes in two variants:
- `:primary` (default) - Filled button with primary color
- `:secondary` - Light background with border

## Sizes

Three sizes are available:
- `:sm` - Small button
- `:md` (default) - Medium button
- `:lg` - Large button

```erb
<%= component("Button", size: :sm) { "Small" } %>
<%= component("Button", size: :lg) { "Large" } %>
```

## As Links

For navigation, use the `href` option:
```erb
<%= component("Button", href: some_path) { "Go to Page" } %>

<%# With HTTP method %>
<%= component("Button", 
              href: resource_path(@resource), 
              method: :delete) do %>
  Delete
<% end %>
```

## In Forms

```erb
<%# Submit button %>
<%= component("Button", type: 'submit') { "Submit" } %>

<%# Reset button %>
<%= component("Button", 
              variant: :secondary, 
              type: 'reset') { "Reset" } %>
```

## With Stimulus

```erb
<%= component("Button", 
              data: { 
                controller: "my-controller",
                action: "click->my-controller#handleClick"
              }) do %>
  Click Handler
<% end %>
```

## States

Disabled state:
```erb
<%= component("Button", disabled: true) { "Cannot Click" } %>
```

## Available Options

- `variant`: `:primary` (default) or `:secondary`
- `size`: `:sm`, `:md` (default), or `:lg`
- `type`: HTML button type ('button', 'submit', 'reset')
- `href`: If present, renders as a link
- `method`: HTTP method for links (`:post`, `:delete`, etc.)
- `data`: Hash of data attributes
- `disabled`: Boolean to disable the button

## Directory Structure

```
app/views/components/button/
├── component.rb         # Component class
├── preview.rb          # Preview class
├── preview/            # Preview templates
│   ├── variants.html.erb
│   ├── behaviors.html.erb
│   └── states.html.erb
└── README.md           # This file
```

## Previewing

View the component previews at:
```
/rails/view_components/button/variants
/rails/view_components/button/behaviors
/rails/view_components/button/states
```
