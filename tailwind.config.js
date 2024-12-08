module.exports = {
  content: [
    './app/assets/stylesheets/**/*.css',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.html.erb',
    './app/views/components/**/*.js',
    './app/views/components/**/*.rb'
  ],
  darkMode: ['variant', '.dark &'],
  theme: {
    extend: {
      colors: {
        primary: 'var(--color-primary)',
        'primary-hover': 'var(--color-primary-hover)',
        text: {
          primary: 'var(--color-text-primary)',
          secondary: 'var(--color-text-secondary)'
        },
        background: {
          primary: 'var(--color-background-primary)',
          secondary: 'var(--color-background-secondary)',
          center: 'var(--color-background-center)',
          edge: 'var(--color-background-edge)'
        }
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}