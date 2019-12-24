module.exports = {
    transform: {
      '^.+\\.js?$': 'babel-jest',
    },
    transformIgnorePatterns: ['/node_modules/', '../priv/static/js'],
    collectCoverage: true,
    collectCoverageFrom: ['**/*.{js}', '!**/node_modules/**', '!**/priv/**'],
    coverageReporters: ['text-summary'],
  };