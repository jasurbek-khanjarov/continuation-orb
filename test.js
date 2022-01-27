const testDisplayText = require('./main');

test('check if input text is displayed', () => {
  expect(testDisplayText("Hello World")).toBe(true);
});
