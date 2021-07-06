const colors = require('tailwindcss/colors');

module.exports = {
  purge: [],
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: { colors: { gray: colors.trueGray } },
  },
  variants: {
    extend: { opacity: ['disabled'] },
  },
  plugins: [],
}
