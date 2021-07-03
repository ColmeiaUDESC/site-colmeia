const colors = require('tailwindcss/colors');

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: { colors: { gray: colors.trueGray } },
  },
  variants: {
    extend: { opacity: ['disabled'] },
  },
  plugins: [],
}
