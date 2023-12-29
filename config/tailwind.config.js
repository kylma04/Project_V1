/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      backgroundImage: {
        'hero-pexels-pixabay-534151': "url('/app/assets/images/pexels-pixabay-534151.jpg')"
      }
    },
  },
  plugins: [],
}