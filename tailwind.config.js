/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {
      colors: {
        'bright-green': {
          '50': '#f1ffe5',
          '100': '#ddffc7',
          '200': '#bdff95',
          '300': '#92fe58',
          '400': '#67f51e',
          '500': '#4bdc06',
          '600': '#35b000',
          '700': '#2a8506',
          '800': '#25690b',
          '900': '#21580f',
          '950': '#0c3201',
      },
      'putty': {
        '50': '#fcf8ee',
        '100': '#f5ebd0',
        '200': '#e6cf8e',
        '300': '#debc6b',
        '400': '#d6a649',
        '500': '#cd8b33',
        '600': '#b56b2a',
        '700': '#975026',
        '800': '#7c4024',
        '900': '#663621',
        '950': '#3a1a0e',
    },
    
      
      },
    },
  },
  plugins: [],
}

