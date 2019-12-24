module.exports = {
    root: true,
    env: {
      es6: true,
      browser: true,
      node: true,
    },
    extends: [
      'eslint:recommended',
      'plugin:prettier/recommended',
      'plugin:jest/recommended',
    ],
    plugins: ['babel', 'import', 'prettier'],
    parserOptions: {
      sourceType: 'module',
      parser: 'babel-eslint',
    },
    rules: {
      'prettier/prettier': [
        'error',
        {
          singleQuote: true,
          trailingComma: 'all',
        },
      ],
    },
  };